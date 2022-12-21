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
                    .font(Font.custom(Styles.Fonts.bold, size: 35))
                Spacer()
            })
            Spacer()
        })
        .padding()
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
                response: BasketResponse()
            )
        )
    }
}
