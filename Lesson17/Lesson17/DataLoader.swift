//
//  DataLoader.swift
//  Lesson17
//
//  Created by Алина Власенко on 19.04.2024.
//

import Foundation

class DataLoader {
    
    func getSwitcherData() -> [SwitcherCellDisplayModel] {
        
        var models: [SwitcherCellDisplayModel] = []
        for i in 0 ..< 5 {
            let newModel = SwitcherCellDisplayModel(title: "Title: \(i + 1)", isOn: false)
            models.append(newModel)
        }
        return models
    }
    
    func getPopularData() -> [SwitcherCellDisplayModel] {
        
        var models: [SwitcherCellDisplayModel] = []
        for i in 0 ..< 5 {
            let newModel = SwitcherCellDisplayModel(title: "Title: \(i + 1)", isOn: false)
            models.append(newModel)
        }
        return models
    }
    
    func getBuyData() -> [BuyCellDisplayModel] {
        
        var models: [BuyCellDisplayModel] = []
        for i in 0 ..< 7 {
            let newModel = BuyCellDisplayModel(titleText: "Buy description: \(i + 1)")
            models.append(newModel)
        }
        return models
    }
}
