//
//  ContentView.swift
//  Fetch-iOS
//
//  Created by Kanishk Bhatia on 6/29/23.
//

import SwiftUI
import URLImage

struct ContentView: View {
    
    @ObservedObject var mealViewModel = MealViewModel()
    @State private var selectedMeal: Meal? = nil

        var body: some View {
            NavigationView {
                List(mealViewModel.meals) { meal in
                    VStack(alignment: .leading) {
                        Text(meal.strMeal)
                            .font(.headline)
                    }
                    .onTapGesture {
                        selectedMeal = meal
                    }
                }
                .navigationBarTitle("Desserts")
                .sheet(item: $selectedMeal) { meal in
                    MealDetailView(meal: meal)
                }
            }
            .onAppear {
                mealViewModel.fetchMeals()
            }
        }
    }

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
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
