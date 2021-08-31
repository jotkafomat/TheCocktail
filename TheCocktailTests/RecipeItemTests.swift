//
//  RecipeItemTests.swift
//  TheCocktailTests
//
//  Created by Krzysztof Jankowski on 31/08/2021.
//

import XCTest
@testable import TheCocktail

class RecipeItemTests: XCTestCase {

    func testDecodesFromJSONData() throws {
       
        let url = try XCTUnwrap(Bundle(for: type(of: self)).url(forResource:"recipeItem",withExtension:"json"))
        let data = try Data(contentsOf: url)
        
        let item = try Recipe.decoder.decode(Recipe.self, from: data)
        
        XCTAssertEqual(
            item.id,
            "food/2021/aug/13/cocktail-of-the-week-pali-hill-champagne-lassi-recipe-mango-sorbet-indian-independence-day"
        )
    }
}
