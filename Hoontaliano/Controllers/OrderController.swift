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
        return self.order.items.contains { $0 == item }
    }
    
    func addToOrder(item: MenuItem) {
        self.order = Order(items: self.order.items + [item])
    }
    
    func removeFromOrder(item: MenuItem) {
        self.order = Order(items: self.order.items.filter{ $0 != item })
    }
}
