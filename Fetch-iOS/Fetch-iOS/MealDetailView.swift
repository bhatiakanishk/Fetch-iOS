//
//  MealDetailView.swift
//  Fetch-iOS
//
//  Created by Kanishk Bhatia on 6/29/23.
//

import Foundation
import SwiftUI
import URLImage

struct MealDetailView: View {
    let meal: Meal
    @StateObject var mealDetailViewModel = MealDetailViewModel()
    
    var body: some View {
        VStack {
            if let mealDetail = mealDetailViewModel.mealDetail {
                // Display the meal name
                Text(meal.strMeal)
                    .font(.headline)
                    .padding()
                
                // Display the remote image of the meal
                RemoteImage(urlString: mealDetail.strMealThumb)
                    .aspectRatio(contentMode: .fit)
                    .frame(height: 200)
                
                // Display the ingredients section
                Text("Ingredients").bold()
                    .padding()
                
                VStack {
                    List {
                        // Iterate over the ingredients and display each one
                        ForEach(mealDetail.ingredients, id: \.self) { ingredient in
                            Text(ingredient)
                        }
                    }
                }
                
                // Display the measurements section
                Text("Measurements").bold()
                    .padding()
                
                VStack {
                    List {
                        // Iterate over the measurements and display each one
                        ForEach(mealDetail.Measurements, id: \.self) { measure in
                            Text(measure)
                        }
                    }
                }
            } else {
                // Display a progress view while meal details are being fetched
                ProgressView()
            }
        }
        // Set the navigation bar title display mode
        .navigationBarTitleDisplayMode(.inline)
        .onAppear {
            // Fetch the meal detail when the view appears/
            mealDetailViewModel.fetchMealDetail(idMeal: meal.idMeal)
        }
    }
}

