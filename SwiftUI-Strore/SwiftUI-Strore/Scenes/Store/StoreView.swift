//  StoreView.swift
//  Created by aa on 12/17/22.

import SwiftUI

struct StoreView<ViewModel: StoreViewModelProtocol & StoreFlowStateProtocol>: View {
    @ObservedObject var viewModel: ViewModel
    @State var search = ""
    @State var categoryIndex = 0
    @State var isFilterPresented = false

    @State var categories = ["Phones", "Computers", "Health", "Books", "Phones", "Computers"]
    @State var options = ["Brand", "Price", "Size"]
    @State var parameters = ["Samsung", "$300 - $500", "4.5 to 5.5 inches"]

    var body: some View {
        StoreFlowCoordinator(state: viewModel, content: content)
    }

    @ViewBuilder private func content() -> some View {
        ZStack(alignment: .bottom) {
            ScrollView(showsIndicators: false) {
                LazyVStack(spacing: 24) {
                    categoryView
                    searchView
                    hotSalesView
                    bestSellerView
                }
                .padding(.horizontal)
                .padding(.bottom, 72)
            }
            .background(Styles.Colors.background)
            .foregroundColor(Styles.Colors.darkBlue)

            if isFilterPresented {
                ZStack {
                    RectangleView(color: Styles.Colors.white)

                    VStack {
                        filterToolbar
                        ScrollView(.vertical, showsIndicators: false) {
                            filterView
                        }
                    }
                    .padding(EdgeInsets(top: 10, leading: 30, bottom: 1, trailing: 30))
                }
                .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height / 3)
            } else {
                bottomBarView
                    .frame(height: 72)
            }
        }

        .toolbar {
            ToolbarItem(placement: .principal) {
                HStack(alignment: .center) {
                    Styles.Images.pin
                    Text("Zihuatanejo, Gro ")
                        .font(Font.custom(Styles.Fonts.medium, size: 18))
                    Styles.Images.chevronDown
                        .resizable()
                        .frame(width: 10, height: 5)
                        .padding(.top, 5)
                        .padding(.leading, -5)
                }
            }

            ToolbarItem(placement: .navigationBarTrailing) {
                Button { withAnimation(.easeIn(duration: 0.5)) { isFilterPresented.toggle() } } label: {
                    Styles.Images.filter
                        .resizable()
                        .frame(width: 11, height: 13)
                }
            }
        }
        .foregroundColor(Styles.Colors.darkBlue)
    }
}

struct StoreView_Previews: PreviewProvider {
    static var previews: some View {
        StoreView(
            viewModel: StoreViewModel(
                service: WebService(),
                response: StoreViewModel.Response()
            )
        )
    }
}
