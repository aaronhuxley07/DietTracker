//
//  FoodEntryView.swift
//  DietTracker
//
//  Created by Aaron Huxley on 03/09/2026.
//

import SwiftUI

struct FoodEntryView: View {
    @State private var name = ""
    @State private var calories = ""
    @State private var protein = ""
    @State private var carbohydrates = ""
    @State private var fat = ""
    @State private var date = Date()

    var body: some View {
        Form {
            Section("Food") {
                TextField("Name", text: $name)
                TextField("Calories", text: $calories)
                    .keyboardType(.decimalPad)
            }

            Section("Macros") {
                TextField("Protein (g)", text: $protein)
                    .keyboardType(.decimalPad)
                TextField("Carbohydrates (g)", text: $carbohydrates)
                    .keyboardType(.decimalPad)
                TextField("Fat (g)", text: $fat)
                    .keyboardType(.decimalPad)
            }

            Section("Date") {
                DatePicker("Date", selection: $date, displayedComponents: .date)
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
