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
    
    func test_RecipeViewModelDisplayImageURL() {
        //arrange
        let recipe = Recipe.fixture(thumbnail: URL(string:"https://media.guim.co.uk/04359a6bc8bdc2ca017a39be497a253cb4af4b38/0_955_3275_1965/500.jpg"))
        let viewModel = RecipeView.ViewModel(recipe: recipe)
        //act
        let image = viewModel.image
        //assert
        XCTAssertEqual(image, recipe.thumbnail)
    }
    
    func test_RecipeViewModelDisplaybyline() {
        //arrange
        let recipe = Recipe.fixture(byline: "Sam Jones")
        let viewModel = RecipeView.ViewModel(recipe: recipe)
        //act
        let image = viewModel.byline
        //assert
        XCTAssertEqual(image, recipe.byline)
    }

}
