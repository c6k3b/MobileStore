//  TitleView.swift
//  Created by aa on 12/20/22.

import SwiftUI

extension DetailsView {
    @ViewBuilder var titleView: some View {
        let item = viewModel.response
        let rating = Int(item.rating?.rounded(.toNearestOrAwayFromZero) ?? 0)
        let isInFavorites = item.isInFavorites ?? false

        VStack(alignment: .leading, content: {
            HStack(alignment: .top, content: {
                Text(item.title ?? "")
                    .font(Font.custom(Styles.Fonts.medium, size: 24))
                Spacer()

                Button(action: {
                }, label: {
                    ZStack(content: {
                        RoundedRectangle(cornerRadius: 10)
                            .fill(isInFavorites ? Styles.Colors.orange : Styles.Colors.darkBlue)
                            .frame(width: 37, height: 37)

                        Styles.Images.heart
                            .font(Font.custom(Styles.Fonts.regular, size: 14))
                            .foregroundColor(Styles.Colors.white)
                    })
                })
            })

            HStack(content: {
                ForEach(0 ..< rating, id: \.self) { _ in
                    Styles.Images.star
                        .foregroundColor(Styles.Colors.yellow)
                        .font(Font.custom(Styles.Fonts.regular, size: 12))
                }
            })
        })
    }
}
