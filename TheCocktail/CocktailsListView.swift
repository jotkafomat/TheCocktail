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
        List {
            ForEach(viewModel.recipes) { recipe in
                RecipeView(viewModel: RecipeView.ViewModel(recipe: recipe))
            }
        }
    }
}

struct CocktailsListView_Previews: PreviewProvider {
    static var previews: some View {
        CocktailsListView(viewModel: CocktailsListView.ViewModel(recipesFetching: RecipesFetchingPlaceholder()))
    }
}
