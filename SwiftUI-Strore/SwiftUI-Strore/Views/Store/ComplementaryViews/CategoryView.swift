//  CategoryView.swift
//  Created by aa on 12/18/22.

import SwiftUI

extension StoreView {
    @ViewBuilder var categoryView: some View {
        Section(content: {
            Text("Phones")
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
