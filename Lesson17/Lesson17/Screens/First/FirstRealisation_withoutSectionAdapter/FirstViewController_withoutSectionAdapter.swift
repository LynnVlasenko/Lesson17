//
//  FirstViewController_withoutSectionAdapter.swift
//  Lesson17
//
//  Created by Алина Власенко on 19.04.2024.
//

import UIKit

// копія реалізації екрану з Table адаптер, коли використовувати масиви даних в самому тейбл адапторі і використовувати нативні фуннкції таблиці без протоколу
class FirstViewController_withoutSectionAdapter: UIViewController {

//    @IBOutlet weak var tableView: UITableView!
//    
//    //  передаємо не конкретний інстанс адаптера, а його тип через протокол створений - так як він до нього належить
//    var tableAdapter: TableViewAdapterInput!
//    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        
//        //так як у нас є клас яки працює з таблицею і передає в таблицю потрібну нам комірку, то ми просто передаємо дані для масиву, на якому буде базуватися таблиця в тому класі і передаємо саму табличку, яка є у вью коннтроллері, в яку той клас передать комірки для відображенння
//        // це не по соліду що далі робимо, зазвичай інстанс адаптера робиться та налаштовується поза межами модуля
//        // створюємо тепер інстанс для адаптера
//        let adapter = TableViewAdapter()
//        // передаємо дані в заздалегідь підготовленфий масив в адаптері
//        adapter.models = DataLoader().getSwitcherData()
//        // присвоюємо адаптер уже з даними до нашого тейбладаптера
//        tableAdapter = adapter
//        //також передаємо табличку з якою буде працювати адаптер
//        tableAdapter.setup(with: tableView)
//    }


}
