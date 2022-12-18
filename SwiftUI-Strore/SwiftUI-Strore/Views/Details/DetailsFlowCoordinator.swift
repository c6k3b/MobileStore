//  DetailsFlowCoordinator.swift
//  Created by aa on 12/18/22.

import SwiftUI

protocol DetailsFlowStateProtocol: ObservableObject {
    var activeLink: DetailsLink? { get set }
}

enum DetailsLink: Hashable, Identifiable {
    case basketLink

    var id: UUID { return UUID() }
    var navigationLink: DetailsLink? { self }
}

struct DetailsFlowCoordinator<State: DetailsFlowStateProtocol, Content: View>: View {
    @ObservedObject var state: State
    let content: () -> Content
    private var activeLink: Binding<DetailsLink?> {
        $state.activeLink.map(get: { $0?.navigationLink }, set: { $0 })
    }

    var body: some View {
        content()
        navigationLinks
    }

    @ViewBuilder private var navigationLinks: some View {
        NavigationLink(tag: .basketLink, selection: activeLink, destination: basketDestination) {
            EmptyView()
        }
    }

    private func basketDestination() -> some View {
        return BasketView(
            viewModel: BasketViewModel(
                service: WebService(),
                response: BasketResponse()
            )
        )
    }
}
