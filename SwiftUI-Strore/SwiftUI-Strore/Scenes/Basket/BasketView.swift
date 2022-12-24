//  ContentView.swift
//  Created by aa on 12/17/22.

import SwiftUI

struct BasketView<ViewModel: BasketViewModelProtocol & BasketFlowStateProtocol>: View {
    @ObservedObject var viewModel: ViewModel
    @Environment(\.dismiss) var dismiss

    var body: some View {
        BasketFlowCoordinator(state: viewModel, content: content)
    }

    @ViewBuilder private func content() -> some View {
        VStack {
            HStack {
                Text("My Cart")
                    .foregroundColor(Styles.Colors.darkBlue)
                    .font(Font.custom(Styles.Fonts.bold, size: 35))
                    .padding()
                Spacer()
            }
            Spacer()

            ZStack(alignment: .bottom) {
                RectangleView(color: Styles.Colors.darkBlue)

                VStack(spacing: 24) {
                    cartView
                    Rectangle() .modifier(Divider())
                    summaryView
                    Rectangle().modifier(Divider())
                    ButtonView(text: "Checkout", action: {})
                }
                .padding(EdgeInsets(top: 30, leading: 30, bottom: 10, trailing: 30))
            }
            .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height / 1.5)
        }
        .background(Styles.Colors.background)
        .foregroundColor(Styles.Colors.white)
        .navigationBarBackButtonHidden(true)

        .toolbar(content: {
            ToolbarItem(placement: .navigationBarLeading) {
                RectangleButtonView(
                    image: Styles.Images.chevronLeft,
                    color: Styles.Colors.darkBlue,
                    action: { dismiss() }
                )
            }

            ToolbarItem {
                Text("Add Address")
                    .font(Font.custom(Styles.Fonts.medium, size: 18))
            }

            ToolbarItem {
                Styles.Images.navigationAddress
                    .resizable()
                    .frame(width: 37, height: 37)
            }
        })
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        BasketView(
            viewModel: BasketViewModel(
                service: WebService(),
                response: BasketViewModel.Response()
            )
        )
    }
}
