//  StoreFlowCoordinator.swift
//  Created by aa on 12/18/22.

import SwiftUI

protocol StoreFlowStateProtocol: ObservableObject {
    var activeLink: StoreLink? { get set }
}

enum StoreLink: Hashable, Identifiable {
    case detailsLink, basketLink, sheetLink

    var id: UUID { return UUID() }
    var navigationLink: StoreLink? { self }

    var sheetItem: StoreLink? {
        switch self {
            case .sheetLink: return self
            default: return nil
        }
    }
}

struct StoreFlowCoordinator<State: StoreFlowStateProtocol, Content: View>: View {
    @ObservedObject var state: State
    let content: () -> Content
    private var activeLink: Binding<StoreLink?> {
        $state.activeLink.map(get: { $0?.navigationLink }, set: { $0 })
    }

    private var sheetItem: Binding<StoreLink?> {
        $state.activeLink.map(get: { $0?.sheetItem }, set: { $0 })
    }

    var body: some View {
        NavigationView(content: {
            ZStack(content: {
                content()
                    .sheet(item: sheetItem, content: sheetContent)
                navigationLinks
            })
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

    @ViewBuilder private func sheetContent(sheetItem: StoreLink) -> some View {
        FilterView(viewModel: FilterViewModel(text: "FilterView"))
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
