//
//  NutritionCalculator.swift
//  DietTracker
//
//  Created by Aaron Huxley on 09/09/2026.
//

import Foundation

struct NutritionCalculator {
    
    static func calculate(
        food: Food,
        entryUnit: NutritionUnit,
        amount: Double
    ) -> Nutrition {
        
        let multiplier = calculateMultiplier(
            foodUnit: food.nutritionUnit,
            entryUnit: entryUnit,
            amount: amount
        )
        
        return Nutrition(
            calories: food.calories * multiplier,
            protein: food.protein * multiplier,
            carbohydrates: food.carbohydrates * multiplier,
            fat: food.fat * multiplier
        )
    }
    
    private static func calculateMultiplier(
        foodUnit: NutritionUnit,
        entryUnit: NutritionUnit,
        amount: Double
    ) -> Double {
        
        guard foodUnit.measurementType == entryUnit.measurementType else {
            return 0
        }
        
        return (
            entryUnit.referenceAmount
            / foodUnit.referenceAmount
        ) * amount
    }
    
    static func totalNutrition(for entries: [FoodEntry]) -> Nutrition {
        entries.reduce(
            Nutrition(
                calories: 0,
                protein: 0,
                carbohydrates: 0,
                fat: 0
            )
        ) { total, entry in
            Nutrition(
                calories: total.calories + entry.nutrition.calories,
                protein: total.protein + entry.nutrition.protein,
                carbohydrates: total.carbohydrates + entry.nutrition.carbohydrates,
                fat: total.fat + entry.nutrition.fat
            )
        }
    }
}
