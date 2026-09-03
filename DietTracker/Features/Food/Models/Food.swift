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
    var calories: Double
    var protein: Double
    var carbohydrates: Double
    var fat: Double
    var date: Date

    init(
        id: UUID = UUID(),
        name: String,
        calories: Double,
        protein: Double,
        carbohydrates: Double,
        fat: Double,
        date: Date = Date()
    ) {
        self.id = id
        self.name = name
        self.calories = calories
        self.protein = protein
        self.carbohydrates = carbohydrates
        self.fat = fat
        self.date = date
    }
}
