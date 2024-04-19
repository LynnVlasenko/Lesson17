//
//  TableViewAdapterInput.swift
//  Lesson17
//
//  Created by Алина Власенко on 18.04.2024.
//

import UIKit


//створюємо протокол, що витягує таблицю
protocol TableViewAdapterInput {
    
    func setup(with tableView: UITableView)
}
