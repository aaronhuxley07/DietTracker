//
//  FoodEditorViewModel.swift
//  DietTracker
//
//  Created by Aaron Huxley on 05/09/2026.
//

import Foundation
import Observation

@Observable
class FoodEditorViewModel {
    
    var name = ""
    var brand: String?
    var calories = 0.0
    var protein = 0.0
    var carbohydrates = 0.0
    var fat = 0.0
    
    init(food: Food? = nil) {
        guard let food else { return }
        
        name = food.name
        brand = food.brand
        calories = food.calories
        protein = food.protein
        carbohydrates = food.carbohydrates
        fat = food.fat
    }
    
    func createFood() -> Food {
        Food(
            name: name,
            brand: brand,
            calories: calories,
            protein: protein,
            carbohydrates: carbohydrates,
            fat: fat
        )
    }
    
    func editFood(_ food: Food) -> Food {
        Food(
            id: food.id,
            name: name,
            brand: brand,
            calories: calories,
            protein: protein,
            carbohydrates: carbohydrates,
            fat: fat
        )
    }
}
