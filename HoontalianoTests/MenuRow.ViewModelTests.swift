//
//  MenuRowViewModelTests.swift
//  HoontalianoTests
//
//  Created by Hoon Wee on 2023/08/17.
//

@testable import Hoontaliano
import XCTest

final class MenuRowViewModelTests: XCTestCase {
    
    func test_WhenItemIsNotSpicy_TextIsItemNameOnly() {
        let item = MenuItem.fixture(name: "name", spicy: false)
        
        let viewModel = MenuRow.ViewModel(item: item)
        
        XCTAssertEqual(viewModel.text, "name")
    }
    
    func test_WhenItemIsSpicy_TextIsItemNameWithChiliEmoji() {
        let item = MenuItem.fixture(name: "name", spicy: true)
        
        let viewModel = MenuRow.ViewModel(item: item)
        
        XCTAssertEqual(viewModel.text, "name 🌶️")
    }
}
