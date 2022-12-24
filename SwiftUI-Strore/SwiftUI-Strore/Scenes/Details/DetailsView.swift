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
        VStack {
            imagesView

            ZStack(alignment: .bottom) {
                RectangleView(color: Styles.Colors.white)

                ScrollView(.vertical, showsIndicators: false) {
                    VStack(spacing: 24) {
                        titleView
                        featuresView
                        colorAndCapacityView
                    }
                }
                .padding(EdgeInsets(top: 10, leading: 30, bottom: 72, trailing: 30))

                ButtonView(
                    text: "Add to Cart  \((viewModel.response.price ?? 0).formatted(.currency(code: "USD")))",
                    action: { viewModel.routeToBasket() }
                )
                .padding(EdgeInsets(top: 0, leading: 30, bottom: 40, trailing: 30))
            }
            .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height / 2)
        }
        .background(Styles.Colors.background)
        .foregroundColor(Styles.Colors.darkBlue)
        .navigationBarBackButtonHidden(true)

        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                RectangleButtonView(
                    image: Styles.Images.chevronLeft,
                    color: Styles.Colors.darkBlue,
                    action: { dismiss() }
                )
            }

            ToolbarItem(placement: .principal) {
                Text("Product Details")
                    .font(Font.custom(Styles.Fonts.medium, size: 18))
            }

            ToolbarItem(placement: .navigationBarTrailing) {
                RectangleButtonView(
                    image: Styles.Images.bag,
                    color: Styles.Colors.orange,
                    action: { viewModel.routeToBasket() }
                )
            }
        }
    }
}

struct DetailsView_Previews: PreviewProvider {
    static var previews: some View {
        DetailsView(
            viewModel: DetailsViewModel(
                service: WebService(),
                response: DetailsViewModel.Response()
            )
        )
    }
}
