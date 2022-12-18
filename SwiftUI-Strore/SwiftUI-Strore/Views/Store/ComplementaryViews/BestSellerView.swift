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
            Text("Best Seller")
        })
        .listStyle(.plain)
    }
}
