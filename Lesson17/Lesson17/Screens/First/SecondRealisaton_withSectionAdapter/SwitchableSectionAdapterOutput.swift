//
//  SwitchableSectionAdapterOutput.swift
//  Lesson17
//
//  Created by Алина Власенко on 19.04.2024.
//

import Foundation

protocol SwitchableSectionAdapterOutput: AnyObject {
    
    // Описуємо де саме будуть знаходитись дані:
    // так як у нас масив з модельками лежить у вью контроллері тепер - ми маємо реалізувати можливість передачі цих даних для SectionAdapter-а - то тут прописуємо іннтерфейс і будемо його реалізовувати у класі адаптера
    
    // 1. йому потрібно знати кількість елементів(кількість даних), що передаються у модель
    func switchItemCount() -> Int
    // 2. сформувати дані і передати їх з типом моделі(тобто яку саме модельку ми хочемо поверннути по IndexPath)
    func switchItem(at indexPath: IndexPath) -> SwitcherCellDisplayModel
}
