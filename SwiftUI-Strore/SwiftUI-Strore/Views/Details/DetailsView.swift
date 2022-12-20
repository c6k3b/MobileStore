//  DetailsView.swift
//  Created by aa on 12/17/22.

import SwiftUI

struct DetailsView<ViewModel: DetailsViewModelProtocol & DetailsFlowStateProtocol>: View {
    @ObservedObject var viewModel: ViewModel
    @Environment(\.dismiss) var dismiss

    @State var categories = ["Shop", "Details", "Features"]
    @State var categoryIndex = 0

    @State var details = ["cpu", "camera", "ram", "rom"]
    @State var detailsIndex = 0

    var body: some View {
        DetailsFlowCoordinator(state: viewModel, content: content)
    }

    @ViewBuilder private func content() -> some View {
        VStack(content: {
            HStack(content: {
                Text("Images")
            })
            Spacer()

            ZStack(content: {
                RoundedRectangle(cornerRadius: 30)
                    .fill(Style.Colors.yellow)
                    .frame(width: UIScreen.main.bounds.width + 4, height: UIScreen.main.bounds.height / 2)
                    .padding(.bottom, -128)
                    .shadow(color: Style.Colors.shadowDetailsCard, radius: 20)
                VStack(spacing: 24, content: {
                    titleView
                        .padding(.top, 86)
                    featuresView
                    colorAndCapacityView
                    addToCartView
                })
                .padding(30)
                .foregroundColor(Style.Colors.darkBlue)
            })
        })
        .navigationBarBackButtonHidden(true)

        .toolbar(content: {
            ToolbarItem(placement: .navigationBarLeading, content: {
                Button(action: {
                    dismiss()
                }, label: {
                    Style.Images.navigationBack
                        .resizable()
                        .frame(width: 37, height: 37)
                })
            })

            ToolbarItem(placement: .principal, content: {
                Text("Product Details")
                    .font(Font.custom(Style.Fonts.medium, size: 18))
            })

            ToolbarItem(placement: .navigationBarTrailing, content: {
                Button(action: {
                    viewModel.routeToBasket()
                }, label: {
                    Style.Images.basket
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
