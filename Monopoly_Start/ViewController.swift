//
//  ViewController.swift
//  Monopoly_Start
//
//  Created by mac on 27/04/2019.
//  Copyright © 2019 Letovo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var cells: [UIStackView]!
    
    var currentCellIndex = 0 {
        didSet {
            currentCellIndex %= cells.count
            updateUI()
        }
    }
    
    var currentCell: UIStackView {
        return cells[currentCellIndex]
    }
    
    var prevCell: UIStackView {
        let index = (currentCellIndex + cells.count - 1) % cells.count
        return cells[index]
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        currentCellIndex += 1
    }

    func updateUI() {
        updateCell(currentCell, with: "Red")
        updateCell(prevCell, with: "")
    }
    
    func updateCell(_ cell: UIStackView, with imageName: String) {
        let horizontal = cell.arrangedSubviews.first! as! UIStackView
        let imageView = horizontal.arrangedSubviews.first! as! UIImageView
        imageView.image = UIImage(named: imageName)
    }
}

