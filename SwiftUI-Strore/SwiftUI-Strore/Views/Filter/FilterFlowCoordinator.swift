//  FilterFlowCoordinator.swift
//  Created by aa on 12/18/22.

import SwiftUI

protocol FilterFlowStateProtocol: ObservableObject {
    var activeLink: FilterLink? { get set }
}

enum FilterLink: Hashable {}

struct FilterFlowCoordinator<State: FilterFlowStateProtocol, Content: View>: View {
    @ObservedObject var state: State
    let content: () -> Content

    var body: some View {
        content()
    }
}
