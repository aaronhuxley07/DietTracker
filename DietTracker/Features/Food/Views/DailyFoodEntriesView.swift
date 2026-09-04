//
//  DailyFoodEntriesView.swift
//  DietTracker
//
//  Created by Aaron Huxley on 03/09/2026.
//

import SwiftUI

struct DailyFoodEntriesView: View {
    
    @State var foodLibraryVM = FoodLibraryViewModel()
    @State var dailyFoodEntriesVM = DailyFoodEntriesViewModel()
    
    @State private var showPopup = false
    @State private var selectedFoodEntry: FoodEntry?
    
    var body: some View {
        NavigationView {
            VStack {
                List {
                    ForEach(dailyFoodEntriesVM.foodEntries) { foodEntry in
                        if let food = foodLibraryVM.foods.first(where: { $0.id == foodEntry.foodID }) {
                            Button(food.name) {
                                selectedFoodEntry = foodEntry
                                showPopup = true
                            }
                        }
                    }
                }
                
                Button("Add New Food Entry") {
                    selectedFoodEntry = nil
                    showPopup = true
                }
            }
            .navigationTitle("Food Entries List")
            .popover(isPresented: $showPopup) {
                if let selectedFoodEntry,
                   let food = foodLibraryVM.foods.first(where: { $0.id == selectedFoodEntry.foodID }) {
                    FoodEntryView(
                        food: food,
                        existingFoodEntry: selectedFoodEntry,
                        onSave: { updatedFoodEntry in
                            dailyFoodEntriesVM.updateFoodEntry(updatedFoodEntry)
                            showPopup = false
                            self.selectedFoodEntry = nil
                        },
                        onDelete: { foodEntry in
                            dailyFoodEntriesVM.deleteFoodEntry(foodEntry)
                            showPopup = false
                            self.selectedFoodEntry = nil
                        }
                    )
                } else {
                    FoodLibraryView(
                        foodLibraryVM: foodLibraryVM,
                        onSave: { foodEntry in
                            dailyFoodEntriesVM.addFoodEntry(foodEntry)
                        }
                    )
                }
            }
        }
    }
}

#Preview {
    DailyFoodEntriesView()
}
