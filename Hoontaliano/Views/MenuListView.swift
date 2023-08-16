//
//  MenuListView.swift
//  Hoontaliano
//
//  Created by Hoon Wee on 2023/08/16.
//

import SwiftUI

struct MenuListView: View {
    let sections: [MenuSection]
    
    var body: some View {
        List {
            ForEach(sections) { section in
                Section(header: Text(section.category)) {
                    ForEach(section.items) { item in
                        Text(item.name)
                    }
                }
            }
        }
    }
}

struct MenuListView_Previews: PreviewProvider {
    static var previews: some View {
        MenuListView(sections: [])
    }
}
