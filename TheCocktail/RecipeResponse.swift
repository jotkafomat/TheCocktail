//
//  RecipeResponse.swift
//  TheCocktail
//
//  Created by Krzysztof Jankowski on 31/08/2021.
//

import Foundation

struct RecipeResponse {
        
    let results: [Recipe]
}

extension RecipeResponse: Decodable {
    enum CodingKeys: String, CodingKey {
        case response
    }
    enum ResponseKeys: String, CodingKey {
        case results
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let responseContainer = try container.nestedContainer(keyedBy: ResponseKeys.self, forKey: .response)
        results = try responseContainer.decode([Recipe].self, forKey: .results)
    }
}
