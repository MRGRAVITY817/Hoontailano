//
//  MenuList.ViewModel.swift
//  Hoontaliano
//
//  Created by Hoon Wee on 2023/08/17.
//

import Combine

extension MenuList {
    class ViewModel: ObservableObject {
        @Published private(set) var sections: [MenuSection]
        
        init(
            menu: [MenuItem],
            menuGrouping: @escaping ([MenuItem]) -> [MenuSection] = groupMenuByCategory
        ) {
            self.sections = menuGrouping([])
        }
    }
}
