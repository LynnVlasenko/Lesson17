//
//  FirstViewController.swift
//  Lesson17
//
//  Created by Алина Власенко on 18.04.2024.
//

import UIKit


// другий варіант реалізації екрану з використанням Section адаптера і з масивом моделі в який передаються дані прописаним саме у вью контроллері (можна реалізувати окремим дата сорсом і передавати сюди його, а можна через масивб  у VIPER це б зберігалося в презентері)
// тобто контроллер тепер відповідає за те, що в нього зберігаються конкретні дані для показу, а який саме інтерфейс, за це відповідає tableAdapter
class FirstViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    //  передаємо не конкретний інстанс адаптера, а його тип через протокол створений - так як він до нього належить
    var tableAdapter: TableViewAdapterInput!
    
    var models: [SwitcherCellDisplayModel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // присвоюємо в наш, раніше створений, пустий масив дані з  ДатаЛоадера
        models = DataLoader().getSwitcherData()
        
        //створюємо константу з реалізацією ініта для Оутпута Секшн Адаптера (який ми прописали в Секшнн адаптері) і тут ініціалізація з параметром - ми передамо туди селф - так як вью контроллер підтримує SwitchableSectionAdapterOutput то він за типом підходить
        //(виходить ми типу створюємо певну секцію - яка має назву Світчбл, в нашому прикладі, ми їх можемо створити тут декілька, якщо потрібно)
        let switchableSection = SwitchableSectionAdapter(output: self)
        // це не по соліду що далі робимо, зазвичай інстанс адаптера робиться та налаштовується поза межами модуля
        // створюємо тепер інстанс для адаптера
        let adapter = TableViewAdapter()
        // далі ми ці секції передаємо адаптеру в масив секцій (створюємо масив з нашими створеними секціями і присвоюємо масиву в адаптері)
        adapter.sections = [switchableSection]
        // присвоюємо адаптер уже з даними до нашого тейбладаптера
        tableAdapter = adapter
        //також передаємо табличку з якою буде працювати адаптер
        tableAdapter.setup(with: tableView)
    }
}

// MARK: - SwitchableSectionAdapterOutput
// передаємо дані для моделі, підключаючись до протоколу СекшнАдаптерОутпут і реалізовуючи його фуннкції тут (якби це був Viper ми б це робили в презентері)
extension FirstViewController: SwitchableSectionAdapterOutput {
    func switchItemCount() -> Int {
        models.count
    }
    
    func switchItem(at indexPath: IndexPath) -> SwitcherCellDisplayModel {
        return models[indexPath.row]
    }
    
    
}
