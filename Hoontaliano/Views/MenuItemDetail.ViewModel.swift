//
//  MenuItemDetail.ViewModel.swift
//  Hoontaliano
//
//  Created by Hoon Wee on 2023/08/18.
//

import Combine

extension MenuItemDetail {
    class ViewModel: ObservableObject {
        
        @Published private(set) var addOrRemoveFromOrderButtonText = "Remove from order"
        let item: MenuItem
        private let orderController: OrderController
        private var cancellables = Set<AnyCancellable>()
        
        // TODO: Using default value fo OrderController while
        // working on the view-model implementation.
        // We'll remove it once done and inject it from the view.
        init(item: MenuItem, orderController: OrderController = OrderController()) {
            self.item = item
            self.orderController = orderController
            
            self.orderController.$order
                .sink { [weak self] order in
                    // Check if we're still using same viewModel instance.
                    guard let self else { return }
                    
                    if (order.items.contains{ $0 == self.item }) {
                        self.addOrRemoveFromOrderButtonText = "Remove from order"
                    } else {
                        self.addOrRemoveFromOrderButtonText = "Add to order"
                    }
                }
                .store(in: &cancellables)
        }
        
        func addOrRemoveFromOrder() {
            if(orderController.order.items.contains { $0 == item}) {
                orderController.removeFromOrder(item: item)
            } else {
                orderController.addToOrder(item: item)
            }
        }
    }
}
