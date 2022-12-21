//  BasketFlowCoordinator.swift
//  Created by aa on 12/18/22.

import SwiftUI

protocol BasketFlowStateProtocol: ObservableObject {
    var activeLink: BasketLink? { get set }
}

enum BasketLink: Hashable {}

struct BasketFlowCoordinator<State: BasketFlowStateProtocol, Content: View>: View {
    @ObservedObject var state: State
    let content: () -> Content

    var body: some View {
        content()
    }
}
