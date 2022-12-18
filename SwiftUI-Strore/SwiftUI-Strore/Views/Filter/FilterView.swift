//  FilterView.swift
//  Created by aa on 12/18/22.

import SwiftUI

struct FilterView<ViewModel: FilterViewModelProtocol & FilterFlowStateProtocol>: View {
    @ObservedObject var viewModel: ViewModel

    var body: some View {
        FilterFlowCoordinator(state: viewModel, content: content)
    }

    @ViewBuilder private func content() -> some View {
        ZStack {
            Text(viewModel.text)
        }
    }
}

struct FilterView_Previews: PreviewProvider {
    static var previews: some View {
        FilterView(viewModel: FilterViewModel(text: "FilterView"))
    }
}
