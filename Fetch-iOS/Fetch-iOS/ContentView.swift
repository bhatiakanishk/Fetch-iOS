//
//  ContentView.swift
//  Fetch-iOS
//
//  Created by Kanishk Bhatia on 6/29/23.
//

import SwiftUI
import URLImage

struct ContentView: View {
    
    // Create an instance of the MealViewModel to manage meal data
    @ObservedObject var mealViewModel = MealViewModel()
    @State private var selectedMeal: Meal? = nil

        var body: some View {
            NavigationView {
                // Display a list of meals fetched from mealViewModel
                List(mealViewModel.meals) { meal in
                    VStack(alignment: .leading) {
                        // Display the name of the meal
                        Text(meal.strMeal)
                            .font(.headline)
                    }
                    .onTapGesture {
                        // Set the seleted meal when a meal is tapped
                        selectedMeal = meal
                    }
                }
                .navigationBarTitle("Desserts")
                .sheet(item: $selectedMeal) { meal in
                    // Present the MealDetailView as a sheet when a meal is selected
                    MealDetailView(meal: meal)
                }
            }
            .onAppear {
                // Fetch meals when the view appears
                mealViewModel.fetchMeals()
            }
        }
    }

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

// Custom view for displaying a remote image
struct RemoteImage: View {
    let urlString: String
    
    var body: some View {
        URLImage(URL(string: urlString)!) { image in
            image
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(height: 200)
        }
    }
}
