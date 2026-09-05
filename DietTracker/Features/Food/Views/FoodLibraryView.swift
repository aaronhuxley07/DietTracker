//
//  FoodLibraryView.swift
//  DietTracker
//
//  Created by Aaron Huxley on 04/09/2026.
//

import SwiftUI

struct FoodLibraryView: View {
    
    @Bindable var foodLibraryVM: FoodLibraryViewModel
    
    @State private var showEditor = false
    @State private var selectedFood: Food?
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(foodLibraryVM.foods) { food in
                    Button(food.name) {
                        selectedFood = food
                        showEditor = true
                    }
                }
                .onDelete { indexSet in
                    for index in indexSet {
                        foodLibraryVM.deleteFood(foodLibraryVM.foods[index])
                    }
                }
            }
            .navigationTitle("Library")
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        selectedFood = nil
                        showEditor = true
                    } label: {
                        Image(systemName: "plus")
                    }
                }
            }
        }
        .sheet(isPresented: $showEditor) {
            FoodEditorView(
                food: selectedFood,
                onSave: { food in
                    if selectedFood == nil {
                        foodLibraryVM.addFood(food)
                    } else {
                        foodLibraryVM.updateFood(food)
                    }
                    
                    showEditor = false
                    selectedFood = nil
                }
            )
        }
    }
}
