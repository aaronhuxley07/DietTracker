//
//  FoodEntry.swift
//  DietTracker
//
//  Created by Aaron Huxley on 03/09/2026.
//

import Foundation

struct FoodEntry: Identifiable {
    let id: UUID
    let foodID: UUID
    var amount: Double // Amount consumed in grams
    var date: Date
    
    init(
        id: UUID = UUID(),
        foodID: UUID,
        amount: Double,
        date: Date = Date()
    ) {
        self.id = id
        self.foodID = foodID
        self.amount = amount
        self.date = date
    }
}
