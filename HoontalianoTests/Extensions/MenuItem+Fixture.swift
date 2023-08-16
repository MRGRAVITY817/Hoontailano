//
//  MenuItem+Fixture.swift
//  HoontalianoTests
// //  Created by Hoon Wee on 2023/08/17.
//

@testable import Hoontaliano
import Foundation

extension MenuItem {
    static func fixture(
        category: String = "category",
        name: String = "name",
        spicy: Bool = false
    ) -> MenuItem {
        MenuItem(category: category, name: name, spicy: spicy)
    }
}

