//
//  MenuListViewModelTests.swift
//  HoontalianoTests
//
//  Created by Hoon Wee on 2023/08/17.
//

@testable import Hoontaliano
import XCTest

final class MenuListViewModelTests: XCTestCase {
    func test_CallsGivenGroupingFunction() {
        var called = false
        let inputSections = [MenuSection.fixture()]
        let spyClosure: ([MenuItem]) -> [MenuSection] = { items in
            called = true
            return inputSections
        }
        
        let viewModel = MenuList.ViewModel(menu: [.fixture()], menuGrouping: spyClosure)
        let sections = viewModel.sections
        
        XCTAssertTrue(called)
        XCTAssertEqual(sections, inputSections)
    }
}
