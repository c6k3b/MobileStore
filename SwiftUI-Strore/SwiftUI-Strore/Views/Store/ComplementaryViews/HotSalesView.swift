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
            HStack(content: {
                Text("Hot Sales")
                    .font(Font.custom(Style.Fonts.bold, size: 25))
                Spacer()
                Text("see more")
                    .font(Font.custom(Style.Fonts.regular, size: 15))
                    .foregroundColor(Style.Colors.orange)
            })
        })
    }
}
