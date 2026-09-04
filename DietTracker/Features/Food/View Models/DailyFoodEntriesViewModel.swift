//
//  DailyFoodEntriesViewModel.swift
//  DietTracker
//
//  Created by Aaron Huxley on 03/09/2026.
//

import Foundation

@Observable
class DailyFoodEntriesViewModel {
    var foodEntries: [FoodEntry] = []
    
    func addFoodEntry(_ foodEntry: FoodEntry) {
        foodEntries.append(foodEntry)
    }
    
    func updateFoodEntry(_ updatedFoodEntry: FoodEntry) {
        if let index = foodEntries.firstIndex(where: { $0.id == updatedFoodEntry.id }) {
            foodEntries[index] = updatedFoodEntry
        }
    }
    
    func deleteFoodEntry(_ foodEntry: FoodEntry) {
        foodEntries.removeAll { $0.id == foodEntry.id }
    }
}
