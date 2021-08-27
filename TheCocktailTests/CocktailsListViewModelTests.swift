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

//    func testViewModelHasArrayOfCoctailsRecipes() throws {
//
//        try XCTSkipIf(true, "skipping for now, keeping it to reuse part of the code")
//        let recipes = [Recipe.fixture(id:"first recipe"), Recipe.fixture(id: "second recipe")]
//        let viewModel = CocktailsListView.ViewModel(recipesFetching: RecipesFetchingPlaceholder())
//
//        XCTAssertEqual(viewModel.recipes.count, 2)
//        XCTAssertEqual(viewModel.recipes[0].id, "first recipe")
//        XCTAssertEqual(viewModel.recipes[1].id, "second recipe")
//    }
    
    func testWhenFetchingStartsPublishesEmptyMenu() throws {
        let cocktailsList = [Recipe.fixture(), Recipe.fixture()]
        let viewModel = CocktailsListView.ViewModel(recipesFetching: RecipeFetchingStub(returning: .success(cocktailsList)))
        
        let recipes = try viewModel.recipes.get()
        
        XCTAssert(recipes.isEmpty)
    }
    
    func testWhenFetchingSucceedsPublishesRecipes() {
        let cocktailsList = [Recipe.fixture(), Recipe.fixture()]
        let viewModel = CocktailsListView.ViewModel(recipesFetching: RecipeFetchingStub(returning: .success(cocktailsList)))
        let expectation = XCTestExpectation(description: "Fetches recipes from Publisher")
        
        viewModel
            .$recipes
            .dropFirst()
            .sink { value in
                guard case .success(let recipes) = value else {
                    return XCTFail("Expected a successful Result, got \(value)")
                }
                XCTAssertEqual(recipes, cocktailsList)
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
                guard case .success(let value) = value else {
                    return XCTFail("Expected a successful Result, got \(value)")
                }
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
    func testWhenFetchingFailsPublishesAnError() {
        let expectedError = TestError(id: 123)
        let recipeFetchingStub = RecipeFetchingStub(returning: .failure(expectedError))
        
        let viewModel = CocktailsListView.ViewModel(recipesFetching: recipeFetchingStub)
        
        let expectation = XCTestExpectation(description: "Publishes an error")
        
        viewModel
            .$recipes
            .dropFirst()
            .sink { value in
                guard case .failure(let error) = value else {
                    return XCTFail("Expected a failing Result, got: \(value)")
                }
                XCTAssertEqual(error as? TestError, expectedError)
                expectation.fulfill()
            }
            .store(in: &cancellables)
        wait(for: [expectation], timeout: 1)
    }

}








public extension Array {
    subscript (safe index: Int) -> Element? {
        return self.indices ~= index ? self[index] : nil
    }
}
