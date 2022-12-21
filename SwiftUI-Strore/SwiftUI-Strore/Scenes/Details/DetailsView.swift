//  DetailsView.swift
//  Created by aa on 12/17/22.

import SwiftUI

struct DetailsView<ViewModel: DetailsViewModelProtocol & DetailsFlowStateProtocol>: View {
    @ObservedObject var viewModel: ViewModel
    @Environment(\.dismiss) var dismiss

    @State var categories = ["Shop", "Details", "Features"]
    @State var details = ["cpu", "camera", "ram", "rom"]

    @State var categoryIndex = 0
    @State var detailsIndex = 0
    @State var ssdIndex = 0
    @State var colorIndex = 0

    var body: some View {
        DetailsFlowCoordinator(state: viewModel, content: content)
    }

    @ViewBuilder private func content() -> some View {
        VStack(content: {
            imagesView

            ZStack(alignment: .bottom, content: {
                Rectangle()
                    .cornerRadius(30, corners: [.topLeft, .topRight])
                    .foregroundColor(Styles.Colors.white)
                    .edgesIgnoringSafeArea([.bottom])
                    .shadow(color: Styles.Colors.shadow, radius: 20)

                ScrollView(.vertical, showsIndicators: false, content: {
                    VStack(spacing: 24, content: {
                        titleView
                        featuresView
                        colorAndCapacityView
                    })
                })
                .padding(EdgeInsets(top: 10, leading: 30, bottom: 72, trailing: 30))

                addToCartButtonView
            })
            .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height / 2)
        })
        .background(Styles.Colors.background)
        .foregroundColor(Styles.Colors.darkBlue)
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

            ToolbarItem(placement: .principal, content: {
                Text("Product Details")
                    .font(Font.custom(Styles.Fonts.medium, size: 18))
            })

            ToolbarItem(placement: .navigationBarTrailing, content: {
                Button(action: {
                    viewModel.routeToBasket()
                }, label: {
                    Styles.Images.basket
                        .resizable()
                        .frame(width: 37, height: 37)
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
