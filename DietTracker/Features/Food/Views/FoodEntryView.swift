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
            entryInformation
        }
        .navigationTitle(
            existingFoodEntry == nil
                ? "Add Food Entry"
                : "Edit Food Entry"
        )
        .toolbar {
            ToolbarItem(placement: .topBarTrailing) {
                if let existingFoodEntry {
                    Button("Log") {
                        saveChanges(existingFoodEntry)
                    }

                    Button(
                        "Delete Food Entry",
                        role: .destructive
                    ) {
                        onDelete(existingFoodEntry)
                    }
                } else {
                    Button("Log") {
                        saveNewEntry()
                    }
                }
            }
        }
    }
}

// MARK: - Food Information

extension FoodEntryView {

    private var foodInformation: some View {
        Section {
            VStack(spacing: 15) {
                HStack {
                    VStack(alignment: .leading) {
                        Text(food.name)

                        if let brand = food.brand {
                            Text(brand)
                                .font(.subheadline)
                                .foregroundStyle(.secondary)
                        }
                    }

                    Spacer()
                }

                HStack {
                    nutritionValue(
                        value: food.calories,
                        label: "Calories"
                    )

                    Spacer()

                    nutritionValue(
                        value: food.protein,
                        label: "Protein"
                    )

                    Spacer()

                    nutritionValue(
                        value: food.carbohydrates,
                        label: "Carbs"
                    )

                    Spacer()

                    nutritionValue(
                        value: food.fat,
                        label: "Fat"
                    )
                }
            }
        }
    }

    private func nutritionValue(
        value: Double,
        label: String
    ) -> some View {
        VStack {
            Text(String(value))

            Text(label)
                .font(.caption)
                .foregroundStyle(.secondary)
        }
    }
}

// MARK: - Entry Information

extension FoodEntryView {

    private var entryInformation: some View {
        Section {
            HStack {
                Text("Serving Size")

                Spacer()

                Text(food.nutritionUnit.servingSize)
            }

            HStack {
                Text("Servings")

                Spacer()

                TextField(
                    "",
                    value: $foodEntryVM.amount,
                    format: .number
                )
                .keyboardType(.decimalPad)
                .multilineTextAlignment(.trailing)
            }

            Picker(
                "Meal",
                selection: $foodEntryVM.mealType
            ) {
                Text("Select a Meal")
                    .tag(nil as MealType?)

                ForEach(MealType.allCases) { mealType in
                    Text(mealType.rawValue.capitalized)
                        .tag(mealType as MealType?)
                }
            }

            DatePicker(
                "Date",
                selection: $foodEntryVM.date,
                displayedComponents: .date
            )
        }
    }
}

// MARK: - Actions

extension FoodEntryView {

    private func saveNewEntry() {
        let foodEntry = foodEntryVM.createFoodEntry()
        onSave(foodEntry)
    }

    private func saveChanges(_ foodEntry: FoodEntry) {
        let updatedFoodEntry = foodEntryVM.editFoodEntry(foodEntry)
        onSave(updatedFoodEntry)
    }
}

// MARK: - Preview

#Preview("Add Food Entry") {
    FoodEntryView(
        food: Food(
            name: "Chicken Breast",
            brand: "Example Brand",
            nutritionUnit: .per100g,
            calories: 165,
            protein: 31,
            carbohydrates: 0,
            fat: 3.6
        ),
        onSave: { foodEntry in
            print(foodEntry)
        },
        onDelete: { foodEntry in
            print(foodEntry)
        }
    )
}

#Preview("Edit Food Entry") {
    let food = Food(
        name: "Chicken Breast",
        brand: "Example Brand",
        nutritionUnit: .per100g,
        calories: 165,
        protein: 31,
        carbohydrates: 0,
        fat: 3.6
    )

    let foodEntry = FoodEntry(
        food: food,
        amount: 200,
        mealType: .lunch
    )

    FoodEntryView(
        food: food,
        existingFoodEntry: foodEntry,
        onSave: { foodEntry in
            print(foodEntry)
        },
        onDelete: { foodEntry in
            print(foodEntry)
        }
    )
}
