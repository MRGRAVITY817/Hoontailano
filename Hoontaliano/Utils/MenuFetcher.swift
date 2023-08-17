//
//  MenuFetcher.swift
//  Hoontaliano
//
//  Created by Hoon Wee on 2023/08/17.
//

import Combine
import Foundation

class MenuFetcher: MenuFetching {
    func fetchMenu() -> AnyPublisher<[MenuItem], Error> {
        let url = URL(string: "https://raw.githubusercontent.com/mokagio/tddinswift_fake_api/trunk/menu_response.json")!
        
        return URLSession.shared
            .dataTaskPublisher(for: URLRequest(url: url))
            .map { $0.data }
            .decode(type: [MenuItem].self, decoder: JSONDecoder())
            .eraseToAnyPublisher()
    }
}
