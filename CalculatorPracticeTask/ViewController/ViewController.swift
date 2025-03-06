//
//  ViewController.swift
//  CalculatorPracticeTask
//
//  Created by Richa Agrawal on 04/03/25.
//

import UIKit

class ViewController: UIViewController {
    
    private var calculatorEngine: CalculatorEngine!

    @IBOutlet weak var calculationTextField: UITextField!
    @IBOutlet weak var resultTextField: UITextField!
    @IBOutlet var buttonsCollectionView: UICollectionView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Initialize the calculator engine
        calculatorEngine = CalculatorEngine()
        
        guard let calEngine = calculatorEngine as? NSObject else {return}
        calEngine.addObserver(self, forKeyPath: "calculationText", options: .new, context: nil)
        calEngine.addObserver(self, forKeyPath: "resultText", options: .new, context: nil)

        // Set up the collection view
        buttonsCollectionView.register(CalculatorButtonCell.self, forCellWithReuseIdentifier: CalculatorButtonCell.identifier)
        buttonsCollectionView.dataSource = CalculatorButtonsDataSource(onKeyPressed: onCalculatorKeyPress)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Release any cached data, images, etc. that aren't in use
    }

    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey: Any]?, context: UnsafeMutableRawPointer?) {
        if keyPath == "calculationText" {
            calculationTextField.text = calculatorEngine.calculationText
        } else if keyPath == "resultText" {
            resultTextField.text = calculatorEngine.resultText
        }
    }

    private func onCalculatorKeyPress(_ key: CalculatorKey) {
        calculatorEngine.processKeyPress(key)
    }

}


