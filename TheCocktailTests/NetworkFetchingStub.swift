//
//  NetworkFetchingStub.swift
//  TheCocktailTests
//
//  Created by Krzysztof Jankowski on 02/09/2021.
//

import Foundation
import Combine
@testable import TheCocktail

class NetworkFetchingStub: NetworkFetching {
    
    private let result: Result<Data, URLError>
    
    init(returning result: Result<Data, URLError>) {
        self.result = result
    }
    
    
    func load(_ request: URLRequest) -> AnyPublisher<Data, URLError> {
        return result.publisher
            .delay(for: 0.01, scheduler: RunLoop.main)
            .eraseToAnyPublisher()
    }
}
