//  AddToCartButtonView.swift
//  Created by aa on 12/20/22.

import SwiftUI

extension DetailsView {
    @ViewBuilder var addToCartButtonView: some View {
        let price = viewModel.response.price ?? 0

        Button(action: {
            viewModel.routeToBasket()
        }, label: {
            HStack(content: {
                Text("Add to Cart")
                Spacer()
                Text(price.formatted(.currency(code: "USD")))
            })
            .padding(.horizontal, 45)
            .font(Font.custom(Styles.Fonts.bold, size: 20))
            .frame(maxWidth: .infinity, minHeight: 54)
            .foregroundColor(Styles.Colors.white)
            .background(Styles.Colors.orange)
            .cornerRadius(10)
        })
        .padding(EdgeInsets(top: 0, leading: 30, bottom: 10, trailing: 30))
    }
}
