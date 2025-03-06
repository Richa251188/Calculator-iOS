//
//  CalculatorButtonsDataSource.swift
//  CalculatorPracticeTask
//
//  Created by Richa Agrawal on 05/03/25.
//

import UIKit

class CalculatorButtonsDataSource: NSObject, UICollectionViewDataSource {
    private var onKeyPressed: ((CalculatorKey) -> Void)?

    init(onKeyPressed: @escaping (CalculatorKey) -> Void) {
        self.onKeyPressed = onKeyPressed
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CalculatorButtonCell.identifier, for: indexPath) as? CalculatorButtonCell else {
            fatalError("Failed to dequeue CalculatorButtonCell")
        }

        let index = (indexPath.section * 4) + indexPath.item
        var button: CalculatorButton? = nil

        if index < CalculatorButtons.all.count {
            button = CalculatorButtons.all[index]
        }

        cell.button = button
        cell.onKeyPressed = onKeyPressed

        return cell
    }

    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 5
    }
}
