//  FilterViewModel.swift
//  Created by aa on 12/18/22.

import Foundation

protocol FilterViewModelProtocol: ObservableObject {
    var text: String { get }
}

final class FilterViewModel: FilterViewModelProtocol, FilterFlowStateProtocol {
    @Published var activeLink: FilterLink?
    @Published var text: String

    init(text: String) {
        self.text = "\(text)"
    }
}
