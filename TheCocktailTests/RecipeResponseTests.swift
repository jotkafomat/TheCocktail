//
//  RecipeResponseTests.swift
//  TheCocktailTests
//
//  Created by Krzysztof Jankowski on 31/08/2021.
//

import Foundation
@testable import TheCocktail
import XCTest

class RecipeResponseTest: XCTestCase {
    
    
    func testRecipeDecodeFromAPIResponse() throws {
        let url = try XCTUnwrap(Bundle(for: type(of: self)).url(forResource:"fullResponse",withExtension:"json"))
        let data = try Data(contentsOf: url)
        
        let response = try Recipe.decoder.decode(RecipeResponse.self, from: data)
        
        XCTAssertEqual(response.results.count, 3)
    }

}
