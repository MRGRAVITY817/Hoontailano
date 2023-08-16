//
//  MenuSection.swift
//  Hoontaliano
//
//  Created by Hoon Wee on 2023/08/16.
//

import Foundation

struct MenuSection {
    let category: String
    let items: [MenuItem]
}

extension MenuSection: Identifiable {
    var id: String { category }
}
