//
//  OrderController.swift
//  Hoontaliano
//
//  Created by Hoon Wee on 2023/08/18.
//

import Combine

class OrderController: ObservableObject {
    
    @Published private(set) var order: Order
    
    init(order: Order = Order(items: [])) {
        self.order = order
    }
    
    func isItemInOrder(_ item: MenuItem) -> Bool {
        return true
    }
    
    func addToOrder(item: MenuItem) {
    }
    
    func removeFromOrder(item: MenuItem) {
        
    }
}
