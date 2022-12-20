//  CategoryView.swift
//  Created by aa on 12/18/22.

import SwiftUI

extension StoreView {
    @ViewBuilder var categoryView: some View {
        Section(content: {
            ScrollView(.horizontal, showsIndicators: false, content: {
                HStack(spacing: 24, content: {
                    ForEach(categories.indices, id: \.self) { index in
                        VStack(content: {
                            ZStack(content: {
                                Circle()
                                    .frame(width: 71, height: 71)
                                    .foregroundColor(index == categoryIndex ? Style.Colors.orange : Style.Colors.white)
                                    .shadow(color: Style.Colors.shadowCategories, radius: 20)
                                Image(categories[index])
                                    .renderingMode(.template)
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 30, height: 30)
                                    .foregroundColor(
                                        index == categoryIndex
                                        ? Style.Colors.white
                                        : Style.Colors.iconGrey
                                    )
                            })
                            Text(categories[index])
                                .font(Font.custom(Style.Fonts.medium, size: 12))
                                .foregroundColor(index == categoryIndex ? Style.Colors.orange : .primary)
                        })
                        .onTapGesture {
                            categoryIndex = index
                        }
                        .animation(.easeInOut, value: categoryIndex)
                    }
                })
            })
        }, header: {
            HStack(content: {
                Text("Select Category")
                    .font(Font.custom(Style.Fonts.bold, size: 25))
                Spacer()
                Button(action: {
                }, label: {
                    Text("view all")
                        .font(Font.custom(Style.Fonts.regular, size: 15))
                        .foregroundColor(Style.Colors.orange)
                })
            })
        })
    }
}
