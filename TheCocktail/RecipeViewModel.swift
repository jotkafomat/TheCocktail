//
//  RecipeViewModel.swift
//  TheCocktail
//
//  Created by Krzysztof Jankowski on 24/08/2021.
//

import Foundation

extension RecipeView {
    struct ViewModel  {
        
        private let recipe: Recipe
        let headline: String
        
        init(recipe: Recipe) {
            self.recipe = recipe
            headline = recipe.headline
        }
    }
}
