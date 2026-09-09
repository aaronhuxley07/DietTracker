//
//  FoodEntry.swift
//  DietTracker
//
//  Created by Aaron Huxley on 03/09/2026.
//

import Foundation

struct FoodEntry: Identifiable {
    let id: UUID
    var food: Food
    
    var nutritionUnit: NutritionUnit
    var amount: Double
    var date: Date
    var mealType: MealType
    
    init(
        id: UUID = UUID(),
        food: Food,
        nutritionUnit: NutritionUnit,
        amount: Double,
        date: Date = Date(),
        mealType: MealType
    ) {
        self.id = id
        self.food = food
        self.nutritionUnit = nutritionUnit
        self.amount = amount
        self.date = date
        self.mealType = mealType
    }
}

extension FoodEntry {
    
    var nutrition: Nutrition {
        NutritionCalculator.calculate(
            food: food,
            entryUnit: nutritionUnit,
            amount: amount
        )
    }
}
