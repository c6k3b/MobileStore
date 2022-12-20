//  TitleView.swift
//  Created by aa on 12/20/22.

import SwiftUI

extension DetailsView {
    @ViewBuilder var titleView: some View {
        let item = viewModel.response
        let rating = Int(item.rating?.rounded(.toNearestOrAwayFromZero) ?? 0)

        VStack(alignment: .leading, content: {
            HStack(alignment: .top, content: {
                Text(item.title ?? "")
                    .font(Font.custom(Style.Fonts.medium, size: 24))
                Spacer()

                Button(action: {
                }, label: {
                    ZStack(content: {
                        RoundedRectangle(cornerRadius: 10)
                            .fill(Style.Colors.darkBlue)
                            .frame(width: 37, height: 37)
                        Style.Images.heart
                            .font(Font.custom(Style.Fonts.regular, size: 14))
                            .foregroundColor(Style.Colors.white)
                    })
                })
            })

            HStack(content: {
                ForEach(0 ..< rating, id: \.self) { _ in
                    Style.Images.star
                        .foregroundColor(Style.Colors.yellow)
                        .font(Font.custom(Style.Fonts.regular, size: 12))
                }
            })
        })
    }
}
