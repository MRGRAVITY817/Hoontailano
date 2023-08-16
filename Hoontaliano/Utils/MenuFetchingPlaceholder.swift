//
//  MenuFetchingPlaceholder.swift
//  Hoontaliano
//
//  Created by Hoon Wee on 2023/08/17.
//

import Combine
import Foundation

class MenuFetchingPlaceholder: MenuFetching {
    func fetchMenu() -> AnyPublisher<[MenuItem], Error> {
        return Future { $0(.success(MockData().menu)) }
            .delay(for: 0.5, scheduler: RunLoop.main)
            .eraseToAnyPublisher()
    }
}
