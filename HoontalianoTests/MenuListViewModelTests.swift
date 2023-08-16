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
        
        let viewModel = MenuList.ViewModel(menuFetching: MenuFetchingPlaceholder(),
                                           menuGrouping: spyClosure)
        let sections = viewModel.sections
        
        XCTAssertTrue(called)
        XCTAssertEqual(sections, inputSections)
    }
    
    func test_WhenFetchingStarts() {
        /// When fetching starts, the `ViewModel` should publish empty menu
        let viewModel = MenuList.ViewModel(menuFetching: MenuFetchingPlaceholder())
        
        XCTAssertTrue(viewModel.sections.isEmpty)
    }
    
    func test_WhenFetchingSucceeds() {}
    
    func test_WhenFetchingFails() {}
}
