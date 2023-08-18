//
//  MenuItemDetail.ViewModel.swift
//  Hoontaliano
//
//  Created by Hoon Wee on 2023/08/18.
//

import Combine

extension MenuItemDetail {
    struct ViewModel {
        let item: MenuItem
        let addOrRemoveFromOrderButtonText = "Remove from order"
        private let orderController: OrderController
        
        // TODO: Using default value fo OrderController while
        // working on the view-model implementation.
        // We'll remove it once done and inject it from the view.
        init(item: MenuItem, orderController: OrderController = OrderController()) {
            self.item = item
            self.orderController = orderController
        }
    }
}
