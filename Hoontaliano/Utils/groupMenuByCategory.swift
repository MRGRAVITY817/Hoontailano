//
//  groupMenuByCategory.swift
//  Hoontaliano
//
//  Created by Hoon Wee on 2023/08/16.
//

import Foundation

func groupMenuByCategory(_ menu: [MenuItem]) -> [MenuSection] {
    guard menu.isEmpty == false else { return [] }
    
    return [MenuSection(items: menu)]
}
