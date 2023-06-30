//
//  MealDetailViewModel.swift
//  Fetch-iOS
//
//  Created by Kanishk Bhatia on 6/29/23.
//

import Foundation
import SwiftUI

class MealDetailViewModel: ObservableObject {
    @Published var mealDetail: MealDetail?
    
    func fetchMealDetail(idMeal: String) {
        guard let url = URL(string: "https://themealdb.com/api/json/v1/1/lookup.php?i=\(idMeal)")
        else {
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                print("Error fetching meal detail:  \(error.localizedDescription)")
                return
            }
            if let data = data {
                do {
                    let decoder = JSONDecoder()
                    decoder.keyDecodingStrategy = .convertFromSnakeCase
                    let response = try decoder.decode(MealDetailResponse.self, from: data)
                    if let meal = response.meals.first {
                        DispatchQueue.main.async {
                            self.mealDetail = meal
                        }
                    }
                } catch {
                    print("Error decoding meal detail response: \(error.localizedDescription) ")
                }
            }
        }.resume()
    }
}

struct MealDetailResponse: Codable {
    let meals: [MealDetail]
}
