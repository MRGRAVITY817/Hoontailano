//
//  URLSession+NetworkFetching.swift
//  Hoontaliano
//
//  Created by Hoon Wee on 2023/08/17.
//

import Combine
import Foundation

extension URLSession: NetworkFetching {
    func load(_ request: URLRequest) -> AnyPublisher<Data, URLError> {
        return dataTaskPublisher(for: request)
            .map { $0.data }
            .eraseToAnyPublisher()
    }
}
