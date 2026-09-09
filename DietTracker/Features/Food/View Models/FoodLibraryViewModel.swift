//
//  FoodLibraryViewModel.swift
//  DietTracker
//
//  Created by Aaron Huxley on 03/09/2026.
//

import Foundation
import Observation

@Observable
class FoodLibraryViewModel {
    
    var foods: [Food] = [
        Food(
            name: "Sample Food 1",
            brand: "Costco",
            nutritionUnit: .per100g,
            calories: 100,
            protein: 20,
            carbohydrates: 150,
            fat: 40
        ),
        Food(
            name: "Sample Food 2",
            nutritionUnit: .per1ml,
            calories: 2,
            protein: 1.8,
            carbohydrates: 1.0,
            fat: 3
        )
    ]
    
    func addFood(_ food: Food) {
        foods.append(food)
    }
    
    func updateFood(_ food: Food) {
        if let index = foods.firstIndex(where: { $0.id == food.id }) {
            foods[index] = food
        }
    }
    
    func deleteFood(_ food: Food) {
        foods.removeAll { $0.id == food.id }
    }
}
