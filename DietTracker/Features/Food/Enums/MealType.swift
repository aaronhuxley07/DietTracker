//
//  MealType.swift
//  DietTracker
//
//  Created by Aaron Huxley on 07/09/2026.
//

import Foundation

enum MealType: String, CaseIterable, Identifiable {
    case breakfast
    case lunch
    case dinner
    case snacks

    var id: Self { self }
}
