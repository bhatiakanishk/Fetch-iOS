//
//  ViewModel.swift
//  Fetch-iOS
//
//  Created by Kanishk Bhatia on 6/29/23.
//

import Foundation

class ViewModel: ObservableObject {
    @Published var meals: [Meal] = []
    
    func fetchMeals() {
        guard let url = URL(string: "https://themealdb.com/api/json/v1/1/filter.php?c=Dessert")
        else {
            return
        }
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data
            else {
                return
            }
            do {
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                let response = try decoder.decode(MealResponse.self, from: data)
                DispatchQueue.main.async {
                    self.meals = response.meals
                    print("Meals: ", self.meals)
                }
            } catch {
                print("Error decoding JSON: \(error)")
            }
        }.resume()
    }
}

struct MealResponse: Codable {
    let meals: [Meal]
}
