//
//  RecipesFetcher.swift
//  TheCocktail
//
//  Created by Krzysztof Jankowski on 02/09/2021.
//

import Foundation
import Combine

class RecipesFetcher: RecipesFetching {
    
    let networkFetching: NetworkFetching
    
    init(networkFetching: NetworkFetching = URLSession.shared) {
        self.networkFetching = networkFetching
    }
    
    func fetchRecipes() -> AnyPublisher<[Recipe], Error> {
        let url = URL(string: "https://content.guardianapis.com/food/series/the-good-mixer?api-key=438d1261-9311-4def-b60b-36b65295dfa0&show-fields=headline,trailText,byline,thumbnail,body,firstPublicationDate&page-size=3")!
        return networkFetching
            .load(URLRequest(url: url))
            .decode(type: [Recipe].self, decoder: Recipe.decoder)
            .eraseToAnyPublisher()
    }
}
