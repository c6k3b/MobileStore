//  CheckoutButtonView.swift
//  Created by aa on 12/21/22.

import SwiftUI

extension BasketView {
    @ViewBuilder var checkoutButtonView: some View {
        Button(action: {
        }, label: {
            HStack(content: {
                Text("Checkout")
            })
            .font(Font.custom(Styles.Fonts.bold, size: 20))
            .frame(maxWidth: .infinity, minHeight: 54)
            .foregroundColor(Styles.Colors.white)
            .background(Styles.Colors.orange)
            .cornerRadius(10)
        })
    }
}
