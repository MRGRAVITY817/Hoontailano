//
//  HoontalianoApp.swift
//  Hoontaliano
//
//  Created by Hoon Wee on 2023/08/16.
//

import SwiftUI

@main
struct HoontalianoApp: App {
    
    let menu = [
        MenuItem(category: "starters", name: "Caprese Salad", spicy: false, price: 10),
        MenuItem(category: "starters", name: "Arancini Balls", spicy: true, price: 11.1),
        MenuItem(category: "pastas", name: "Penne all'Arrabbiata", spicy: false, price: 12.99),
        MenuItem(category: "pastas", name: "Spaghetti Carbonara", spicy: false, price: 13.99),
        MenuItem(category: "drinks", name: "Water", spicy: false, price: 2),
        MenuItem(category: "drinks", name: "Red Wine", spicy: false, price: 3),
        MenuItem(category: "desserts", name: "Tiramisù", spicy: false, price: 9.11),
        MenuItem(category: "desserts", name: "Crema Catalana", spicy: true, price: 12.98),
    ]
    
    var body: some Scene {
        WindowGroup {
            NavigationView {
                MenuListView(sections: groupMenuByCategory(menu))
                    .navigationTitle("Hoontalia 🇮🇹🇰🇷")
            }
        }
    }
}
