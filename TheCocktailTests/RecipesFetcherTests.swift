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

    func testWhenRequestSucceedsPublishesDecodedItems() throws {
        
        let url = try XCTUnwrap(Bundle(for: type(of: self)).url(forResource:"fullResponse",withExtension:"json"))
        let data = try Data(contentsOf: url)
        
        let recipesFetcher = RecipesFetcher(networkFetching: NetworkFetchingStub(returning: .success(data)))
        
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
    func testWhenRequestFailsPublishesError() {
        let expectedError = URLError(.badServerResponse)
        let recipesFetcher = RecipesFetcher(networkFetching: NetworkFetchingStub(returning: .failure(expectedError)))
        let expectation = XCTestExpectation(description: "Publishes received URLError")
        
        recipesFetcher.fetchRecipes()
            .sink(
                receiveCompletion: { completion in
                    guard case .failure(let error) = completion else { return }
                    XCTAssertEqual(error as? URLError, expectedError)
                    expectation.fulfill()
                }, receiveValue: { items in
                    XCTFail("expected to fail, succeeded with \(items)")
                }
            )
            .store(in: &cancellables)
        wait(for: [expectation], timeout: 1)
    }

    
}
