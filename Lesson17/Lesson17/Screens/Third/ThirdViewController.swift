//
//  ThirdViewController.swift
//  Lesson17
//
//  Created by Алина Власенко on 19.04.2024.
//

import UIKit

// екран який буде працювати з обома секціями
class ThirdViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var tableAdapter: TableViewAdapterInput!
    
    var switchableModels: [SwitcherCellDisplayModel] = []
    var buyModels: [BuyCellDisplayModel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        switchableModels = DataLoader().getSwitcherData()
        buyModels = DataLoader().getBuyData()
        
        let switchableSection = SwitchableSectionAdapter(output: self)
        let buySection = BuySectionAdapter(output: self)
        
        let adapter = TableViewAdapter()
        adapter.sections = [
            switchableSection,
            buySection
        ]
        
        tableAdapter = adapter
        tableAdapter.setup(with: tableView)
    }
}

// MARK: - BuySectionAdapterOutput
// передаємо дані для моделі, підключаючись до протоколу СекшнАдаптерОутпут і реалізовуючи його фуннкції тут (якби це був Viper ми б це робили в презентері)
extension ThirdViewController: BuySectionAdapterOutput {
    
    func buyItemCount() -> Int {
        buyModels.count
    }
    
    func buyItem(at indexPath: IndexPath) -> BuyCellDisplayModel {
        return buyModels[indexPath.row]
    }
    
    func buy(at indexPath: IndexPath) {
        let item = buyModels[indexPath.row]
        print("ThirdViewController -> \(item.titleText)")
    }
}

// MARK: - SwitchableSectionAdapterOutput
// передаємо дані для моделі, підключаючись до протоколу СекшнАдаптерОутпут і реалізовуючи його фуннкції тут (якби це був Viper ми б це робили в презентері)
extension ThirdViewController: SwitchableSectionAdapterOutput {
    
    func switchItemCount() -> Int {
        switchableModels.count
    }
    
    func switchItem(at indexPath: IndexPath) -> SwitcherCellDisplayModel {
        return switchableModels[indexPath.row]
    }
}
