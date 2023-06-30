//
//  ViewModel.swift
//  Fetch-iOS
//
//  Created by Kanishk Bhatia on 6/29/23.
//

import Foundation

class MealViewModel: ObservableObject {
    @Published var meals: [Meal] = []
    
    func fetchMeals() {
        guard let url = URL(string: "https://themealdb.com/api/json/v1/1/filter.php?c=Dessert")
        else {
            return
        }
        
        // Perform a URLSession data task to fetch meal data from the provided URL
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data
            else {
                return
            }
            do {
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                // Decode the JSON response into a MealResponse object
                let response = try decoder.decode(MealResponse.self, from: data)
                DispatchQueue.main.async {
                    // Update the meals array with the fetched meals on the main queue
                    self.meals = response.meals
                    print("Meals: ", self.meals)
                }
            } catch {
                print("Error decoding JSON: \(error)")
            }
            // Start the URLSession data task
        }.resume()
    }
}

struct MealResponse: Codable {
    let meals: [Meal]
}
