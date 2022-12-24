//  BestSellerView.swift
//  Created by aa on 12/18/22.

import SwiftUI

extension StoreView {
    @ViewBuilder var bestSellerView: some View {
        let bestSellerItems = viewModel.response.bestSellerItems ?? []
        let gridItems: [GridItem] = Array(repeating: .init(.flexible(), spacing: 24), count: 2)

        Section {
            LazyVGrid(columns: gridItems) {
                ForEach(bestSellerItems, id: \.self) { item in
                    bestSellerItem(
                        image: item.picture ?? "",
                        isInFavorites: item.isInFavorites ?? false,
                        normalPrice: item.normalPrice ?? 0,
                        discountPrice: item.discountPrice ?? 0,
                        title: item.title ?? ""
                    )
                }
            }
        } header: {
            SectionHeaderView(label: "Best Seller", sublabel: "see more")
        }
    }

    @ViewBuilder func bestSellerItem(
        image: String, isInFavorites: Bool, normalPrice: Int, discountPrice: Int, title: String
    ) -> some View {
        ZStack {
            Button { viewModel.routeToDetails() } label: {
                RoundedRectangle(cornerRadius: 10)
                    .fill(Styles.Colors.white)
                    .frame(width: 181, height: 227)
                    .shadow(color: Styles.Colors.shadow, radius: 20)
            }

            VStack(alignment: .leading) {
                ZStack {
                    AsyncImage(
                        url: URL(string: image)
                    ) { $0.resizable() } placeholder: {
                        ProgressView().progressViewStyle(.circular)
                    }
                    .frame(width: 181, height: 177)
                    .scaledToFit()

                    favoritesButton(isInFavorites: isInFavorites)
                }
               priceBlock(discountPrice: discountPrice, normalPrice: normalPrice, title: title)
            }
            .padding(.bottom, 16)
            .cornerRadius(10)
        }
        .foregroundColor(Styles.Colors.darkBlue)
    }

    @ViewBuilder func favoritesButton(isInFavorites: Bool) -> some View {
        Button {
        } label: {
            VStack {
                HStack {
                    Spacer()
                    ZStack {
                        Circle()
                            .foregroundColor(Styles.Colors.white)
                        isInFavorites ? Styles.Images.heartFill : Styles.Images.heart
                    }
                    .font(Font.custom(Styles.Fonts.bold, size: 11))
                    .foregroundColor(Styles.Colors.orange)
                    .frame(width: 25, height: 25)
                }
                Spacer()
            }
        }
        .padding(12)
        .shadow(color: Styles.Colors.shadow, radius: 20)
    }

    @ViewBuilder func priceBlock(discountPrice: Int, normalPrice: Int, title: String) -> some View {
        HStack {
            Text(discountPrice, format: .currency(code: "USD"))
                .font(Font.custom(Styles.Fonts.bold, size: 16))

            Text(normalPrice, format: .currency(code: "USD"))
                .font(Font.custom(Styles.Fonts.medium, size: 10))
                .foregroundColor(Styles.Colors.grey)
                .strikethrough()
        }
        .padding(.horizontal)

        Text(title)
            .font(Font.custom(Styles.Fonts.regular, size: 10))
            .padding(.horizontal)
    }
}
