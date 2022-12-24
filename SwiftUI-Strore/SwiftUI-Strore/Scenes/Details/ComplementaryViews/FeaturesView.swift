//  FeaturesView.swift
//  Created by aa on 12/20/22.

import SwiftUI

extension DetailsView {
    @ViewBuilder var featuresView: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(alignment: .top, spacing: 24) {
                ForEach(categories.indices, id: \.self) { index in
                    VStack(spacing: 1) {
                        Text(categories[index])
                            .foregroundColor(index == categoryIndex ? Styles.Colors.darkBlue : Styles.Colors.grey)
                            .font(Font.custom(Styles.Fonts.bold, size: 20))

                        if index == categoryIndex {
                            Rectangle()
                                .fill(Styles.Colors.orange)
                                .frame(height: 3)
                        }
                    }
                    .frame(width: 88)
                    .onTapGesture { categoryIndex = index }
                    .animation(.easeInOut, value: categoryIndex)
                }
            }
        }

        ScrollView(.horizontal, showsIndicators: false) {
            let item = viewModel.response
            let charactiristics = [item.cpu, item.camera, item.ram, item.rom]

            HStack(alignment: .top, spacing: 24) {
                ForEach(details.indices, id: \.self) { index in
                    VStack {
                        Image(details[index])
                            .frame(height: 28)
                        Text(charactiristics[index] ?? "")
                            .font(Font.custom(Styles.Fonts.regular, size: 11))
                            .foregroundColor(Styles.Colors.grey)
                    }
                    .frame(width: 64)
                }
            }
        }
    }
}
