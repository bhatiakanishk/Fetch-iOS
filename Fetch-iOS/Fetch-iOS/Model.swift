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
        case measurements = "strMeasure"
        case instructions = "strInstructions"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        mealThumbnail = try container.decode(String.self, forKey: .mealThumbnail)
        instructions = try container.decode(String.self, forKey: .instructions)
        
        var ingridents: [String] = []
        var measurements: [String] = []
        
        for key in container.allKeys {
            if key.stringValue.hasPrefix("strIngredient") {
                if let ingrident = try container.decodeIfPresent(String.self, forKey: key) {
                    ingridents.append(ingrident)
                }
            } else if key.stringValue.hasPrefix("strMeasure") {
                if let measurement = try container.decodeIfPresent(String.self, forKey: key) {
                    measurements.append(measurement)
                }
            }
        }
        self.ingredients = ingridents.filter { !$0.isEmpty }
        self.measurements = measurements.filter { !$0.isEmpty }
    }
}
