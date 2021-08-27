//
//  RecipeFetchingStub.swift
//  TheCocktailTests
//
//  Created by Krzysztof Jankowski on 27/08/2021.
//

import Combine
import Foundation
@testable import TheCocktail

class RecipeFetchingStub: RecipesFetching {
    
    let result: Result<[Recipe], Error>
    
    init(returning result: Result<[Recipe], Error>) {
        self.result = result
    }
    
    func fetchRecipes() -> AnyPublisher<[Recipe], Error> {
        return result.publisher
            .delay(for: 0.1, scheduler: RunLoop.main)
            .eraseToAnyPublisher()
    }
}
