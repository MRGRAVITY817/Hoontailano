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
        var cancellables = Set<AnyCancellable>()
        
        init(
            menuFetching: MenuFetching,
            menuGrouping: @escaping ([MenuItem]) -> [MenuSection]
                          = groupMenuByCategory
        ) {
            self.sections = menuGrouping([])
            menuFetching
                .fetchMenu()
                .sink(
                    receiveCompletion: { _ in },
                    // Since menuFetching is async behavior,
                    // the ViewModel class might be already dismissed
                    // by the time when the operation is finished.
                    //
                    // So we put [weak self], and since self might be nil,
                    // we should also access its property optionally.
                    receiveValue: { [weak self] value in
                        self?.sections = menuGrouping(value)
                    }
                )
                .store(in: &cancellables)
        }
    }
}
