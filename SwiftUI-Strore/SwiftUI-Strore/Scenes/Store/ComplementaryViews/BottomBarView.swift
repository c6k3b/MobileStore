//  BottomBarView.swift
//  Created by aa on 12/18/22.

import SwiftUI

extension StoreView {
    @ViewBuilder var bottomBarView: some View {
        ZStack {
            RectangleView(color: Styles.Colors.darkBlue)

            HStack {
                Text("• Explorer")
                Spacer()

                Button { viewModel.routeToDetails() } label: {
                    Styles.Images.bag
                }
                Spacer()

                Button { viewModel.routeToBasket() } label: {
                    Styles.Images.heart
                }
                Spacer()

                Button {} label: {
                    Styles.Images.person
                }
            }
            .font(Font.custom(Styles.Fonts.bold, size: 16))
            .foregroundColor(Styles.Colors.background).opacity(0.8)
            .padding(.horizontal, UIScreen.main.bounds.width / 8)
        }
    }
}
