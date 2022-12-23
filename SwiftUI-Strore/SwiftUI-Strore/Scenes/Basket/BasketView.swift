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
        VStack(content: {
            HStack(content: {
                Text("My Cart")
                    .foregroundColor(Styles.Colors.darkBlue)
                    .font(Font.custom(Styles.Fonts.bold, size: 35))
                    .padding()
                Spacer()
            })
            Spacer()

            ZStack(alignment: .bottom, content: {
                Rectangle()
                    .cornerRadius(30, corners: [.topLeft, .topRight])
                    .foregroundColor(Styles.Colors.darkBlue)
                    .edgesIgnoringSafeArea([.bottom])
                    .shadow(color: Styles.Colors.shadow, radius: 20)

                VStack(spacing: 24, content: {
                    cartView

                    Rectangle()
                        .fill(Styles.Colors.white).opacity(0.3)
                        .frame(height: 1)

                    summaryView

                    Rectangle()
                        .fill(Styles.Colors.white).opacity(0.3)
                        .frame(height: 1)

                    checkoutButtonView
                })
                .padding(EdgeInsets(top: 30, leading: 30, bottom: 10, trailing: 30))
            })
            .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height / 1.5)
        })
        .background(Styles.Colors.background)
        .foregroundColor(Styles.Colors.white)
        .navigationBarBackButtonHidden(true)

        .toolbar(content: {
            ToolbarItem(placement: .navigationBarLeading, content: {
                Button(action: {
                    dismiss()
                }, label: {
                    Styles.Images.navigationBack
                        .resizable()
                        .frame(width: 37, height: 37)
                })
            })

            ToolbarItem(content: {
                Text("Add Address")
                    .font(Font.custom(Styles.Fonts.medium, size: 18))
            })

            ToolbarItem(content: {
                Styles.Images.navigationAddress
                    .resizable()
                    .frame(width: 37, height: 37)
            })
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
