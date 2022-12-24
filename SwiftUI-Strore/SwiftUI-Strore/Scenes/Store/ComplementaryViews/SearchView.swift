//  SearchView.swift
//  Created by aa on 12/18/22.

import SwiftUI

extension StoreView {
    @ViewBuilder var searchView: some View {
        ZStack {
            HStack {
                RoundedRectangle(cornerRadius: 50, style: .continuous)
                    .fill(Styles.Colors.white)
                    .frame(width: UIScreen.main.bounds.width - 65, height: 34)
                    .shadow(color: Styles.Colors.shadow, radius: 20)

                Button {} label: {
                    Styles.Images.searchButton
                        .resizable()
                        .frame(width: 34, height: 34)
                }
                .shadow(color: Styles.Colors.shadow, radius: 20)
            }

            TextField("Search...", text: $search)
                .frame(width: UIScreen.main.bounds.width / 1.5, height: 34)

            HStack {
                Styles.Images.magnifyingGlass
                    .foregroundColor(Styles.Colors.orange)
                Spacer()
            }
            .padding()
        }
    }
}
