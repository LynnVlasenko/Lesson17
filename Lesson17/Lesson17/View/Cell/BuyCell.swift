//
//  BuyCell.swift
//  Lesson17
//
//  Created by Алина Власенко on 19.04.2024.
//

import UIKit

class BuyCell: UITableViewCell {
    
    var buyComplition: (() -> ())?
    
    @IBOutlet weak var titleTextLable: UILabel!
    @IBOutlet weak var buyButton: UIButton!
    
    func setup(with model: BuyCellDisplayModel) {
        titleTextLable.text = model.titleText
    }
    
    @IBAction func buyButtonAction(_ sender: UIButton) {
        buyComplition?()
    }
}
