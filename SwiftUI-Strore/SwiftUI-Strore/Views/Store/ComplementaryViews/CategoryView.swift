//  CategoryView.swift
//  Created by aa on 12/18/22.

import SwiftUI

extension StoreView {
    @ViewBuilder var categoryView: some View {
        Section(content: {
            ScrollView(.horizontal, showsIndicators: false, content: {
                HStack(spacing: 24, content: {
                    ForEach(categories, id: \.self) { category in
                        VStack(content: {
                            ZStack(content: {
                                Circle()
                                    .frame(width: 71, height: 71)
                                    .foregroundColor(isCategorySelected ? Style.Colors.orange : Color.gray.opacity(0.1))
                                Image(category)
                                    .resizable()
                                    .frame(width: 30, height: 30)
                                    .foregroundColor(Style.Colors.iconGrey)
                            })
                            Text(category)
                                .font(Font.custom(Style.Fonts.medium, size: 12))
                                .foregroundColor(isCategorySelected ? Style.Colors.orange : .primary)
                        })
                    }
                })
            })
        }, header: {
            HStack(content: {
                Text("Select Category")
                    .font(Font.custom(Style.Fonts.bold, size: 25))
                Spacer()
                Text("view all")
                    .font(Font.custom(Style.Fonts.regular, size: 15))
                    .foregroundColor(Style.Colors.orange)
            })
        })
    }
}
