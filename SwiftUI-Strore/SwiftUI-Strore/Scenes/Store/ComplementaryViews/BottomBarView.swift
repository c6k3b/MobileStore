//  BottomBarView.swift
//  Created by aa on 12/18/22.

import SwiftUI

extension StoreView {
    @ViewBuilder var bottomBarView: some View {
        ZStack(content: {
            Rectangle()
                .cornerRadius(30, corners: [.topLeft, .topRight])
                .foregroundColor(Styles.Colors.darkBlue)
                .edgesIgnoringSafeArea([.bottom])
                .frame(width: UIScreen.main.bounds.width, height: 72)
                .shadow(color: Styles.Colors.shadow, radius: 20)

            HStack(content: {
                Text("• Explorer")
                Spacer()

                Button(action: {
                    viewModel.routeToDetails()
                }, label: {
                    Styles.Images.bag
                })
                Spacer()

                Button(action: {
                    viewModel.routeToBasket()
                }, label: {
                    Styles.Images.heart
                })
                Spacer()

                Button(action: {
                }, label: {
                    Styles.Images.person
                })
            })
            .font(Font.custom(Styles.Fonts.bold, size: 16))
            .foregroundColor(.white)
            .padding(.horizontal, UIScreen.main.bounds.width / 8)
        })
    }
}
