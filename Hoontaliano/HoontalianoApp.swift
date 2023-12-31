//
//  HoontalianoApp.swift
//  Hoontaliano
//
//  Created by Hoon Wee on 2023/08/16.
//

import SwiftUI

@main
struct HoontalianoApp: App {
    
    let orderController = OrderController()
    
    var body: some Scene {
        WindowGroup {
            NavigationView {
                MenuList(viewModel: .init(menuFetching: MenuFetchingPlaceholder()))
                    .navigationTitle("Hoontalia 🇮🇹🇰🇷")
            }
            .environmentObject(orderController)
        }
    }
}

