//
//  MenuRow.ViewModel.swift
//  Hoontaliano
//
//  Created by Hoon Wee on 2023/08/17.
//

import Foundation

extension MenuRow {
    struct ViewModel {
        let text: String
        
        init(item: MenuItem) {
            text = item.spicy ? "\(item.name) 🌶️" : item.name
        }
    }
}
