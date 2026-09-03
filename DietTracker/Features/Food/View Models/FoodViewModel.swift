//
//  FoodViewModel.swift
//  DietTracker
//
//  Created by Aaron Huxley on 03/09/2026.
//

import Foundation

@Observable
class FoodViewModel {

    var name = ""
    var calories = ""
    var protein = ""
    var carbohydrates = ""
    var fat = ""
    var date = Date()

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
}
