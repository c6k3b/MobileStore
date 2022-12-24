//  CategoryView.swift
//  Created by aa on 12/18/22.

import SwiftUI

extension StoreView {
    @ViewBuilder var categoryView: some View {
        Section {
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 24) {
                    ForEach(categories.indices, id: \.self) { index in
                        VStack {
                            ZStack(content: {
                                Circle()
                                    .frame(width: 71, height: 71)
                                    .foregroundColor(
                                        index == categoryIndex ? Styles.Colors.orange : Styles.Colors.white
                                    )
                                    .shadow(color: Styles.Colors.shadow, radius: 20)
                                Image(categories[index])
                                    .renderingMode(.template)
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 30, height: 30)
                                    .foregroundColor(
                                        index == categoryIndex
                                        ? Styles.Colors.white
                                        : Styles.Colors.grey
                                    )
                            })
                            Text(categories[index])
                                .font(Font.custom(Styles.Fonts.medium, size: 12))
                                .foregroundColor(index == categoryIndex ? Styles.Colors.orange : Styles.Colors.darkBlue)
                        }
                        .onTapGesture { categoryIndex = index }
                        .animation(.easeInOut, value: categoryIndex)
                    }
                }
            }
        } header: {
            SectionHeaderView(label: "Select Category", sublabel: "view all")
        }
        .foregroundColor(Styles.Colors.darkBlue)
    }
}
