//
//  CocktailsListView.swift
//  TheCocktail
//
//  Created by Krzysztof Jankowski on 26/08/2021.
//
import SwiftUI

struct CocktailsListView: View {
    
    @ObservedObject var viewModel: ViewModel
    
    var body: some View {
        switch viewModel.recipes {
        case .success(let recipes):
            List {
                ForEach(recipes) { recipe in
                    RecipeView(viewModel: RecipeView.ViewModel(recipe: recipe))
                }
            }
        case .failure(let error):
            VStack {
                Text("An error occurred")
                Text(error.localizedDescription).italic()
            }
            
        }
    }
}

struct CocktailsListView_Previews: PreviewProvider {
    static var previews: some View {
        CocktailsListView(viewModel: CocktailsListView.ViewModel(recipesFetching: RecipesFetchingPlaceholder()))
    }
}
