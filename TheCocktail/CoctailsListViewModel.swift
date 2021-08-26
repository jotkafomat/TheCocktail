//
//  CoctailsListViewModel.swift
//  TheCocktail
//
//  Created by Krzysztof Jankowski on 26/08/2021.
//

import Foundation
import Combine

extension CocktailsListView {
    
    class ViewModel: ObservableObject {
        
        @Published private(set) var recipes: [Recipe]
        
        init(recipesFetching: RecipesFetching) {
            self.recipes = [Recipe]()
        }
    }
}
