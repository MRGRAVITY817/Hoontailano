//
//  MenuList.ViewModel.swift
//  Hoontaliano
//
//  Created by Hoon Wee on 2023/08/17.
//

import Foundation

extension MenuList {
    struct ViewModel {
        let sections: [MenuSection]
        
        init(
            menu: [MenuItem],
            menuGrouping: @escaping ([MenuItem]) -> [MenuSection] = groupMenuByCategory
        ) {
            self.sections = menuGrouping(menu)
        }
    }
}
