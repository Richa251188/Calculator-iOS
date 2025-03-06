//
//  CalculatorButtonCell.swift
//  CalculatorPracticeTask
//
//  Created by Richa Agrawal on 05/03/25.
//

import UIKit

class CalculatorButtonCell: UICollectionViewCell {
    static let identifier = "CalculatorButtonCell"

    private var uiButton: UIButton!
    var button: CalculatorButton? {
        didSet {
            if let button = button {
                uiButton.setTitle(button.text, for: .normal)
                uiButton.isEnabled = true
            } else {
                uiButton.isEnabled = false
            }
        }
    }

    var onKeyPressed: ((CalculatorKey) -> Void)?

    override init(frame: CGRect) {
        super.init(frame: frame)
        uiButton = UIButton(type: .roundedRect)
        uiButton.frame = contentView.frame
        uiButton.addTarget(self, action: #selector(buttonTouchUpInside), for: .touchUpInside)
        contentView.addSubview(uiButton)
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        uiButton = UIButton(type: .roundedRect)
        uiButton.frame = contentView.frame
        uiButton.addTarget(self, action: #selector(buttonTouchUpInside), for: .touchUpInside)
        contentView.addSubview(uiButton)
    }

    @objc private func buttonTouchUpInside() {
        if let button = button {
            onKeyPressed?(button.key)
        }
    }
}
