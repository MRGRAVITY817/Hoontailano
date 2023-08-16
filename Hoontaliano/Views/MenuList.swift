//
//  MenuListView.swift
//  Hoontaliano
//
//  Created by Hoon Wee on 2023/08/16.
//

import SwiftUI

struct MenuList: View {
    let viewModel: ViewModel
    
    var body: some View {
        List {
            ForEach(viewModel.sections) { section in
                Section(header: Text(section.category)) {
                    ForEach(section.items) { item in
                        MenuRow(viewModel: .init(item: item))
                    }
                }
            }
        }
    }
}

struct MenuListView_Previews: PreviewProvider {
    static var previews: some View {
        MenuList(viewModel: .init(menu: MockData().menu))
    }
}
