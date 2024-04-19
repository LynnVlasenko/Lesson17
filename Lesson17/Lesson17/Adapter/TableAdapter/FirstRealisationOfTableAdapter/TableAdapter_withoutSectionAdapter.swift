//
//  TableAdapter_withoutSectionAdapter.swift
//  Lesson17
//
//  Created by Алина Власенко on 19.04.2024.
//

import UIKit

// варіант реалізації таблиці в окремому класі, не у вью контроллері з нативнними фуннкціями для таблички
class TableAdapter_withoutSectionAdapter: NSObject {
    
    var models: [SwitcherCellDisplayModel] = []
    
}

// виконуємо протокол, що витягує таблицю і налаштовуємо її. Делегатом для неї буде цей поточний клас
// MARK: - TableViewAdapterInput
extension TableAdapter_withoutSectionAdapter: TableViewAdapterInput {
    
    func setup(with tableView: UITableView) {
        tableView.dataSource = self
        tableView.delegate = self
        
        let nib = UINib(nibName: "SwitcherCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "SwitcherCell")
    }
}

extension TableAdapter_withoutSectionAdapter: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return models.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "SwitcherCell", for: indexPath) as? SwitcherCell
        else {
            assertionFailure()
            return UITableViewCell()
        }
        let model = models[indexPath.row]
        cell.setup(with: model)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60.0
    }
}

extension TableAdapter_withoutSectionAdapter: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
}

