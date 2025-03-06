//
//  CalculatorEngine.swift
//  CalculatorPracticeTask
//
//  Created by Richa Agrawal on 05/03/25.
//

import Foundation

class CalculatorEngine: ObservableObject {
    @Published var calculationText: String = ""
    @Published var resultText: String = ""

    private var keysPressed: [CalculatorKey] = []

    func processKeyPress(_ key: CalculatorKey) {
        var processed = true
        switch key {
        case .clear:
            clear()
            processed = false
        case .nine, .eight, .seven, .six, .five, .four, .three, .two, .one, .zero:
            processed = true
        case .plus, .minus, .multiply, .divide:
            processed = onOperationKeyPressed(key)
        case .point:
            processed = onPointKeyPressed()
        case .equal:
            processed = onEqualKeyPressed()
        case .backspace:
            processed = onBackspaceKeyPressed()
        case .plusMinus:
            processed = onPlusMinusPressed()
        }

        if processed {
            keysPressed.append(key)
            generateCalculationText()
        }
    }

    func clear() {
        keysPressed.removeAll()
        calculationText = ""
        resultText = ""
    }

    private func onOperationKeyPressed(_ key: CalculatorKey) -> Bool {
        guard !keysPressed.isEmpty else { return false }

        if lastKeyPressedIsPlusMinus() { return false }

        if lastKeyPressedIsOperation() {
            removeLastKeyPressed()
        }

        return true
    }

    private func lastKeyPressedIsOperation() -> Bool {
        return keysPressed.last?.isOperationKey() ?? false
    }

    private func lastKeyPressedIsPlusMinus() -> Bool {
        return keysPressed.last == .plusMinus
    }

    private func removeLastKeyPressed() {
        keysPressed.removeLast()
    }

    private func onEqualKeyPressed() -> Bool {
        guard !keysPressed.isEmpty else { return false }

        if lastKeyPressedIsOperation() || lastKeyPressedIsPlusMinus() {
            return false
        }

        calculationText = ""
        resultText = Calculation.getResult(keysPressed)
        keysPressed.removeAll()

        return false
    }

    private func onBackspaceKeyPressed() -> Bool {
        if !keysPressed.isEmpty {
            removeLastKeyPressed()
            generateCalculationText()
        }
        return false
    }

    private func onPointKeyPressed() -> Bool {
        if keysPressed.isEmpty || lastKeyPressedIsOperation() {
            keysPressed.append(.zero)
            return true
        }

        if pointAlreadyPressedForCurrentNumber() {
            return false
        }

        return true
    }

    private func pointAlreadyPressedForCurrentNumber() -> Bool {
        for key in keysPressed.reversed() {
            if key == .point {
                return true
            } else if key.isOperationKey() {
                return false
            }
        }
        return false
    }

    private func generateCalculationText() {
        calculationText = keysPressed.map { $0.getText() }.joined(separator: " ").trimmingCharacters(in: .whitespaces)
    }

    private func onPlusMinusPressed() -> Bool {
        if keysPressed.isEmpty { return true }

        let lastKeyPressed = keysPressed.last!
        if lastKeyPressed == .plusMinus {
            removeLastKeyPressed()
            generateCalculationText()
            return false
        }

        if lastKeyPressed.isNumber() {
            let index = findStartOfCurrentNumber()
            if keysPressed[index] == .plusMinus {
                keysPressed.remove(at: index)
            } else {
                keysPressed.insert(.plusMinus, at: index)
            }
            generateCalculationText()
            return false
        }
        return true
    }

    private func findStartOfCurrentNumber() -> Int {
        for (index, key) in keysPressed.enumerated().reversed() {
            if key.isOperationKey() {
                return index + 1
            }
        }
        return 0
    }
}
