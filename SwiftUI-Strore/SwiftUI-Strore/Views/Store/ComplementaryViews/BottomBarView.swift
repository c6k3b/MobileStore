//  BottomBarView.swift
//  Created by aa on 12/18/22.

import SwiftUI

extension StoreView {
    @ViewBuilder var bottomBarView: some View {
        ZStack(content: {
            RoundedRectangle(cornerRadius: 30, style: .continuous)
                .fill(Style.Colors.darkBlue)
                .frame(width: UIScreen.main.bounds.width + 4, height: 116)
                .padding(.bottom, -44)

            HStack(content: {
                Text("• Explorer")
                Spacer()

                Button(action: {
                    viewModel.routeToDetails()
                }, label: {
                    Style.Images.bag
                })
                Spacer()

                Button(action: {
                    viewModel.routeToBasket()
                }, label: {
                    Style.Images.heart
                })
                Spacer()

                Button(action: {
                    viewModel.sheetAction()
                }, label: {
                    Style.Images.person
                })
            })
            .font(Font.custom(Style.Fonts.bold, size: 15))
            .foregroundColor(.white)
            .padding(.horizontal, UIScreen.main.bounds.width / 8)
            .padding(.bottom, -8)
        })
    }
}
