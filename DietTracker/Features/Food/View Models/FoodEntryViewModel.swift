//
//  FoodEntryViewModel.swift
//  DietTracker
//
//  Created by Aaron Huxley on 03/09/2026.
//

import Foundation
import Observation

@Observable
class FoodEntryViewModel {

    let food: Food
    var amount: Double
    var date: Date

    init(food: Food, existingFoodEntry: FoodEntry? = nil) {
        self.food = food
        if let entry = existingFoodEntry {
            self.amount = entry.amount
            self.date = entry.date
        } else {
            self.amount = 0
            self.date = Date()
        }
    }

    func createFoodEntry() -> FoodEntry {
        FoodEntry(
            foodID: food.id,
            amount: amount,
            date: date
        )
    }
    
    func editFoodEntry(_ foodEntry: FoodEntry) -> FoodEntry {
        FoodEntry(
            id: foodEntry.id,
            foodID: foodEntry.foodID,
            amount: amount,
            date: date
        )
    }
}
