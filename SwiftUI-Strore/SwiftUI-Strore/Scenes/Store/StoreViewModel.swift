//  StoreViewModel.swift
//  Created by aa on 12/17/22.

import Foundation

protocol StoreViewModelProtocol: ObservableObject {
    var response: StoreResponse { get }
    func routeToDetails()
    func routeToBasket()
}

final class StoreViewModel: StoreViewModelProtocol, StoreFlowStateProtocol {
    private let service: WebServiceProtocol
    @Published var activeLink: StoreLink?
    @Published private(set) var response: StoreResponse

    init(service: WebServiceProtocol, response: StoreResponse) {
        self.service = service
        self.response = response
        fetch()
    }
}

extension StoreViewModel {
    func routeToDetails() {
        activeLink = .detailsLink
    }

    func routeToBasket() {
        activeLink = .basketLink
    }
}

private extension StoreViewModel {
    func fetch() {
        DispatchQueue.global(qos: .background).async { [weak self] in
            self?.makeRequest {
                if let response = $0 {
                    DispatchQueue.main.async { self?.response = response }
                }
            }
        }
    }

    func makeRequest(completion: @escaping (StoreResponse?) -> Void) {
        service.getData(StoreResponse.self, for: .store) {
            switch $0 {
            case .success(let data): completion(data)
            case .failure(let error): print(error)
            }
        }
    }
}
