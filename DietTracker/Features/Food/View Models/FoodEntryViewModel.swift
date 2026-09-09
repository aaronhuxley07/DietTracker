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
    var nutritionUnit: NutritionUnit
    var amount: Double
    var date: Date
    var mealType: MealType?
    
    init(food: Food, existingFoodEntry: FoodEntry? = nil) {
        self.food = food
        
        if let entry = existingFoodEntry {
            nutritionUnit = entry.nutritionUnit
            amount = entry.amount
            date = entry.date
            mealType = entry.mealType
        } else {
            nutritionUnit = .per100g
            amount = 0
            date = Date()
            mealType = nil
        }
    }
    
    func createFoodEntry() -> FoodEntry {
        FoodEntry(
            food: food,
            nutritionUnit: nutritionUnit,
            amount: amount,
            date: date,
            mealType: mealType ?? .breakfast
        )
    }
    
    func editFoodEntry(_ foodEntry: FoodEntry) -> FoodEntry {
        FoodEntry(
            id: foodEntry.id,
            food: foodEntry.food,
            nutritionUnit: nutritionUnit,
            amount: amount,
            date: date,
            mealType: mealType ?? .breakfast
        )
    }
}
