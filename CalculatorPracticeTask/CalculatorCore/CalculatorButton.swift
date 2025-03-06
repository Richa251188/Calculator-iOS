//
//  CalculatorButton.swift
//  CalculatorPracticeTask
//
//  Created by Richa Agrawal on 05/03/25.
//

import Foundation

class CalculatorButton {
    let text: String
    let key: CalculatorKey

    init(key: CalculatorKey, text: String) {
        self.key = key
        self.text = text
    }
}
