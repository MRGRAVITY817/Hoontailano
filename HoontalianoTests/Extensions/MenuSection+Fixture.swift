//
//  MenuSection+Fixture.swift
//  HoontalianoTests
//
//  Created by Hoon Wee on 2023/08/17.
//

@testable import Hoontaliano
import Foundation

extension MenuSection {
    static func fixture(
        category: String = "a category",
        items: [MenuItem] = [.fixture()]
    ) -> MenuSection {
        return MenuSection(category: category, items: items)
    }
}
