//
//  RecipesFetcher.swift
//  TheCocktail
//
//  Created by Krzysztof Jankowski on 02/09/2021.
//

import Foundation
import Combine

class RecipesFetcher: RecipesFetching {
    
    func fetchRecipes() -> AnyPublisher<[Recipe], Error> {
        let url = URL(string: "https://content.guardianapis.com/food/series/the-good-mixer?api-key=438d1261-9311-4def-b60b-36b65295dfa0&show-fields=headline,trailText,byline,thumbnail,body,firstPublicationDate&page-size=3")!
        return URLSession.shared
            .dataTaskPublisher(for: URLRequest(url: url))
            .map{ $0.data }
            .decode(type: [Recipe].self, decoder: Recipe.decoder)
            .eraseToAnyPublisher()
    }
}
