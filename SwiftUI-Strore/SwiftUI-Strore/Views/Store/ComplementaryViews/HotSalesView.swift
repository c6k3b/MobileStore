//  HotSalesView.swift
//  Created by aa on 12/18/22.

import SwiftUI

extension StoreView {
    @ViewBuilder var hotSalesView: some View {
        let hotSalesItems = viewModel.response.hotSalesItems ?? []

        Section(content: {
            List(hotSalesItems) { item in
                Text(item.title ?? "n/a")
            }
        }, header: {
            Text("Hot Sales")
        })
    }
}
