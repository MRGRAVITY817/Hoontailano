//
//  MenuFetcherTests.swift
//  HoontalianoTests
//
//  Created by Hoon Wee on 2023/08/17.
//

@testable import Hoontaliano
import XCTest
import Combine

final class MenuFetcherTests: XCTestCase {
    var cancellables = Set<AnyCancellable>()
    
    func test_WhenRequestSucceeds() {
        // Arrange
        let menuFetcher = MenuFetcher()
        
        // Act
        let expectation = XCTestExpectation(description: "Publishes decoded [MenuItem]")
        
        // Assert
        menuFetcher
            .fetchMenu()
            .sink(
                receiveCompletion: { _ in },
                receiveValue: { items in
                    XCTAssertEqual(items.count, 11)
                    XCTAssertEqual(items.first?.name, "Penne all\'Arrabbiata")
                    XCTAssertEqual(items.last?.name, "Water")
                    
                    expectation.fulfill()
                }
            )
            .store(in: &cancellables)
        
        wait(for: [expectation], timeout: 1)
    }
    
    func test_WhenRequestFails() { }
}
