//
//  MenuItemDetail.swift
//  Hoontaliano
//
//  Created by Hoon Wee on 2023/08/18.
//

import SwiftUI

struct MenuItemDetail: View {
    
    @ObservedObject private(set) var viewModel: ViewModel
    
    var body: some View {
        VStack {
            Spacer()
            
            Text(viewModel.item.name)
                .bold()
                .font(.title2)
                .padding()
            
            Text("$\(viewModel.item.price, specifier: "%.2f")")
                .font(.body)
            
            Spacer()
            
            Button {
                viewModel.addOrRemoveFromOrder()
            } label: {
                Text(viewModel.addOrRemoveFromOrderButtonText)
                    .frame(width: 200, height: 40)
                    .background(.blue)
                    .foregroundColor(.white)
                    .cornerRadius(8)
                    .fontWeight(.semibold)
            }
            .padding()
        }
    }
}

struct MenuItemDetail_Previews: PreviewProvider {
    static var previews: some View {
        MenuItemDetail(viewModel: .init(item: MockData().menu[0], orderController: OrderController()))
    }
}
