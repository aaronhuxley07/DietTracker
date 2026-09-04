//
//  FoodLibraryViewModel.swift
//  DietTracker
//
//  Created by Aaron Huxley on 03/09/2026.
//

import Foundation

@Observable
class FoodLibraryViewModel {
    var foods: [Food] = [
        Food(name: "Sample Food 1", calories: 1, protein: 2, carbohydrates: 3, fat: 4),
        Food(name: "Sample Food 2", calories: 0, protein: 0, carbohydrates: 0, fat: 0)
    ]
}
