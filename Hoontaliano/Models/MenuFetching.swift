//
//  MenuFetching.swift
//  Hoontaliano
//
//  Created by Hoon Wee on 2023/08/17.
//

import Combine

protocol MenuFetching {
    func fetchMenu() -> AnyPublisher<[MenuItem], Error>
}

