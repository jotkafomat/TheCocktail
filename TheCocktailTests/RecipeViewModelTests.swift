//
//  RecipeViewModelTests.swift
//  TheCocktailTests
//
//  Created by Krzysztof Jankowski on 24/08/2021.
//

import XCTest
@testable import TheCocktail

class RecipeViewModelTests: XCTestCase {

    func test_RecipeViewModelDisplayHeadline() {
        //arrange
        let recipe = Recipe.fixture(headline: "headline")
        let viewModel = RecipeView.ViewModel(recipe: recipe)
        //act
        let headline = viewModel.headline
        //assert
        XCTAssertEqual(headline, "headline")
    }

}
