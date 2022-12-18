//  StoreView.swift
//  Created by aa on 12/17/22.

import SwiftUI

struct StoreView<ViewModel: StoreViewModelProtocol & StoreFlowStateProtocol>: View {
    @ObservedObject var viewModel: ViewModel

    var body: some View {
        StoreFlowCoordinator(state: viewModel, content: content)
    }

    @ViewBuilder private func content() -> some View {
        NavigationView(content: {
            VStack(content: {
                categoryView
                searchView
                hotSalesView
                bestSellerView
            })
            .padding()
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .principal, content: {
                    HStack(content: {
                        Image("Pin")
                        Text("Zihuatanejo, Gro")
                        Image(systemName: "chevron.down")
                    })
                })

                ToolbarItem(placement: .navigationBarTrailing, content: {
                    Button(action: {
                        viewModel.sheetAction()
                    }, label: {
                        Image("Filter")
                    })
                })

                ToolbarItem(placement: .bottomBar, content: {
                    bottomBar
                })
            }
        })
    }
}

struct StoreView_Previews: PreviewProvider {
    static var previews: some View {
        StoreView(
            viewModel: StoreViewModel(
                service: WebService(),
                response: StoreResponse()
            )
        )
    }
}
