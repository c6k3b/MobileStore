//  StoreView.swift
//  Created by aa on 12/17/22.

import SwiftUI

struct StoreView<ViewModel: StoreViewModelProtocol & StoreFlowStateProtocol>: View {
    @ObservedObject var viewModel: ViewModel
    @State var categoryIndex = 0
    @State var search = ""
    @State var categories = ["Phones", "Computers", "Health", "Books", "Phones", "Computers"]

    var body: some View {
        StoreFlowCoordinator(state: viewModel, content: content)
    }

    @ViewBuilder private func content() -> some View {
        ScrollView(showsIndicators: false, content: {
            LazyVStack(spacing: 24, content: {
                categoryView
                searchView
                hotSalesView
                bestSellerView
            })
            .padding(.horizontal)
        })
        .background(Style.Colors.background)
        .foregroundColor(Style.Colors.darkBlue)

        .toolbar(content: {
            ToolbarItem(placement: .principal, content: {
                HStack(alignment: .center, content: {
                    Style.Images.pin
                    Text("Zihuatanejo, Gro ")
                        .font(Font.custom(Style.Fonts.medium, size: 18))
                    Style.Images.chevronDown
                        .resizable()
                        .frame(width: 10, height: 5)
                        .padding(.top, 5)
                        .padding(.leading, -5)
                })
            })

            ToolbarItem(placement: .navigationBarTrailing, content: {
                Button(action: {
                    viewModel.sheetAction()
                }, label: {
                    Style.Images.filter
                        .resizable()
                        .frame(width: 11, height: 13)
                })
            })

            ToolbarItem(placement: .bottomBar, content: {
                bottomBar
            })
        })
        .foregroundColor(Style.Colors.darkBlue)
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
