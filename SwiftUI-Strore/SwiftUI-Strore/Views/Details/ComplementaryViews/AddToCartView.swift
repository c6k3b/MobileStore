//  AddToCartView.swift
//  Created by aa on 12/20/22.

import SwiftUI

extension DetailsView {
    @ViewBuilder var addToCartView: some View {
        Button(action: {
        }, label: {
            Text("Add to Cart")
                .font(Font.custom(Style.Fonts.medium, size: 18))
                .foregroundColor(Style.Colors.white)
                .frame(width: 188, height: 37)
                .background(Style.Colors.orange)
                .cornerRadius(10)
        })
    }
}
