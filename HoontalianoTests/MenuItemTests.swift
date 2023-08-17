//
//  MenuItemTests.swift
//  HoontalianoTests
//
//  Created by Hoon Wee on 2023/08/17.
//

@testable import Hoontaliano
import XCTest

final class MenuItemTests: XCTestCase {
    func test_WhenDecodedFromJSON_DataHasAllTheInputProperties() throws {
        // Arrange
        let url = try XCTUnwrap(
            Bundle(for: type(of: self)).url(forResource: "menu_item", withExtension: "json")
        )
        let data = try Data(contentsOf: url)
        
        // Act
        let item = try JSONDecoder().decode(MenuItem.self, from: data)
        
        // Assert
        XCTAssertEqual(item.name, "a name")
        XCTAssertEqual(item.category, "a category")
        XCTAssertEqual(item.spicy, true)
    }
    
    func test_WhenDecodedFromJSON() throws {
        let json = MenuItem.jsonFixture(
            name: "a name",
            category: "a category",
            spicy: false,
            price: 1.11
        )
        let data = try XCTUnwrap(json.data(using: .utf8))
        
        // Act
        let item = try JSONDecoder().decode(MenuItem.self, from: data)
        
        // Assert
        XCTAssertEqual(item.name, "a name")
        XCTAssertEqual(item.category, "a category")
        XCTAssertEqual(item.spicy, false)
        XCTAssertEqual(item.price, 1.11)
    }
    
    func test_DecodeListOfMenuItems() throws {
        // Arrange
        let json1 = MenuItem.jsonFixture(name: "One")
        let json2 = MenuItem.jsonFixture(name: "Two")
        let json3 = MenuItem.jsonFixture(name: "Three")
        let data = try XCTUnwrap("[\(json1), \(json2), \(json3)]".data(using: .utf8))
        
        // Act
        let item = try JSONDecoder().decode([MenuItem].self, from: data)
        
        // Assert
        XCTAssertEqual(item.count, 3)
    }
}
