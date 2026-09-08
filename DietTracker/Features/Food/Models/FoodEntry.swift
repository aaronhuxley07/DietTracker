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
    
    var amount: Double // Amount consumed in grams
    var date: Date
    var mealType: MealType
    
    init(
        id: UUID = UUID(),
        food: Food,
        amount: Double,
        date: Date = Date(),
        mealType: MealType
    ) {
        self.id = id
        self.food = food
        self.amount = amount
        self.date = date
        self.mealType = mealType
    }
}
