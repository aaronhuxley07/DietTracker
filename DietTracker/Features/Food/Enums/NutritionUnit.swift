//
//  NutritionUnit.swift
//  DietTracker
//
//  Created by Aaron Huxley on 07/09/2026.
//

import Foundation

enum NutritionUnit: String, CaseIterable, Identifiable {
    case per100g = "Per 100g"
    case per100ml = "Per 100ml"

    var id: Self { self }
}
