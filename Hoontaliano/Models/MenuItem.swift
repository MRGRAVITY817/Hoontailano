//
//  MenuItem.swift
//  Hoontaliano
//
//  Created by Hoon Wee on 2023/08/16.
//

import Foundation

struct MenuItem {
    let category: String
    let name: String
    let spicy: Bool
    let price: Double
}

extension MenuItem: Identifiable {
    var id: String { name }
}

extension MenuItem: Equatable, Decodable {}

