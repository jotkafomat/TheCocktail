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
        let cocktailsList = [Recipe.fixture(), Recipe.fixture()]
        let viewModel = CocktailsListView.ViewModel(recipesFetching: RecipeFetchingStub(returning: .success(cocktailsList)))
        let expectation = XCTestExpectation(description: "Fetches recipes from Publisher")
        
        viewModel
            .$recipes
            .dropFirst()
            .sink { value in
                XCTAssertEqual(value, cocktailsList)
                expectation.fulfill()
            }
            .store(in: &cancellables)
        wait(for: [expectation], timeout: 0.1)
    }
    
    func testWhenFetchingSucceedsPublishesRecipesAfterEmptyArray() {

        let cocktailsList = [Recipe.fixture(), Recipe.fixture()]
        let viewModel = CocktailsListView.ViewModel(recipesFetching: RecipeFetchingStub(returning: .success(cocktailsList)))
        let expectation = XCTestExpectation(description: "Fetches recipes from Publisher")
        var values: [[Recipe]] = []
        
        viewModel
            .$recipes
            .sink { value in
                
                values = values + [value]
                guard values.count == 2 else { return }
                
                guard let defaultCoctails = values.first else {
                    return XCTFail("Value has no elements but expected one")
                }
                XCTAssert(defaultCoctails.isEmpty)
                
                guard let cocktails = values[safe: 1] else {
                    return XCTFail("Expected a value at index 1, got none")
                }
                
                XCTAssertEqual(value, cocktails)
                expectation.fulfill()
            }
            .store(in: &cancellables)
        wait(for: [expectation], timeout: 0.1)
    }

}

public extension Array {
    subscript (safe index: Int) -> Element? {
        return self.indices ~= index ? self[index] : nil
    }
}
