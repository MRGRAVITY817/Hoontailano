//
//  MenuList.ViewModel.swift
//  Hoontaliano
//
//  Created by Hoon Wee on 2023/08/17.
//

import Combine

extension MenuList {
    
    
    class ViewModel: ObservableObject {
        @Published private(set) var sections: Result<[MenuSection], Error> = .success([])
        var cancellables = Set<AnyCancellable>()
        
        init(
            menuFetching: MenuFetching,
            menuGrouping: @escaping ([MenuItem]) -> [MenuSection]
                          = groupMenuByCategory
        ) {
            menuFetching
                .fetchMenu()
                // .sink will attach subscriber to the publisher
                .sink(
                    // Since menuFetching is async behavior,
                    // the ViewModel class might be already dismissed
                    // by the time when the operation is finished.
                    //
                    // So we put [weak self], and since self might be nil,
                    // we should also access its property optionally.
                    receiveCompletion: { [weak self] completion in
                        guard case .failure(let error) = completion else { return }
                        
                        self?.sections = .failure(error)
                    },
                    receiveValue: { [weak self] value in
                        self?.sections = .success(menuGrouping(value))
                    }
                )
                // we should store the async value's memory reference
                // or else we'll lose it before it gets a chance to emit values.
                .store(in: &cancellables)
        }
    }
}
