//  TitleView.swift
//  Created by aa on 12/20/22.

import SwiftUI

extension DetailsView {
    @ViewBuilder var titleView: some View {
        let item = viewModel.response
        let rating = Int(item.rating?.rounded(.toNearestOrAwayFromZero) ?? 0)

        VStack(alignment: .leading) {
            HStack(alignment: .top) {
                Text(item.title ?? "")
                    .font(Font.custom(Styles.Fonts.medium, size: 24))
                Spacer()

                RectangleButtonView(
                    image: Styles.Images.heart,
                    color: Styles.Colors.darkBlue,
                    action: { viewModel.routeToBasket() }
                )
            }

            HStack {
                ForEach(0 ..< rating, id: \.self) { _ in
                    Styles.Images.star
                        .foregroundColor(Styles.Colors.yellow)
                        .font(Font.custom(Styles.Fonts.regular, size: 12))
                }
            }
        }
    }
}
