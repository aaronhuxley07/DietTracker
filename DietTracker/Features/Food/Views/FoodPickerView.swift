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
                }
            }
            .navigationTitle("Food Library")
        }
    }
}
