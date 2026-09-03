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
    
    var body: some View {
        NavigationView {
            VStack{
                List{
                    ForEach(dailyFoodVM.foodList) { food in
                        Text(food.name)
                    }
                }
                
                Button("Add Food") {
                    showPopup = true
                }
            }
            .navigationTitle("Food List")
            .popover(isPresented: $showPopup) {
                FoodEntryView { food in
                    dailyFoodVM.addFoodToList(food)
                    showPopup = false
                }
            }
        }
    }
}

#Preview {
    DailyFoodView()
}
