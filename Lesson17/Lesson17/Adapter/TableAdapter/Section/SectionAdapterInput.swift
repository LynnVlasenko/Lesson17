//
//  SectionAdapterInput.swift
//  Lesson17
//
//  Created by Алина Власенко on 19.04.2024.
//

import UIKit

// створюємо адаптер інпут для опису функцій, що працюють з таблицею
// і тепер ми можемо створювати зв домопогою цього протоколу ту чи іншу реалізацію секції
protocol SectionAdapterInput {
    
    func registerCells(in tableView: UITableView)
    
    func numberOfRows(for section: Int, in tableView: UITableView) -> Int
    func cellForRow(at indexPath: IndexPath, in tableView: UITableView) -> UITableViewCell
    func heightForRow(at indexPath: IndexPath, in tableView: UITableView) -> CGFloat
    func didSelectRow(at indexPath: IndexPath, in tableView: UITableView)
}

// MARK: - Default
// Робимо в екстеншн до протоколу реалізацію тих функції які хочемо, щоб були опціональними і не обовєязковими для реалізації
extension SectionAdapterInput {

    func heightForRow(at indexPath: IndexPath, in tableView: UITableView) -> CGFloat {
        return 44
    }
    func didSelectRow(at indexPath: IndexPath, in tableView: UITableView) {
        // do nothing
    }
}
