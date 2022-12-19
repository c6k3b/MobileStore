//  FilterView.swift
//  Created by aa on 12/18/22.

import SwiftUI

struct FilterView<ViewModel: FilterViewModelProtocol & FilterFlowStateProtocol>: View {
    @ObservedObject var viewModel: ViewModel

    var body: some View {
        FilterFlowCoordinator(state: viewModel, content: content)
            .frame(height: 100)
    }

    @ViewBuilder private func content() -> some View {
        VStack {
            Text(viewModel.text)
        }
//        .frame(maxHeight: UIScreen.main.bounds.height / 3)
    }
}

struct FilterView_Previews: PreviewProvider {
    static var previews: some View {
        FilterView(viewModel: FilterViewModel(text: "FilterView"))
    }
}
