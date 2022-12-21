//  HotSalesView.swift
//  Created by aa on 12/18/22.

import SwiftUI

extension StoreView {
    @ViewBuilder var hotSalesView: some View {
        let hotSalesItems = viewModel.response.hotSalesItems ?? []

        Section(content: {
            ScrollView(.horizontal, showsIndicators: false, content: {
                HStack(spacing: 12, content: {
                    ForEach(hotSalesItems, id: \.self) {
                        hotSalesItem(
                            image: $0.picture ?? "",
                            isNew: $0.isNew ?? false,
                            title: $0.title ?? "",
                            subtitle: $0.subtitle ?? ""
                        )
                    }
                })
            })
        }, header: {
            HStack(content: {
                Text("Hot Sales")
                    .font(Font.custom(Styles.Fonts.bold, size: 25))
                Spacer()
                Button(action: {
                }, label: {
                    Text("see more")
                        .font(Font.custom(Styles.Fonts.regular, size: 15))
                        .foregroundColor(Styles.Colors.orange)
                })
            })
        })
    }

    @ViewBuilder func hotSalesItem(image: String, isNew: Bool, title: String, subtitle: String) -> some View {
        ZStack(content: {
            AsyncImage(
                url: URL(string: image)
            ) {
                $0.resizable()
            } placeholder: {
                ProgressView()
                    .progressViewStyle(.circular)
            }
            .frame(width: UIScreen.main.bounds.width - 60, height: 180)
            .scaledToFill()
            .cornerRadius(10)

            HStack(content: {
                VStack(alignment: .leading, content: {
                    if isNew {
                        ZStack(content: {
                            Circle()
                                .frame(width: 27, height: 27)
                                .foregroundColor(Styles.Colors.orange)
                            Text("New")
                                .font(Font.custom(Styles.Fonts.bold, size: 10))
                                .colorInvert()
                        })
                    } else {
                        Spacer()
                        Spacer()
                    }
                    Spacer()

                    Text(title)
                        .font(Font.custom(Styles.Fonts.bold, size: 25))
                        .colorInvert()

                    Text(subtitle)
                        .font(Font.custom(Styles.Fonts.regular, size: 11))
                        .colorInvert()
                    Spacer()

                    Button(action: {
                        viewModel.routeToDetails()
                    }, label: {
                        Text("Buy Now!")
                            .font(Font.custom(Styles.Fonts.bold, size: 11))
                    })
                    .frame(width: 96, height: 24)
                    .background(Color.primary.colorInvert())
                    .cornerRadius(5)
                })
                Spacer()
            })
            .padding(26)
            .foregroundColor(.primary)
        })
    }
}
