//  FilterView.swift
//  Created by aa on 12/18/22.

import SwiftUI

struct FilterView<ViewModel: FilterViewModelProtocol & FilterFlowStateProtocol>: View {
    @ObservedObject var viewModel: ViewModel
    @Environment(\.dismiss) var dismiss

    var body: some View {
        FilterFlowCoordinator(state: viewModel, content: content)
    }

    @ViewBuilder private func content() -> some View {
        HStack(content: {
            Button(action: {
                dismiss()
            }, label: {
                Style.Images.navigationBack
                    .resizable()
                    .frame(width: 37, height: 37)
            })
            Spacer()

            Text("Filter Options")
                .font(Font.custom(Style.Fonts.medium, size: 18))
            Spacer()

            Button(action: {
                dismiss()
            }, label: {
                Text("Done")
                    .font(Font.custom(Style.Fonts.medium, size: 18))
            })
        })
        .padding(.horizontal, 44)
        .padding(.vertical, 24)
        Spacer()

        VStack(content: {
            Text("Filter")
        })
        .padding()
        .navigationBarBackButtonHidden(true)
    }
}

struct FilterView_Previews: PreviewProvider {
    static var previews: some View {
        FilterView(viewModel: FilterViewModel())
    }
}
