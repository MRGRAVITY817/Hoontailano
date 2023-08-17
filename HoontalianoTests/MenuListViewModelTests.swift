//
//  MenuListViewModelTests.swift
//  HoontalianoTests
//
//  Created by Hoon Wee on 2023/08/17.
//

@testable import Hoontaliano
import XCTest
import Combine

final class MenuListViewModelTests: XCTestCase {
    
    var cancellables = Set<AnyCancellable>()
    
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
    
    func test_WhenFetchingSucceeds() {
        // Arrange
        var receivedMenu: [MenuItem]?
        let expectedSections = [MenuSection.fixture()]
        let spyClosure: ([MenuItem]) -> [MenuSection] = { items in
            receivedMenu = items
            return expectedSections
        }
        let expectedMenu = [MenuItem.fixture()]
        // Use stub to simulate the system that fetches the data
        let menuFetchingStub = MenuFetchingStub(returning: .success(expectedMenu))
        
        // Act
        let viewModel = MenuList.ViewModel(menuFetching: menuFetchingStub,
                                           menuGrouping: spyClosure)
        // Expect asynchronous value
        let expectation = XCTestExpectation(description: "Publishes sections built from received menu and given grouping closure")
        
        viewModel
            .$sections         // listen to published value
            .dropFirst()       // drop first one (initialized value)
            .sink { value in   // use .sink() to subscribe publisher
                
                // Assert
                XCTAssertEqual(receivedMenu, expectedMenu)
                XCTAssertEqual(value, expectedSections)
                
                // We have to tell that expectation has been fulfilled,
                // or else it will hang until timeout.
                expectation.fulfill()
            }
            .store(in: &cancellables) // should store async value's ref
        
        wait(for: [expectation], timeout: 1)
        
    }
    
    func test_WhenFetchingFails() {}
}
