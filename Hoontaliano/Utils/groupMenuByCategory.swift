//
//  groupMenuByCategory.swift
//  Hoontaliano
//
//  Created by Hoon Wee on 2023/08/16.
//

import Foundation

func groupMenuByCategory(_ menu: [MenuItem]) -> [MenuSection] {
    return Dictionary(grouping: menu, by: { $0.category })
        .map { key, value in
            MenuSection(category: key, items: value)
        }
        .sorted { $0.category > $1.category }
}
