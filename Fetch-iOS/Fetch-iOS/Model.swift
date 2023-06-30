//
//  Model.swift
//  Fetch-iOS
//
//  Created by Kanishk Bhatia on 6/29/23.
//

import Foundation
import URLImage

struct Meal: Identifiable, Codable {
    var id = UUID()
    let mealId: String
    let mealName: String
    let mealThumbnail: String
}

struct MealDetail: Codable {
    let mealThumbnail: String
    let ingredients: [String]
    let measurements: [String]
    let instructions: String
    
    private enum CodingKeys: String, CodingKey {
        case mealThumbnail = "strMealThumb"
        case ingredients = "strIngredient"
        case measurements = "strMeasurements"
        case instructions = "strInstructions"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        mealThumbnail = try container.decode(String.self, forKey: .mealThumbnail)
    }
}
