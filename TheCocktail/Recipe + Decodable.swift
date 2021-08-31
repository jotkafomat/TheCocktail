//
//  Recipe + Decodable.swift
//  TheCocktail
//
//  Created by Krzysztof Jankowski on 31/08/2021.
//

import Foundation

extension Recipe: Decodable {
    enum CodingKeys: String, CodingKey {
        case id, fields
    }
    enum FieldsKeys: String, CodingKey {
        case headline, thumbnail, trailText, byline, body, firstPublicationDate
    }
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        id = try container.decode(String.self, forKey: .id)
        let fieldsContainer = try container.nestedContainer(keyedBy: FieldsKeys.self, forKey: .fields)
        headline = try fieldsContainer.decode(String.self, forKey: .headline)
        thumbnail = try fieldsContainer.decodeIfPresent(URL.self, forKey: .thumbnail)
        trailText = try fieldsContainer.decode(String.self, forKey: .trailText)
        byline = try fieldsContainer.decode(String.self, forKey: .byline)
        body = try fieldsContainer.decode(String.self, forKey: .body)
        firstPublicationDate = try fieldsContainer.decodeIfPresent(Date.self, forKey: .firstPublicationDate)
    }
    static let decoder: JSONDecoder = {
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .iso8601
        return decoder
    }()
}
