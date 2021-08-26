//
//  CocktailsListViewModelTests.swift
//  TheCocktailTests
//
//  Created by Krzysztof Jankowski on 26/08/2021.
//

import XCTest
@testable import TheCocktail

class CocktailsListViewModelTests: XCTestCase {

    func testViewModelHasArrayOfCoctailsRecipes() {
        let recipes = [Recipe.fixture(id:"first recipe"), Recipe.fixture(id: "second recipe")]
        let viewModel = CocktailsListView.ViewModel(recipes: recipes)
        
        XCTAssertEqual(viewModel.recipes.count, 2)
        XCTAssertEqual(viewModel.recipes[0].id, "first recipe")
        XCTAssertEqual(viewModel.recipes[1].id, "second recipe")
    }

}
