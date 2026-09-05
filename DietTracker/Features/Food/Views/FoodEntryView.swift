//
//  FoodEntryView.swift
//  DietTracker
//
//  Created by Aaron Huxley on 03/09/2026.
//

import SwiftUI

struct FoodEntryView: View {

    let food: Food
    let existingFoodEntry: FoodEntry?

    var onSave: (FoodEntry) -> Void
    var onDelete: (FoodEntry) -> Void

    @State private var foodEntryVM: FoodEntryViewModel

    init(
        food: Food,
        existingFoodEntry: FoodEntry? = nil,
        onSave: @escaping (FoodEntry) -> Void,
        onDelete: @escaping (FoodEntry) -> Void
    ) {
        self.food = food
        self.existingFoodEntry = existingFoodEntry
        self.onSave = onSave
        self.onDelete = onDelete

        _foodEntryVM = State(
            initialValue: FoodEntryViewModel(
                food: food,
                existingFoodEntry: existingFoodEntry
            )
        )
    }

    var body: some View {
        Form {
            foodInformation

            Section("Date") {
                DatePicker(
                    "Date",
                    selection: $foodEntryVM.date,
                    displayedComponents: .date
                )
            }

            Section("Amount") {
                TextField(
                    "",
                    value: $foodEntryVM.amount,
                    format: .number
                )
                .keyboardType(.decimalPad)
            }

            Section {
                if let existingFoodEntry {
                    Button("Save Changes") {
                        let updatedFoodEntry =
                            foodEntryVM.editFoodEntry(existingFoodEntry)

                        onSave(updatedFoodEntry)
                    }

                    Button("Delete Food Entry", role: .destructive) {
                        onDelete(existingFoodEntry)
                    }
                } else {
                    Button("Save") {
                        let foodEntry = foodEntryVM.createFoodEntry()
                        onSave(foodEntry)
                    }
                }
            }
        }
        .navigationTitle(
            existingFoodEntry == nil
                ? "Add Food Entry"
                : "Edit Food Entry"
        )
    }
}

extension FoodEntryView {
    @ViewBuilder
    var foodInformation: some View {
        Section("Name") {
            Text(food.name)
        }

        if let brand = food.brand {
            Section("Brand") {
                Text(brand)
            }
        }

        Section("Calories") {
            Text(String(food.calories))
        }

        Section("Protein (g)") {
            Text(String(food.protein))
        }

        Section("Carbohydrates (g)") {
            Text(String(food.carbohydrates))
        }

        Section("Fat (g)") {
            Text(String(food.fat))
        }
    }
}
