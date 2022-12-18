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
                    Image("BackButton")
                })
            })

            ToolbarItem(content: {
                Text("Add Address")
            })

            ToolbarItem(content: {
                Image("AddressButton")
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
