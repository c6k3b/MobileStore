//  FilterViewModel.swift
//  Created by aa on 12/18/22.

import Foundation

protocol FilterViewModelProtocol: ObservableObject {
}

final class FilterViewModel: FilterViewModelProtocol, FilterFlowStateProtocol {
    @Published var activeLink: FilterLink?
}
