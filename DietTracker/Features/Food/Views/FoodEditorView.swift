//
//  FoodEditorView.swift
//  DietTracker
//
//  Created by Aaron Huxley on 05/09/2026.
//

import SwiftUI

struct FoodEditorView: View {

    let food: Food?

    @State private var foodEditorVM: FoodEditorViewModel

    var onSave: (Food) -> Void

    init(
        food: Food? = nil,
        onSave: @escaping (Food) -> Void
    ) {
        self.food = food
        self.onSave = onSave

        _foodEditorVM = State(
            initialValue: FoodEditorViewModel(food: food)
        )
    }

    var body: some View {
        NavigationStack {
            Form {
                Section("Name") {
                    TextField("", text: $foodEditorVM.name)
                }

                Section("Brand") {
                    TextField(
                        "",
                        text: Binding(
                            get: { foodEditorVM.brand ?? "" },
                            set: {
                                foodEditorVM.brand = $0.isEmpty ? nil : $0
                            }
                        )
                    )
                }

                Section("Calories") {
                    TextField(
                        "",
                        value: $foodEditorVM.calories,
                        format: .number
                    )
                    .keyboardType(.decimalPad)
                }

                Section("Protein (g)") {
                    TextField(
                        "",
                        value: $foodEditorVM.protein,
                        format: .number
                    )
                    .keyboardType(.decimalPad)
                }

                Section("Carbohydrates (g)") {
                    TextField(
                        "",
                        value: $foodEditorVM.carbohydrates,
                        format: .number
                    )
                    .keyboardType(.decimalPad)
                }

                Section("Fat (g)") {
                    TextField(
                        "",
                        value: $foodEditorVM.fat,
                        format: .number
                    )
                    .keyboardType(.decimalPad)
                }

                Section {
                    Button(food == nil ? "Create Food" : "Save Changes") {
                        let savedFood: Food

                        if let food {
                            savedFood = foodEditorVM.editFood(food)
                        } else {
                            savedFood = foodEditorVM.createFood()
                        }

                        onSave(savedFood)
                    }
                }
            }
            .navigationTitle(
                food == nil ? "Create Food" : "Edit Food"
            )
        }
    }
}
