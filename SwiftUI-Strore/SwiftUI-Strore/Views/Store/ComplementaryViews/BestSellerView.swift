//  BestSellerView.swift
//  Created by aa on 12/18/22.

import SwiftUI

extension StoreView {
    @ViewBuilder var bestSellerView: some View {
        let bestSellerItems = viewModel.response.bestSellerItems ?? []
        var items: [GridItem] = Array(repeating: .init(.adaptive(minimum: 300)), count: 2)

        Section(content: {
            VStack(content: {
                ForEach(bestSellerItems, id: \.self) { item in
                    LazyVGrid(columns: items, content: {
                        bestSellerItem(
                            image: item.picture ?? "",
                            isInFavorites: item.isInFavorites ?? false,
                            normalPrice: item.normalPrice ?? 0,
                            discountPrice: item.discountPrice ?? 0,
                            title: item.title ?? ""
                        )
                    })
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
        .listStyle(.plain)
    }

    @ViewBuilder func bestSellerItem(image: String, isInFavorites: Bool, normalPrice: Int, discountPrice: Int, title: String) -> some View {
        Button(action: {
        }, label: {
            ZStack(content: {
                AsyncImage(url: URL(string: image)) {
                    $0.resizable()
                } placeholder: {
                    ProgressView()
                        .progressViewStyle(.circular)
                }
                .scaledToFill()
                .frame(width: 180, height: 180)
                .cornerRadius(10)

                HStack(content: {
                    VStack(alignment: .leading, content: {
                        ZStack(content: {
                            Circle()
                                .frame(width: 25, height: 25)
                                .foregroundColor(Style.Colors.white)
                                .shadow(color: Style.Colors.shadowFavorites, radius: 20)
                            Style.Images.heartFilled
                                .font(Font.custom(Style.Fonts.bold, size: 10))
                                .foregroundColor(.primary)
                        })
                        Spacer()

                        Text("\(discountPrice)")
                            .font(Font.custom(Style.Fonts.bold, size: 25))
                            .foregroundColor(.primary)
                            .colorInvert()

                        Text("\(normalPrice)")
                            .font(Font.custom(Style.Fonts.regular, size: 11))
                            .foregroundColor(.primary)
                            .colorInvert()
                        Spacer()

                        Button(action: {
                            viewModel.routeToDetails()
                        }, label: {
                            Text(title)
                                .font(Font.custom(Style.Fonts.bold, size: 11))
                                .foregroundColor(.primary)
                        })
                        .frame(width: 96, height: 24)
                        .background(Color.primary.colorInvert())
                        .cornerRadius(5)
                    })
                    Spacer()
                })
                .padding(26)
            })
        })
    }
}
