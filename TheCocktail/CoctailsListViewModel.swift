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
        
        @Published private(set) var recipes: Result<[Recipe], Error> = .success([])
        var cancellables = Set<AnyCancellable>()

        init(recipesFetching: RecipesFetching) {
            recipesFetching
                .fetchRecipes()
                .receive(on: RunLoop.main)
                .sink(
                    receiveCompletion: { [weak self] completion in
                        guard case .failure(let error) = completion else { return }
                        self?.recipes = .failure(error)
                    },
                    receiveValue: { [weak self] value in
                        self?.recipes = .success(value)
                    }
                )
                .store(in: &cancellables)
        }
    }
}
