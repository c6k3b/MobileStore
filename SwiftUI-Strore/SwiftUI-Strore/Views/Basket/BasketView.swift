//  ContentView.swift
//  Created by aa on 12/17/22.

import SwiftUI

struct BasketView<ViewModel: BasketViewModelProtocol & BasketFlowStateProtocol>: View {
    @ObservedObject var viewModel: ViewModel
    
    var body: some View {
        BasketFlowCoordinator(state: viewModel, content: content)
    }

    @ViewBuilder private func content() -> some View {
        let total = viewModel.response.total ?? 0

        VStack {
            Text("\(total)")
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        BasketView(
            viewModel: BasketViewModel(
                service: WebService(),
                response: BasketResponse()
            )
        )
    }
}
