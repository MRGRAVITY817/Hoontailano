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
        MenuItem(category: "starters", name: "Caprese Salad"),
        MenuItem(category: "starters", name: "Arancini Balls"),
        MenuItem(category: "pastas", name: "Penne all'Arrabbiata"),
        MenuItem(category: "pastas", name: "Spaghetti Carbonara"),
        MenuItem(category: "drinks", name: "Water"),
        MenuItem(category: "drinks", name: "Red Wine"),
        MenuItem(category: "desserts", name: "Tiramisù"),
        MenuItem(category: "desserts", name: "Crema Catalana"),
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
