//
//  SwitchableSectionAdapter.swift
//  Lesson17
//
//  Created by Алина Власенко on 19.04.2024.
//

import UIKit

// трошки ускладнюємо тепер будемо працювати з класом, який опрацьовує конкретну секцію (в даному випадку та що зі світчерами) - і реалізовує фуннкціїї Section адаптера протокола
// також він не має тримати в собі масив данних, як це зроблено в TableViewAdapter (це щоб відповідно до соліду було) - для цього ми робимо йому output -  тобто делегат по суті SwitchableSectionAdapterOutput і в класі просто створюємо його інстанс

// тобто створюємо клас, який вміє працювати з таблицею, але дані йому надаються через протокол і табличні функції теж описані протоколом, який вміє з ними працювати і цей клас підтримує цей протокол
class SwitchableSectionAdapter {
    
    // тут будемо зберігати посиланння на об'єкт, який має в собі дані для відображення на табличці
    private weak var output: SwitchableSectionAdapterOutput!
    
    // тут відразу реалізовуємо ініт для аутпута
    required init(output: SwitchableSectionAdapterOutput!) {
        self.output = output
    }
}

extension SwitchableSectionAdapter: SectionAdapterInput {
    
    // вказуємо з якою саме коміркою буде працювати цей клас
    func registerCells(in tableView: UITableView) {
        let nib = UINib(nibName: "SwitcherCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "SwitcherCell")
    }
    
    // використовуючі функції протоколу, що передає дані формуємо табличку
    func numberOfRows(for section: Int, in tableView: UITableView) -> Int {
        output.switchItemCount()
    }
    
    func cellForRow(at indexPath: IndexPath, in tableView: UITableView) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "SwitcherCell", for: indexPath) as? SwitcherCell
        else {
            assertionFailure()
            return UITableViewCell()
        }
        let model = output.switchItem(at: indexPath)
        cell.setup(with: model)
        
        return cell
    }
    
    
}
