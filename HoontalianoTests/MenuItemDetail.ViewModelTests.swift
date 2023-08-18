//
//  MenuItemDetail.swift
//  HoontalianoTests
//
//  Created by Hoon Wee on 2023/08/18.
//

@testable import Hoontaliano
import XCTest

final class MenuItemDetailTests: XCTestCase {
    
    func test_WhenItemIsInOrder_ButtonSaysRemove() {
        // Arrange
        let item = MenuItem.fixture()
        let orderController = OrderController()
        orderController.addToOrder(item: item)
        let viewModel = MenuItemDetail.ViewModel(item: item, orderController: orderController)
        
        // Act
        let text = viewModel.addOrRemoveFromOrderButtonText
        
        // Assert
        XCTAssertEqual(text, "Remove from order")
    }
    
    func test_WhenItemIsInOrder_ButtonActionRemovesIt() {
        // Arrange
        let item = MenuItem.fixture()
        let orderController = OrderController()
        orderController.addToOrder(item: item)
        let viewModel = MenuItemDetail.ViewModel(item: item, orderController: orderController)
        
        // Act
        viewModel.addOrRemoveFromOrder()
        
        // Assert
        XCTAssertFalse(orderController.order.items.contains { $0 == item })
    }
    
    func test_WhenItemIsNotInOrder_ButtonSaysAdd() {
        // Arrange
        let item = MenuItem.fixture()
        let orderController = OrderController()
        let viewModel = MenuItemDetail.ViewModel(item: item, orderController: orderController)
        
        // Act
        let text = viewModel.addOrRemoveFromOrderButtonText
        
        // Assert
        XCTAssertEqual(text, "Add to order")
    }
    
    func test_WhenItemIsNotInOrder_ButtonActionAddsIt() { }
}
