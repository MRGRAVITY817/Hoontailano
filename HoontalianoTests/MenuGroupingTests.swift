//
//  MenuGroupingTests.swift
//  HoontalianoTests
//
//  Created by Hoon Wee on 2023/08/16.
//

@testable import Hoontaliano
import XCTest

final class MenuGroupingTests: XCTestCase {
    func test_MenuWithOneCategory_ReturnsOneSection() {
        let menu = [
            MenuItem(category: "pasta"),
            MenuItem(category: "pasta"),
        ]
        
        let sections = groupMenuByCategory(menu)
        
        XCTAssertEqual(sections.count, 1)
    }
    
    func test_EmptyMenu_ReturnsEmptySections() {
        let menu = [MenuItem]()
        
        let sections = groupMenuByCategory(menu)
        
        XCTAssertTrue(sections.isEmpty)
    }
}
