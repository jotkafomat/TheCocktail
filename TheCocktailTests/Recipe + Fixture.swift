//
//  Recipe + Fixture.swift
//  TheCocktailTests
//
//  Created by Krzysztof Jankowski on 24/08/2021.
//

import Foundation

@testable import TheCocktail

extension Recipe {
    static func fixture(
        id: String = "id",
        firstPublicationDate: Date? = Date(),
        headline: String = "headline",
        thumbnail: URL? = URL(string: "thubnail"),
        trailText: String = "trailText",
        byline: String = "byline",
        body: String = "body"
    ) -> Recipe {
        Recipe(
            id: id,
            firstPublicationDate: firstPublicationDate,
            headline: headline,
            thumbnail: thumbnail,
            trailText: trailText,
            byline: byline,
            body: body
        )
    }
}

