//
//  MenuGroupingTests.swift
//  HoontalianoTests
//
//  Created by Hoon Wee on 2023/08/16.
//

@testable import Hoontaliano
import XCTest

final class MenuGroupingTests: XCTestCase {
    func test_MenuWithOneCategory_ReturnsOneSection() throws {
        let menu = [
            MenuItem(category: "pasta", name: "Bolognese"),
            MenuItem(category: "pasta", name: "Tomato Shrimp"),
        ]
        
        let sections = groupMenuByCategory(menu)
        
        XCTAssertEqual(sections.count, 1)
        
        let section = try XCTUnwrap(sections.first)
        
        XCTAssertEqual(section.items.count, 2)
        XCTAssertEqual(section.items.first?.name, "Bolognese")
        XCTAssertEqual(section.items.last?.name, "Tomato Shrimp")
    }
    
    func test_EmptyMenu_ReturnsEmptySections() {
        let menu = [MenuItem]()
        
        let sections = groupMenuByCategory(menu)
        
        XCTAssertTrue(sections.isEmpty)
    }
}
