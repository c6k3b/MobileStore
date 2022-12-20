//  FilterView.swift
//  Created by aa on 12/18/22.

import SwiftUI

struct FilterView<ViewModel: FilterViewModelProtocol & FilterFlowStateProtocol>: View {
    @ObservedObject var viewModel: ViewModel
    @Environment(\.dismiss) var dismiss
//    @State

    var body: some View {
        FilterFlowCoordinator(state: viewModel, content: content)
    }

    @ViewBuilder private func content() -> some View {
        ScrollView(showsIndicators: false, content: {
            menu
            Spacer()
            VStack(spacing: 16, content: {
                VStack(alignment: .leading, spacing: 8, content: {
                    Text("Brand")
                        .font(Font.custom(Style.Fonts.medium, size: 18))
                    DisclosureGroup("Samsung", content: {})
                        .padding(EdgeInsets(top: 4, leading: 14, bottom: 4, trailing: 14))
                        .border(Style.Colors.filtersGray)
                        .cornerRadius(5)
                })

                VStack(alignment: .leading, spacing: 8, content: {
                    Text("Price")
                        .font(Font.custom(Style.Fonts.medium, size: 18))
                    DisclosureGroup("$300 - $500", content: {})
                        .padding(EdgeInsets(top: 4, leading: 14, bottom: 4, trailing: 14))
                        .border(Style.Colors.filtersGray)
                        .cornerRadius(5)
                })

                VStack(alignment: .leading, spacing: 8, content: {
                    Text("Size")
                        .font(Font.custom(Style.Fonts.medium, size: 18))
                    DisclosureGroup("4.5 to 5.5 inches", content: {})
                        .padding(EdgeInsets(top: 4, leading: 14, bottom: 4, trailing: 14))
                        .border(Style.Colors.filtersGray)
                        .cornerRadius(5)
                })
            })
            .tint(Style.Colors.iconGrey)
            .foregroundColor(.primary)
            .font(Font.custom(Style.Fonts.regular, size: 18))
            .padding(24)
        })
        .navigationBarBackButtonHidden(true)
        Spacer()
    }

    @ViewBuilder private var menu: some View {
        HStack(content: {
            Button(action: {
                dismiss()
            }, label: {
                Style.Images.xmark
                    .frame(width: 37, height: 37)
                    .font(Font.custom(Style.Fonts.bold, size: 12))
                    .foregroundColor(Style.Colors.white)
                    .background(Style.Colors.darkBlue)
                    .cornerRadius(10)
                    .frame(width: 88, height: 37, alignment: .leading)
            })
            Spacer()

            Text("Filter Options")
                .font(Font.custom(Style.Fonts.medium, size: 18))
                .frame(alignment: .leading)
            Spacer()

            Button(action: {
                dismiss()
            }, label: {
                Text("Done")
                    .font(Font.custom(Style.Fonts.medium, size: 18))
                    .foregroundColor(Style.Colors.white)
                    .frame(width: 88, height: 37)
                    .background(Style.Colors.orange)
                    .cornerRadius(10)
            })
        })
        .padding(24)
        .buttonBorderShape(.capsule)
    }
}

struct FilterView_Previews: PreviewProvider {
    static var previews: some View {
        FilterView(viewModel: FilterViewModel())
    }
}
