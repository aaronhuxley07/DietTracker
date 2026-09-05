//
//  TabBarView.swift
//  DietTracker
//
//  Created by Aaron Huxley on 04/09/2026.
//

import SwiftUI

struct TabBarView: View {
    
    @State var foodLibraryVM = FoodLibraryViewModel()
    
    var body: some View {
        TabView {
            Tab("Entries", systemImage: "house") {
                DailyFoodEntriesView(foodLibraryVM: foodLibraryVM)
            }
            
            Tab("Library", systemImage: "fork.knife") {
                FoodLibraryView(foodLibraryVM: foodLibraryVM)
            }
        }
    }
}

#Preview {
    TabBarView()
}
