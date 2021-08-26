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
        var cancellables = Set<AnyCancellable>()

        init(recipesFetching: RecipesFetching) {
            self.recipes = [Recipe]()
            recipesFetching
                .fetchRecipes()
                .sink(
                    receiveCompletion: {_ in },
                    receiveValue: { [weak self] value in
                        self?.recipes = value
                    }
                )
                .store(in: &cancellables)
        }
    }
}
