//  BestSellerView.swift
//  Created by aa on 12/18/22.

import SwiftUI

extension StoreView {
    @ViewBuilder var bestSellerView: some View {
        let bestSellerItems = viewModel.response.bestSellerItems ?? []

        Section(content: {
            List(bestSellerItems) { item in
                Text(item.title ?? "n/a")
            }
        }, header: {
            HStack(content: {
                Text("Best Seller")
                    .font(Font.custom(Style.Fonts.bold, size: 25))
                Spacer()
                Text("see more")
                    .font(Font.custom(Style.Fonts.regular, size: 15))
                    .foregroundColor(Style.Colors.orange)
            })
        })
        .listStyle(.plain)
    }
}
