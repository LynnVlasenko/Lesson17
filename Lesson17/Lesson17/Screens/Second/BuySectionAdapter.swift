//
//  BuySectionAdapter.swift
//  Lesson17
//
//  Created by Алина Власенко on 19.04.2024.
//

import UIKit

// трошки ускладнюємо тепер будемо працювати з класом, який опрацьовує конкретну секцію (в даному випадку та що зі світчерами) - і реалізовує фуннкціїї Section адаптера протокола
// також він не має тримати в собі масив данних, як це зроблено в TableViewAdapter (це щоб відповідно до соліду було) - для цього ми робимо йому output -  тобто делегат по суті SwitchableSectionAdapterOutput і в класі просто створюємо його інстанс

// тобто створюємо клас, який вміє працювати з таблицею, але дані йому надаються через протокол і табличні функції теж описані протоколом, який вміє з ними працювати і цей клас підтримує цей протокол
class BuySectionAdapter {
    
    // тут будемо зберігати посиланння на об'єкт, який має в собі дані для відображення на табличці
    private weak var output: BuySectionAdapterOutput!
    
    // тут відразу реалізовуємо ініт для аутпута
    required init(output: BuySectionAdapterOutput!) {
        self.output = output
    }
}

extension BuySectionAdapter: SectionAdapterInput {
    
    // вказуємо з якою саме коміркою буде працювати цей клас
    func registerCells(in tableView: UITableView) {
        let nib = UINib(nibName: "BuyCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "BuyCell")
    }
    
    // використовуючі функції протоколу, що передає дані формуємо табличку
    func numberOfRows(for section: Int, in tableView: UITableView) -> Int {
        output.buyItemCount()
    }
    
    func cellForRow(at indexPath: IndexPath, in tableView: UITableView) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "BuyCell", for: indexPath) as? BuyCell
        else {
            assertionFailure()
            return UITableViewCell()
        }
        let model = output.buyItem(at: indexPath)
        cell.setup(with: model)
        
        cell.buyComplition = { [weak self, indexPath] in
            guard let self = self else { return }
            
            self.output.buy(at: indexPath)
        }
        
        return cell
    }
    
    func heightForRow(at indexPath: IndexPath, in tableView: UITableView) -> CGFloat {
        return 88
    }
}
    
    
