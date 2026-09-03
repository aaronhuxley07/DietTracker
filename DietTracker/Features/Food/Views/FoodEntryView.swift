//
//  FoodEntryView.swift
//  DietTracker
//
//  Created by Aaron Huxley on 03/09/2026.
//

import SwiftUI

struct FoodEntryView: View {

    let existingFood: Food?
    
    var onSave: (Food) -> Void
    var onDelete: (Food) -> Void
    
    @State private var foodVM: FoodViewModel

    init(
        existingFood: Food? = nil,
        onSave: @escaping (Food) -> Void,
        onDelete: @escaping (Food) -> Void
    ) {
        self.existingFood = existingFood
        self.onSave = onSave
        self.onDelete = onDelete
        _foodVM = State(initialValue: FoodViewModel(existingFood: existingFood))
    }

    var body: some View {
        Form {

            foodInformation

            Section {
                if let existingFood {
                    Button("Save Changes") {
                        let updatedFood = foodVM.editFood(existingFood)
                        onSave(updatedFood)
                    }

                    Button("Delete Food", role: .destructive) {
                        onDelete(existingFood)
                    }
                } else {
                    Button("Save") {
                        let food = foodVM.createFood()
                        onSave(food)
                    }
                }
            }
        }
        .navigationTitle(existingFood == nil ? "Add Food" : "Edit Food")
    }
}

extension FoodEntryView {
    @ViewBuilder
    var foodInformation: some View {
        Section("Food") {
            TextField("Name", text: $foodVM.name)

            TextField("Calories", text: $foodVM.calories)
                .keyboardType(.decimalPad)
        }

        Section("Macros") {
            TextField("Protein (g)", text: $foodVM.protein)
                .keyboardType(.decimalPad)

            TextField("Carbohydrates (g)", text: $foodVM.carbohydrates)
                .keyboardType(.decimalPad)

            TextField("Fat (g)", text: $foodVM.fat)
                .keyboardType(.decimalPad)
        }

        Section("Date") {
            DatePicker(
                "Date",
                selection: $foodVM.date,
                displayedComponents: .date
            )
        }
    }
}
