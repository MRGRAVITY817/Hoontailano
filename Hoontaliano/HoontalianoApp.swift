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
        MenuItem(category: "starters", name: "Caprese Salad", spicy: false),
        MenuItem(category: "starters", name: "Arancini Balls", spicy: true),
        MenuItem(category: "pastas", name: "Penne all'Arrabbiata", spicy: false),
        MenuItem(category: "pastas", name: "Spaghetti Carbonara", spicy: false),
        MenuItem(category: "drinks", name: "Water", spicy: false),
        MenuItem(category: "drinks", name: "Red Wine", spicy: false),
        MenuItem(category: "desserts", name: "Tiramisù", spicy: false),
        MenuItem(category: "desserts", name: "Crema Catalana", spicy: true),
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
