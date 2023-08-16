//
//  MenuRow.swift
//  Hoontaliano
//
//  Created by Hoon Wee on 2023/08/17.
//

import SwiftUI

struct MenuRow: View {
    let viewModel: ViewModel
    
    var body: some View {
        Text(viewModel.text)
    }
}

struct MenuRow_Previews: PreviewProvider {
    static var previews: some View {
        MenuRow(viewModel: .init(item: MenuItem(
            category: "pastas",
            name: "Penne all'Arrabbiata",
            spicy: false,
            price: 12.99)
        ))
    }
}
