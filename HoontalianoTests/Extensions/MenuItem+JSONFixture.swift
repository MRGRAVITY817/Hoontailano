//
//  MenuItem+JSONFixture.swift
//  HoontalianoTests
//
//  Created by Hoon Wee on 2023/08/17.
//

@testable import Hoontaliano
import Foundation

extension MenuItem {
    static func jsonFixture(
        name: String = "a name",
        category: String = "a category",
        spicy: Bool = false,
        price: Double = 0.00
    ) -> String {
        return """
{
    "name": "\(name)",
    "category": "\(category)",
    "spicy": \(spicy),
    "price": \(price)
}
"""
    }
}
