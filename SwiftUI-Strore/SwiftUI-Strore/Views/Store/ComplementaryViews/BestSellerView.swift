//  BestSellerView.swift
//  Created by aa on 12/18/22.

import SwiftUI

extension StoreView {
    @ViewBuilder var bestSellerView: some View {
        let bestSellerItems = viewModel.response.bestSellerItems ?? []
        let gridItems: [GridItem] = Array(repeating: .init(.flexible(), spacing: 24), count: 2)

        Section(content: {
            LazyVGrid(columns: gridItems, content: {
                ForEach(bestSellerItems, id: \.self) { item in
                    bestSellerItem(
                        image: item.picture ?? "",
                        isInFavorites: item.isInFavorites ?? false,
                        normalPrice: item.normalPrice ?? 0,
                        discountPrice: item.discountPrice ?? 0,
                        title: item.title ?? ""
                    )
                }
            })
        }, header: {
            HStack(content: {
                Text("Best Seller")
                    .font(Font.custom(Style.Fonts.bold, size: 25))
                Spacer()
                Button(action: {
                }, label: {
                    Text("see more")
                        .font(Font.custom(Style.Fonts.regular, size: 15))
                        .foregroundColor(Style.Colors.orange)
                })
            })
        })
    }

    @ViewBuilder func bestSellerItem(
        image: String, isInFavorites: Bool, normalPrice: Int, discountPrice: Int, title: String
    ) -> some View {
        ZStack(content: {
            Button(action: {
                viewModel.routeToDetails()
            }, label: {
                RoundedRectangle(cornerRadius: 10)
                    .fill(Style.Colors.white)
                    .frame(width: 181, height: 227)
                    .shadow(color: Style.Colors.shadowBestSellerCard, radius: 20)
            })

            VStack(alignment: .leading, content: {
                ZStack(content: {
                    AsyncImage(
                        url: URL(string: image)
                    ) {
                        $0.resizable()
                    } placeholder: {
                        ProgressView()
                            .progressViewStyle(.circular)
                    }
                    .frame(width: 181, height: 177)
                    .scaledToFill()

                    Button(action: {
                    }, label: {
                        VStack(content: {
                            HStack(content: {
                                Spacer()
                                ZStack(content: {
                                    Circle()
                                        .foregroundColor(Style.Colors.white)
                                    isInFavorites ? Style.Images.heartFill : Style.Images.heart
                                })
                                .font(Font.custom(Style.Fonts.bold, size: 11))
                                .foregroundColor(Style.Colors.orange)
                                .frame(width: 25, height: 25)
                            })
                            Spacer()
                        })
                    })
                    .padding(12)
                    .shadow(color: Style.Colors.shadowFavorites, radius: 20)
                })

                HStack(content: {
                    Text(discountPrice, format: .currency(code: "USD"))
                        .font(Font.custom(Style.Fonts.bold, size: 16))

                    Text(normalPrice, format: .currency(code: "USD"))
                        .font(Font.custom(Style.Fonts.medium, size: 10))
                        .foregroundColor(Style.Colors.filtersGray)
                        .strikethrough()
                })
                .padding(.horizontal)

                Text(title)
                    .font(Font.custom(Style.Fonts.regular, size: 10))
                    .padding(.horizontal)
            })
            .foregroundColor(.primary)
            .padding(.bottom, 16)
            .cornerRadius(10)
        })
    }
}
