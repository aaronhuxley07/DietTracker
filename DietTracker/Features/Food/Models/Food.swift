//
//  Food.swift
//  DietTracker
//
//  Created by Aaron Huxley on 03/09/2026.
//

import Foundation

struct Food: Identifiable {
    let id: UUID
    var name: String
    var brand: String?
    
    // Nutritional values per 100g
    var calories: Double
    var protein: Double
    var carbohydrates: Double
    var fat: Double

    init(
        id: UUID = UUID(),
        name: String,
        brand: String? = nil,
        calories: Double,
        protein: Double,
        carbohydrates: Double,
        fat: Double
    ) {
        self.id = id
        self.name = name
        self.brand = brand
        self.calories = calories
        self.protein = protein
        self.carbohydrates = carbohydrates
        self.fat = fat
    }
}
