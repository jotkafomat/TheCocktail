//
//  RecipesFetchingPlaceholder.swift
//  TheCocktail
//
//  Created by Krzysztof Jankowski on 26/08/2021.
//

import Foundation
import Combine

class RecipesFetchingPlaceholder: RecipesFetching {
    func fetchRecipes() -> AnyPublisher<[Recipe], Error> {
        return Future { $0(.success(cocktails)) }
            .eraseToAnyPublisher()
    }
}
