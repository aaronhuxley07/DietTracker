//
//  DailyFoodView.swift
//  DietTracker
//
//  Created by Aaron Huxley on 03/09/2026.
//

import SwiftUI

struct DailyFoodView: View {
    
    @State var dailyFoodVM = DailyFoodViewModel()
    
    @State private var showPopup = false
    @State private var selectedFood: Food?
    
    var body: some View {
        NavigationView {
            VStack {
                List {
                    ForEach(dailyFoodVM.foodList) { food in
                        Button(food.name) {
                            selectedFood = food
                            showPopup = true
                        }
                    }
                }
                
                Button("Add Food") {
                    selectedFood = nil
                    showPopup = true
                }
            }
            .navigationTitle("Food List")
            .popover(isPresented: $showPopup) {
                if let selectedFood {
                    FoodEntryView(
                        existingFood: selectedFood,
                        onSave: { updatedFood in
                            dailyFoodVM.updateFood(updatedFood)
                            showPopup = false
                            self.selectedFood = nil
                        },
                        onDelete: { food in
                            dailyFoodVM.deleteFood(food)
                            showPopup = false
                            self.selectedFood = nil
                        }
                    )
                } else {
                    FoodEntryView(
                        onSave: { food in
                            dailyFoodVM.addFoodToList(food)
                            showPopup = false
                        },
                        onDelete: { _ in }
                    )
                }
            }
        }
    }
}

#Preview {
    DailyFoodView()
}
