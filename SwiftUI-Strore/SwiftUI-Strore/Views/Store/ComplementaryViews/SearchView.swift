//  SearchView.swift
//  Created by aa on 12/18/22.

import SwiftUI

extension StoreView {
    @ViewBuilder var searchView: some View {

        Section(content: {
            ZStack(content: {
                HStack(content: {
                    RoundedRectangle(cornerRadius: 50, style: .continuous)
                        .fill(Color.gray.opacity(0.1))
                        .frame(width: UIScreen.main.bounds.width - 65, height: 34)
                    Button(action: {
                    }, label: {
                        Style.Images.searchButton
                            .resizable()
                            .frame(width: 34, height: 34)
                    })
                })
                TextField("Search...", text: $search)
                    .frame(width: UIScreen.main.bounds.width / 1.5, height: 34)

                HStack(content: {
                    Style.Images.magnifyingGlass
                        .foregroundColor(Style.Colors.orange)
                    Spacer()
                })
                .padding()
            })
        })
    }
}
