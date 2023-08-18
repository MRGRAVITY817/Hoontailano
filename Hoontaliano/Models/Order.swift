//
//  Order.swift
//  Hoontaliano
//
//  Created by Hoon Wee on 2023/08/18.
//

struct Order {
    let items: [MenuItem]
    
    func total() -> Double {
        return items.reduce(0){ $0 + $1.price }
    }
}
