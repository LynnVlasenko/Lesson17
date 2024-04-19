//
//  TableViewAdapter.swift
//  Lesson17
//
//  Created by Алина Власенко on 18.04.2024.
//

import UIKit

// продвинута версія Тable адаптера з підключенням реалізації таблички з СекшнАдаптер - тобто він має вміти працювати з секшн адаптером і передаваті кількість секцій, які будуть в табличці, а самі секції реалізовані в окремих СекшнАдаптерах(для різних секцій можуть бути різні реалізації комірок)
// тепер TableViewAdapter працює як посередник - ми тільки передаємо йому таблицю і він налаштовує цю таблицю під кожну секцію, через реалізацію, які ми підставимо в sections і кожна секція знатиме як саме вона має бути реалізованна
class TableViewAdapter: NSObject {
    
    // і тепер у нас буде не конкретна модель, а масив секцій.
    var sections: [SectionAdapterInput] = []
    
}

// виконуємо протокол, що витягує таблицю і налаштовуємо її. Делегатом для неї буде цей поточний клас
// MARK: - TableViewAdapterInput
extension TableViewAdapter: TableViewAdapterInput {
    
    // тут приймаємо таблицю, яку передаємо цією самою фуннкціїю для тейбл адаптера конкредну таблицю і маємо вказати з якою саме секцією будемо працювати
    func setup(with tableView: UITableView) {
        tableView.dataSource = self
        tableView.delegate = self
        
        // свертаємося до кожного елементу секшн і викликаємо у нього функцію регістр для таблиці яку приймаємо з контроллера
        sections.forEach {
            $0.registerCells(in: tableView)
        }
    }
}

extension TableViewAdapter: UITableViewDataSource {
    //тут ми базуємося на інформації, яка нам буде передана в масив sections, де будуть передаватись секції, які ми окремо створюємо для конкретних комірок і в залежності від того які секції будуть реалізовані і передані в sections, такі дані для таблиці і кожної конкретної секції ми і передамо.
    // вказуємо кількість секцій
    func numberOfSections(in tableView: UITableView) -> Int {
        sections.count
    }
    
    // передаємо кількість комірок для кожної секції, викликаючі функцію numberOfRows що прописана в SectionAdapterInput - а це тип, який ми передаємо в наш масив - це протокол
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sections[section].numberOfRows(for: section, in: tableView)
    }
    
    // тут ми просто у адаптера(в нашому випадку SwitchableSectionAdapter) запитуємо яка тут буде целл, бо тут працюємо через протокол SectionAdapterInput і тут ми запитуємо що саме буде реалізовано, а самі комірки вже реалізовані в SwitchableSectionAdapter, який підтримує цей протокол SectionAdapterInput
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        return sections[indexPath.section].cellForRow(at: indexPath, in: tableView)
    }
    
    // передаємо висоту комірок для кожної секції
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return sections[indexPath.section].heightForRow(at: indexPath, in: tableView)
    }
}

extension TableViewAdapter: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        sections[indexPath.section].didSelectRow(at: indexPath, in: tableView)
    }
}
