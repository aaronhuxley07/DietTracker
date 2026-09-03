//
//  FoodViewModel.swift
//  DietTracker
//
//  Created by Aaron Huxley on 03/09/2026.
//

import Foundation
import Observation

@Observable
class FoodViewModel {

    var name = ""
    var calories = ""
    var protein = ""
    var carbohydrates = ""
    var fat = ""
    var date = Date()

    init(existingFood: Food? = nil) {
        guard let food = existingFood else { return }

        name = food.name
        calories = String(food.calories)
        protein = String(food.protein)
        carbohydrates = String(food.carbohydrates)
        fat = String(food.fat)
        date = food.date
    }

    func createFood() -> Food {
        Food(
            name: name,
            calories: Double(calories) ?? 0,
            protein: Double(protein) ?? 0,
            carbohydrates: Double(carbohydrates) ?? 0,
            fat: Double(fat) ?? 0,
            date: date
        )
    }
    
    func editFood(_ food: Food) -> Food {
        Food(
            id: food.id,
            name: name,
            calories: Double(calories) ?? 0,
            protein: Double(protein) ?? 0,
            carbohydrates: Double(carbohydrates) ?? 0,
            fat: Double(fat) ?? 0,
            date: date
        )
    }
}
