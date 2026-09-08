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
                basicInformation
                nutritionInformation
                saveButton
            }
            .navigationTitle(
                food == nil ? "Create Food" : "Edit Food"
            )
        }
    }
}

// MARK: - Basic Information

extension FoodEditorView {

    private var basicInformation: some View {
        Section {
            LabeledTextField(
                title: "Name",
                text: $foodEditorVM.name
            )

            LabeledTextField(
                title: "Brand",
                text: Binding(
                    get: { foodEditorVM.brand ?? "" },
                    set: {
                        foodEditorVM.brand = $0.isEmpty ? nil : $0
                    }
                )
            )
        }
    }
}

// MARK: - Nutrition Information

extension FoodEditorView {

    private var nutritionInformation: some View {
        Section("Nutrition Information") {
            Picker(
                "Nutrition Info",
                selection: $foodEditorVM.nutritionUnit
            ) {
                ForEach(NutritionUnit.allCases) { nutritionUnit in
                    Text(nutritionUnit.rawValue)
                        .tag(nutritionUnit)
                }
            }

            LabeledNumberField(
                title: "Calories",
                value: $foodEditorVM.calories
            )

            LabeledNumberField(
                title: "Protein (g)",
                value: $foodEditorVM.protein
            )

            LabeledNumberField(
                title: "Carbohydrates (g)",
                value: $foodEditorVM.carbohydrates
            )

            LabeledNumberField(
                title: "Fat (g)",
                value: $foodEditorVM.fat
            )
        }
    }
}

// MARK: - Save

extension FoodEditorView {

    private var saveButton: some View {
        Section {
            Button(
                food == nil ? "Create Food" : "Save Changes",
                action: saveFood
            )
        }
    }

    private func saveFood() {
        let savedFood: Food

        if let food {
            savedFood = foodEditorVM.editFood(food)
        } else {
            savedFood = foodEditorVM.createFood()
        }

        onSave(savedFood)
    }
}

#Preview {
    FoodEditorView { food in
        print(food)
    }
}
