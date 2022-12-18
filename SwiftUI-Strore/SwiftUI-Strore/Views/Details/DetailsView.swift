//  DetailsView.swift
//  Created by aa on 12/17/22.

import SwiftUI

struct DetailsView<ViewModel: DetailsViewModelProtocol & DetailsFlowStateProtocol>: View {
    @ObservedObject var viewModel: ViewModel
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        DetailsFlowCoordinator(state: viewModel, content: content)
    }

    @ViewBuilder private func content() -> some View {
        VStack(content: {
            Text("XXX")
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

            ToolbarItem(placement: .principal, content: {
                Text("Product Details")
            })

            ToolbarItem(placement: .navigationBarTrailing, content: {
                Button(action: {
                    viewModel.routeToBasket()
                }, label: {
                    Image("BasketButton")
                })
            })
        })
    }
}

struct DetailsView_Previews: PreviewProvider {
    static var previews: some View {
        DetailsView(
            viewModel: DetailsViewModel(
                service: WebService(),
                response: DetailsResponse()
            )
        )
    }
}
