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
                                Text("X kcal")
                            }
                            Text("2 x 100g (200g) | Random Brand")
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
                    Text("X kcal")
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
