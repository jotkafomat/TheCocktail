//
//  CocktailsListViewModelTests.swift
//  TheCocktailTests
//
//  Created by Krzysztof Jankowski on 26/08/2021.
//

import XCTest
@testable import TheCocktail

class CocktailsListViewModelTests: XCTestCase {

    func testViewModelHasArrayOfCoctailsRecipes() throws {
        
        try XCTSkipIf(true, "skipping for now, keeping it to reuse part of the code")
        let recipes = [Recipe.fixture(id:"first recipe"), Recipe.fixture(id: "second recipe")]
        let viewModel = CocktailsListView.ViewModel(recipesFetching: RecipesFetchingPlaceholder())
        
        XCTAssertEqual(viewModel.recipes.count, 2)
        XCTAssertEqual(viewModel.recipes[0].id, "first recipe")
        XCTAssertEqual(viewModel.recipes[1].id, "second recipe")
    }
    
    func testWhenFetchingStartsPublishesEmptyMenu() {
        let viewModel = CocktailsListView.ViewModel(recipesFetching: RecipesFetchingPlaceholder())
        
        XCTAssertTrue(viewModel.recipes.isEmpty)
    }
    
    func testWhenFetchingSucceedsPublishesRecipes() {
        
    }

}
