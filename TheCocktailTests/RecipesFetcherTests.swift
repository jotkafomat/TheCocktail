//
//  RecipesFetcherTests.swift
//  TheCocktailTests
//
//  Created by Krzysztof Jankowski on 02/09/2021.
//
import Combine
import XCTest
@testable import TheCocktail

class RecipesFetcherTests: XCTestCase {
    
    var cancellables = Set<AnyCancellable>()

    func testWhenRequestSucceedsPublishesDecodedItems() {
        let recipesFetcher = RecipesFetcher()
        
        let expectation = XCTestExpectation(description: "Publishes decoded [Recipes]")
        
        recipesFetcher.fetchRecipes()
            .sink(
                receiveCompletion: {_ in },
                receiveValue: {items in
                    XCTAssertEqual(items.count, 3)
                    expectation.fulfill()
                }
            )
            .store(in: &cancellables)
    }
    func testWhenRequestFailsPublishesError() {}

    
}
