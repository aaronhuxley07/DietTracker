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
    case per1g = "Per 1g"
    case per1ml = "Per 1ml"

    var id: Self { self }

    var measurementType: MeasurementType {
        switch self {
        case .per100g, .per1g:
            .grams

        case .per100ml, .per1ml:
            .millilitres
        }
    }

    var servingSize: String {
        switch self {
        case .per100g:
            "100g"
        case .per100ml:
            "100ml"
        case .per1g:
            "1g"
        case .per1ml:
            "1ml"
        }
    }
}

enum MeasurementType {
    case grams
    case millilitres
}
