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
    
    /// THIS is a fragile test - the result is incosistent depending on side effects
    func test_WhenRequestSucceeds_FragileTest() {
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
    
    /// This test is better than above - it uses stub to simulate network calls
    func test_WhenRequestSucceeds() throws {
        let json = """
[
    { "name": "first", "category": "a category", "spicy": true, "price": 11.11 },
    { "name": "second", "category": "a category", "spicy": false, "price": 9.99 }
]
"""
        let data = try XCTUnwrap(json.data(using: .utf8))
        let menuFetcher = MenuFetcher(networkFetching: NetworkFetchingStub(returning: .success(data)))
        let expectation = XCTestExpectation(description: "Publishes decoded [MenuItem]")
        
        menuFetcher.fetchMenu()
            .sink(
                receiveCompletion: { _ in },
                receiveValue: { items in
                    XCTAssertEqual(items.count, 2)
                    XCTAssertEqual(items.first?.name, "first")
                    XCTAssertEqual(items.last?.name, "second")
                    
                    expectation.fulfill()
                }
            )
            .store(in: &cancellables)
        
        wait(for: [expectation], timeout: 1)
    }
    
    func test_WhenRequestFails() { }
}
