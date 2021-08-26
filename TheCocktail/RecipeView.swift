//
//  RecipeView.swift
//  TheCocktail
//
//  Created by Krzysztof Jankowski on 25/08/2021.
//

import SwiftUI

struct RecipeView: View {
    
    let viewModel: ViewModel
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(viewModel.headline)
            Text(viewModel.byline)
        }
    }
}

struct RecipeView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeView(viewModel: RecipeView.ViewModel(recipe: cocktails[0]))
    }
}
