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
            calories: 1,
            protein: 2,
            carbohydrates: 3,
            fat: 4
        ),
        Food(
            name: "Sample Food 2",
            calories: 0,
            protein: 0,
            carbohydrates: 0,
            fat: 0
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
