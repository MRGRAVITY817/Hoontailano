//
//  NetworkFetching.swift
//  Hoontaliano
//
//  Created by Hoon Wee on 2023/08/17.
//

import Combine
import Foundation

/// Protocol that all fetchers should conform.
protocol NetworkFetching {
    func load(_ request: URLRequest) -> AnyPublisher<Data, URLError>
}
