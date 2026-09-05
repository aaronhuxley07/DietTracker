//
//  FoodPickerView.swift
//  DietTracker
//
//  Created by Aaron Huxley on 03/09/2026.
//

import SwiftUI

struct FoodPickerView: View {
    @State var foodLibraryVM: FoodLibraryViewModel
    
    var onSave: (FoodEntry) -> Void
    @Environment(\.dismiss) private var dismiss
    
    @State private var showEditor = false
    
    var body: some View {
        NavigationView {
            VStack {
                List {
                    ForEach(foodLibraryVM.foods) { food in
                        NavigationLink(food.name) {
                            FoodEntryView(food: food) { foodEntry in
                                onSave(foodEntry)
                                dismiss()
                            } onDelete: { _ in }
                        }
                    }
                    .onDelete { indexSet in
                        for index in indexSet {
                            foodLibraryVM.deleteFood(foodLibraryVM.foods[index])
                        }
                    }
                }
            }
            .navigationTitle("Food Library")
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        showEditor = true
                    } label: {
                        Image(systemName: "plus")
                    }
                }
            }
            .sheet(isPresented: $showEditor) {
                FoodEditorView(
                    onSave: { food in
                        foodLibraryVM.addFood(food)
                        showEditor = false
                    }
                )
            }
        }
    }
}
