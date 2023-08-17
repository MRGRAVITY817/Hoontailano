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
    
}
