//
//  CoctailsListViewModel.swift
//  TheCocktail
//
//  Created by Krzysztof Jankowski on 26/08/2021.
//

import Foundation

extension CocktailsListView {
    
    struct ViewModel {
        let recipes: [Recipe]
        
        init(recipes: [Recipe] = [Recipe]()) {
            self.recipes = recipes
        }
    }
}
