//
//  SecondViewController_withoutSectionAdapter.swift
//  Lesson17
//
//  Created by Алина Власенко on 19.04.2024.
//

import UIKit

class SecondViewController_withoutSectionAdapter: UIViewController {

//    @IBOutlet weak var tableView: UITableView!
//    
//    //  передаємо не конкретний інстанс адаптера, а його тип через протокол створений - так як він до нього належить
//    var tableAdapter: TableViewAdapterInput!
//    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        
//        //так як у нас є клас яки працює з таблицею і передає в таблицю потрібну нам комірку, то ми просто передаємо дані для масиву, на якому буде базуватися таблиця в тому класі і передаємо саму табличку, яка є у вью коннтроллері, в яку той клас передать комірки для відображенння (тобто це інший вью контроллер, а ми використовуємо ту саму реалізацію для таблички як і в першому вью контроллері - просто екрани різні і таблиці передаються туди різні + різнні дані для відображення можуть бути - наприклад у першому усі товари, а тут популярні або обрані - формат таблички буде такий самий, а дані передаються інші в модельку (тоді треба і інший масив по суті..?) - перевірила працює з іншими данними з тим самим масивом - виходить тому, що у нас у кожному вью контроллері свій інстанс того класу, який реалізовує табличку, тому ми тут можемо працювати і розширяти по своєму))
//        // це не по соліду що далі робимо, зазвичай інстанс адаптера робиться та налаштовується поза межами модуля
//        // створюємо тепер інстанс для адаптера
//        let adapter = TableViewAdapter()
//        // передаємо дані в заздалегідь підготовленфий масив в адаптері
//        adapter.models = DataLoader().getPopularData()
//        // присвоюємо адаптер уже з даними до нашого тейбладаптера
//        tableAdapter = adapter
//        //також передаємо табличку з якою буде працювати адаптер
//        tableAdapter.setup(with: tableView)
//    }


}
