//
//  CalcuCalculatorKeyExtensions.swift
//  CalculatorPracticeTask
//
//  Created by Richa Agrawal on 05/03/25.
//

import Foundation

extension CalculatorKey {
    static let operationKeys: [CalculatorKey] = [
        .multiply, .divide, .plus, .minus
    ]

    static let numberKeys: [CalculatorKey] = [
        .nine, .eight, .seven, .six, .five, .four,
        .three, .two, .one, .zero
    ]

    func getText() -> String {
        switch self {
        case .nine, .eight, .seven, .six, .five,
             .four, .three, .two, .one, .zero:
            return String(self.rawValue)
        case .plus:
            return "+"
        case .minus:
            return "-"
        case .multiply:
            return "*"
        case .divide:
            return "/"
        case .point:
            return "."
        case .plusMinus:
            return "-"
        default:
            return ""
        }
    }

    func isOperationKey() -> Bool {
        return CalculatorKey.operationKeys.contains(self)
    }

    func isNumber() -> Bool {
        return CalculatorKey.numberKeys.contains(self)
    }
}
