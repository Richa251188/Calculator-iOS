//
//  Calculation.swift
//  CalculatorPracticeTask
//
//  Created by Richa Agrawal on 05/03/25.
//

import Foundation

class Calculation {
    private var keys: [CalculatorKey]
    private var number: String = ""
    private var result: Double = 0
    private var firstNumber: Bool = true
    private var operation: CalculatorKey?

    private init(keys: [CalculatorKey]) {
        self.keys = keys
    }

    static func getResult(_ keys: [CalculatorKey]) -> String {
        let calculation = Calculation(keys: keys)
        return calculation.calculateResult()
    }

    private func calculateResult() -> String {
        for key in keys {
            if key.isOperationKey() {
                processOperationKey(key)
            } else {
                number.append(key.getText())
            }
        }
        
        if let operation = operation {
            result = applyOperation(result, convertCurrentNumberTextToDouble())
            return String(result)
        }
        
        return number
    }

    private func processOperationKey(_ key: CalculatorKey) {
        if firstNumber {
            operation = key
            firstNumber = false
            result = convertCurrentNumberTextToDouble()
        } else {
            result = applyOperation(result, convertCurrentNumberTextToDouble())
        }
        number = ""
    }

    private func convertCurrentNumberTextToDouble() -> Double {
        return Double(number) ?? 0.0
    }

    private func applyOperation(_ left: Double, _ right: Double) -> Double {
        guard let operation = operation else {
            fatalError("Operation is not set")
        }

        switch operation {
        case .divide:
            return left / right
        case .minus:
            return left - right
        case .plus:
            return left + right
        case .multiply:
            return left * right
        default:
            fatalError("Unsupported operation")
        }
    }
}
