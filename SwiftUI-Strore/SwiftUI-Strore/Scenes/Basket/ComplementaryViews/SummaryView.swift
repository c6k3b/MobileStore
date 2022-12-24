//  SummaryView.swift
//  Created by aa on 12/21/22.

import SwiftUI

extension BasketView {
    @ViewBuilder var summaryView: some View {
        let total = viewModel.response.total ?? 0
        let delivery = viewModel.response.delivery ?? ""

        VStack(spacing: 12) {
            HStack {
                Text("Total")
                Spacer()
                Text(total, format: .currency(code: "USD"))
                    .font(Font.custom(Styles.Fonts.bold, size: 15))
            }

            HStack {
                Text("Delivery")
                Spacer()
                Text(delivery)
                    .font(Font.custom(Styles.Fonts.bold, size: 15))
            }
        }
        .font(Font.custom(Styles.Fonts.medium, size: 15))
    }
}
