//  StoreFlowCoordinator.swift
//  Created by aa on 12/18/22.

import SwiftUI

protocol StoreFlowStateProtocol: ObservableObject {
    var activeLink: StoreLink? { get set }
}

enum StoreLink: Hashable, Identifiable {
    case detailsLink, basketLink

    var id: UUID { return UUID() }
    var navigationLink: StoreLink? { self }
}

struct StoreFlowCoordinator<State: StoreFlowStateProtocol, Content: View>: View {
    @ObservedObject var state: State
    let content: () -> Content
    private var activeLink: Binding<StoreLink?> {
        $state.activeLink.map(get: { $0?.navigationLink }, set: { $0 })
    }

    var body: some View {
        NavigationView(content: {
            ZStack(content: {
                content()
                navigationLinks
            })
            .navigationBarTitleDisplayMode(.inline)
        })
    }

    @ViewBuilder private var navigationLinks: some View {
        NavigationLink(tag: .detailsLink, selection: activeLink, destination: detailsDestination) {
            EmptyView()
        }
        NavigationLink(tag: .basketLink, selection: activeLink, destination: basketDestination) {
            EmptyView()
        }
    }

    private func detailsDestination() -> some View {
        return DetailsView(
            viewModel: DetailsViewModel(
                service: WebService(),
                response: DetailsResponse()
            )
        )
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
