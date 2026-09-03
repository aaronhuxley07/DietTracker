//
//  FoodEntryView.swift
//  DietTracker
//
//  Created by Aaron Huxley on 03/09/2026.
//

import SwiftUI

struct FoodEntryView: View {

    @State var foodVM = FoodViewModel()

    var body: some View {
        Form {
            Section("Food") {
                TextField("Name", text: $foodVM.name)

                TextField("Calories", text: $foodVM.calories)
                    .keyboardType(.decimalPad)
            }

            Section("Macros") {
                TextField("Protein (g)", text: $foodVM.protein)
                    .keyboardType(.decimalPad)

                TextField("Carbohydrates (g)", text: $foodVM.carbohydrates)
                    .keyboardType(.decimalPad)

                TextField("Fat (g)", text: $foodVM.fat)
                    .keyboardType(.decimalPad)
            }

            Section("Date") {
                DatePicker(
                    "Date",
                    selection: $foodVM.date,
                    displayedComponents: .date
                )
            }

            Section {
                Button("Add") {
                    // Add food here
                }
            }
        }
        .navigationTitle("Add Food")
    }
}

#Preview {
    NavigationStack {
        FoodEntryView()
    }
}
