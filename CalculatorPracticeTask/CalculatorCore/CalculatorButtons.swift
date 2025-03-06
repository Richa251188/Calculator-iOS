//
//  CalculatorButtons.swift
//  CalculatorPracticeTask
//
//  Created by Richa Agrawal on 05/03/25.
//

import Foundation

class CalculatorButtons {
    static let backspace = CalculatorButton(key: .backspace, text: "←")
    static let clear = CalculatorButton(key: .clear, text: "C")
    static let plusMinus = CalculatorButton(key: .plusMinus, text: "±")
    static let divide = CalculatorButton(key: .divide, text: "/")
    static let multiply = CalculatorButton(key: .multiply, text: "*")
    static let minus = CalculatorButton(key: .minus, text: "-")
    static let plus = CalculatorButton(key: .plus, text: "+")
    static let equal = CalculatorButton(key: .equal, text: "=")
    static let nine = CalculatorButton(key: .nine, text: "9")
    static let eight = CalculatorButton(key: .eight, text: "8")
    static let seven = CalculatorButton(key: .seven, text: "7")
    static let six = CalculatorButton(key: .six, text: "6")
    static let five = CalculatorButton(key: .five, text: "5")
    static let four = CalculatorButton(key: .four, text: "4")
    static let three = CalculatorButton(key: .three, text: "3")
    static let two = CalculatorButton(key: .two, text: "2")
    static let one = CalculatorButton(key: .one, text: "1")
    static let zero = CalculatorButton(key: .zero, text: "0")
    static let point = CalculatorButton(key: .point, text: ".")

    static let all: [CalculatorButton] = [
        backspace, clear, plusMinus, divide,
        seven, eight, nine, multiply,
        four, five, six, minus,
        one, two, three, plus,
        zero, point, equal
    ]
}
