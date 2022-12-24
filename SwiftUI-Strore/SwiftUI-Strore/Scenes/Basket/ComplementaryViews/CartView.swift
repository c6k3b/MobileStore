//  CartView.swift
//  Created by aa on 12/21/22.

import SwiftUI

extension BasketView {
    @ViewBuilder var cartView: some View {
        let item = viewModel.response.basket ?? []

        ScrollView(.vertical, showsIndicators: false) {
            ForEach(item.indices, id: \.self) { index in
                HStack {
                    AsyncImage(
                        url: URL(string: item[index].images ?? "")
                    ) { $0.resizable() } placeholder: {
                        ProgressView().progressViewStyle(.circular)
                    }
                    .frame(width: 88, height: 88)
                    .cornerRadius(10)
                    .scaledToFit()

                    VStack(alignment: .leading, spacing: 6) {
                        Text(item[index].title ?? "")
                        Text(item[index].price ?? 0, format: .currency(code: "USD"))
                            .foregroundColor(Styles.Colors.orange)
                    }
                    .font(Font.custom(Styles.Fonts.bold, size: 20))
                    Spacer()

                    ZStack {
                        RoundedRectangle(cornerRadius: 13)
                            .fill(Styles.Colors.shadow)
                            .frame(width: 32, height: 88)
                            .padding()
                        VStack {
                            Text("+")
                            Text("2")
                            Text("-")
                        }
                        .font(Font.custom(Styles.Fonts.bold, size: 20))
                        .foregroundColor(Styles.Colors.white)
                    }

                    Styles.Images.bin
                        .frame(width: 15, height: 16)
                }
            }
        }
    }
}
