//
//  DailyFoodEntriesView.swift
//  DietTracker
//
//  Created by Aaron Huxley on 03/09/2026.
//

import SwiftUI

struct DailyFoodEntriesView: View {

    @Bindable var foodLibraryVM: FoodLibraryViewModel
    @State private var dailyFoodEntriesVM = DailyFoodEntriesViewModel()

    @State private var showEntrySheet = false
    @State private var selectedFoodEntry: FoodEntry?

    var body: some View {
        NavigationStack {
            List {
                dailyTotals
                    .listRowSeparator(.hidden)
                mealSections
            }
            .listStyle(.plain)
            .navigationTitle("Today")
            .safeAreaInset(edge: .bottom) {
                addEntryButton
            }
            .sheet(isPresented: $showEntrySheet) {
                entrySheet
            }
        }
    }
}

// MARK: - Daily Totals

extension DailyFoodEntriesView {

    private var dailyTotals: some View {
        let nutrition = dailyFoodEntriesVM.totalNutrition(for: Date())

        return HStack {
            VStack {
                Text("\(nutrition.calories, specifier: "%.0f") kcal")
                Text("Calories")
            }
            Spacer()
            VStack {
                Text("\(nutrition.protein, specifier: "%.1f") g")
                Text("Protein")
            }
            Spacer()
            VStack {
                Text("\(nutrition.carbohydrates, specifier: "%.1f") g")
                Text("Carbs")
            }
            Spacer()
            VStack {
                Text("\(nutrition.fat, specifier: "%.1f") g")
                Text("Fat")
            }
        }
        .padding(.horizontal)
    }
}

// MARK: - Meal Sections

extension DailyFoodEntriesView {

    @ViewBuilder
    private var mealSections: some View {
        ForEach(MealType.allCases) { mealType in
            Section {
                let entries = dailyFoodEntriesVM.foodEntries(
                    for: Date(),
                    mealType: mealType
                )

                ForEach(entries) { foodEntry in
                    Button {
                        selectedFoodEntry = foodEntry
                        showEntrySheet = true
                    } label: {
                        VStack(alignment: .leading){
                            HStack {
                                Text(foodEntry.food.name)
                                Spacer()
                                Text(String(format: "%.0f cal", foodEntry.nutrition.calories))
                                
                            }
                            Text("\(foodEntry.amount, specifier: "%.0f") x \(foodEntry.nutritionUnit.servingSize) (\(foodEntry.totalAmount)) | Random Brand")
                                .font(.footnote)
                                .foregroundStyle(.secondary)
                        }
                    }
                }
                .onDelete { indexSet in
                    for index in indexSet {
                        dailyFoodEntriesVM.deleteFoodEntry(entries[index])
                    }
                }
            } header: {
                HStack {
                    Text(mealType.rawValue.capitalized)
                    Spacer()
                    Text(String(format: "%.0f cal", dailyFoodEntriesVM.totalNutrition(for: Date()).calories))
                }
                .font(.title2)
            }
        }
    }
}

// MARK: - Add Entry

extension DailyFoodEntriesView {

    private var addEntryButton: some View {
        Button("Add New Food Entry") {
            selectedFoodEntry = nil
            showEntrySheet = true
        }
        .buttonStyle(.borderedProminent)
        .padding()
    }
}

// MARK: - Entry Sheet

extension DailyFoodEntriesView {

    @ViewBuilder
    private var entrySheet: some View {
        if let selectedFoodEntry {
            NavigationView {
                FoodEntryView(
                    food: selectedFoodEntry.food,
                    existingFoodEntry: selectedFoodEntry,
                    onSave: { updatedFoodEntry in
                        dailyFoodEntriesVM.updateFoodEntry(updatedFoodEntry)
                        closeEditor()
                    },
                    onDelete: { foodEntry in
                        dailyFoodEntriesVM.deleteFoodEntry(foodEntry)
                        closeEditor()
                    }
                )
            }
        } else {
            FoodPickerView(
                foodLibraryVM: foodLibraryVM,
                onSave: { foodEntry in
                    dailyFoodEntriesVM.addFoodEntry(foodEntry)
                    closeEditor()
                }
            )
        }
    }
}

// MARK: - Actions

extension DailyFoodEntriesView {

    private func closeEditor() {
        showEntrySheet = false
        selectedFoodEntry = nil
    }
}

#Preview {
    DailyFoodEntriesView(
        foodLibraryVM: FoodLibraryViewModel()
    )
}
