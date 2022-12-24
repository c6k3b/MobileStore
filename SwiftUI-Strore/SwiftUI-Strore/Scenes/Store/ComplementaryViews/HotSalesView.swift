//  HotSalesView.swift
//  Created by aa on 12/18/22.

import SwiftUI

extension StoreView {
    @ViewBuilder var hotSalesView: some View {
        let hotSalesItems = viewModel.response.hotSalesItems ?? []

        Section {
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 12) {
                    ForEach(hotSalesItems, id: \.self) {
                        hotSalesItem(
                            imageURL: $0.picture ?? "",
                            isNew: $0.isNew ?? false,
                            title: $0.title ?? "",
                            subtitle: $0.subtitle ?? ""
                        )
                    }
                }
            }
        } header: {
            SectionHeaderView(label: "Hot Sales", sublabel: "see more")
        }
    }

    @ViewBuilder func hotSalesItem(imageURL: String, isNew: Bool, title: String, subtitle: String) -> some View {
        ZStack {
            AsyncImage(
                url: URL(string: imageURL)
            ) { $0.resizable() } placeholder: {
                ProgressView().progressViewStyle(.circular)
            }
            .frame(width: UIScreen.main.bounds.width - 60, height: 180)
            .scaledToFill()
            .cornerRadius(10)

            HStack {
                VStack(alignment: .leading) {
                    if isNew {
                       isNewLabel
                    } else {
                        Spacer()
                        Spacer()
                    }
                    Spacer()

                    description(title: title, subtitle: subtitle).colorInvert()
                    Spacer()

                    Button {
                        viewModel.routeToDetails()
                    } label: {
                        Text("Buy Now!")
                            .font(Font.custom(Styles.Fonts.bold, size: 11))
                    }
                    .frame(width: 96, height: 24)
                    .background(Color.primary.colorInvert())
                    .cornerRadius(5)
                }
                Spacer()
            }
            .padding(26)
            .foregroundColor(.primary)
        }
    }

    @ViewBuilder var isNewLabel: some View {
        ZStack {
            Circle()
                .frame(width: 27, height: 27)
                .foregroundColor(Styles.Colors.orange)
            Text("New")
                .font(Font.custom(Styles.Fonts.bold, size: 10))
                .colorInvert()
        }
    }

    @ViewBuilder func description(title: String, subtitle: String) -> some View {
        Text(title)
            .font(Font.custom(Styles.Fonts.bold, size: 25))

        Text(subtitle)
            .font(Font.custom(Styles.Fonts.regular, size: 11))
    }
}
