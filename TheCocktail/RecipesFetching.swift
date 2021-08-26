//
//  RecipesFetching.swift
//  TheCocktail
//
//  Created by Krzysztof Jankowski on 26/08/2021.
//

import Foundation
import Combine

protocol RecipesFetching {
    func fetchRecipes() -> AnyPublisher<[Recipe], Error>
}
