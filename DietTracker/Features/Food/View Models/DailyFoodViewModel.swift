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
    
    func updateFood(_ updatedFood: Food) {
        if let index = foodList.firstIndex(where: { $0.id == updatedFood.id }) {
            foodList[index] = updatedFood
        }
    }
    
    func deleteFood(_ food: Food) {
        foodList.removeAll { $0.id == food.id }
    }
}
