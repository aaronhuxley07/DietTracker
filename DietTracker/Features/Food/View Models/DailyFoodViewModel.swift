//
//  DailyFoodViewModel.swift
//  DietTracker
//
//  Created by Aaron Huxley on 03/09/2026.
//

import Foundation

@Observable
class DailyFoodViewModel {
    var foodList: [Food] = []
    
    func addFoodToList(_ food: Food) {
        foodList.append(food)
    }
}
