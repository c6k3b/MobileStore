//  FeaturesView.swift
//  Created by aa on 12/20/22.

import SwiftUI

extension DetailsView {
    @ViewBuilder var featuresView: some View {
        ScrollView(.horizontal, showsIndicators: false, content: {
            HStack(alignment: .top, spacing: 24, content: {
                ForEach(categories.indices, id: \.self) { index in
                    VStack(spacing: 1, content: {
                        Text(categories[index])
                            .foregroundColor(
                                index == categoryIndex
                                ? Style.Colors.darkBlue
                                : Style.Colors.iconGrey
                            )
                            .font(Font.custom(Style.Fonts.bold, size: 20))

                        if index == categoryIndex {
                            Rectangle()
                                .fill(Style.Colors.orange)
                                .frame(height: 3)
                        }
                    })
                    .frame(width: 88)
                    .onTapGesture {
                        categoryIndex = index
                    }
                    .animation(.easeInOut, value: categoryIndex)
                }
            })
        })

        ScrollView(.horizontal, showsIndicators: false, content: {
            let item = viewModel.response
            let charactiristics = [item.cpu, item.camera, item.ram, item.rom]

            HStack(alignment: .top, spacing: 24, content: {
                ForEach(details.indices, id: \.self) { index in
                    VStack(content: {
                        Image(details[index])
                            .frame(height: 28)
                        Text(charactiristics[index] ?? "")
                            .font(Font.custom(Style.Fonts.regular, size: 11))
                            .foregroundColor(Style.Colors.iconGrey)
                    })
                    .frame(width: 64)
                }
            })
        })
    }
}
