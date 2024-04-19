//
//  SwitcherCell.swift
//  Lesson17
//
//  Created by Алина Власенко on 18.04.2024.
//

import UIKit

class SwitcherCell: UITableViewCell {
    
    @IBOutlet weak var titleTextLabel: UILabel!
    @IBOutlet weak var switcher: UISwitch!
    
    @IBAction func switcherAction(_ sender: UISwitch) {
    }
    
    func setup(with model: SwitcherCellDisplayModel) {
        titleTextLabel.text = model.title
        switcher.isOn = model.isOn
    }
}
