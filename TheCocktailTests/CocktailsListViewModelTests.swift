//
//  CocktailsListViewModelTests.swift
//  TheCocktailTests
//
//  Created by Krzysztof Jankowski on 26/08/2021.
//

import Combine
import XCTest
@testable import TheCocktail

class CocktailsListViewModelTests: XCTestCase {
    
    var cancellables = Set<AnyCancellable>()

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
        
        XCTAssert(viewModel.recipes.isEmpty)
    }
    
    func testWhenFetchingSucceedsPublishesRecipes() {

        let viewModel = CocktailsListView.ViewModel(recipesFetching: RecipesFetchingPlaceholder())
        let expectation = XCTestExpectation(description: "Fetches recipes from Publisher")
        
        viewModel
            .$recipes
            .dropFirst()
            .sink { value in
                XCTAssertEqual(value, cocktails)
                expectation.fulfill()
            }
            .store(in: &cancellables)
        wait(for: [expectation], timeout: 0.1)
    }

}
