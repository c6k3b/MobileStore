//  DetailsViewModel.swift
//  Created by aa on 12/17/22.

import Foundation

protocol DetailsViewModelProtocol: ObservableObject {
    var response: DetailsResponse { get }
    func routeToBasket()
}

final class DetailsViewModel: DetailsViewModelProtocol, DetailsFlowStateProtocol {
    private let service: WebServiceProtocol
    @Published var activeLink: DetailsLink?
    @Published private(set) var response: DetailsResponse

    init(service: WebServiceProtocol, response: DetailsResponse) {
        self.service = service
        self.response = response
        fetch()
    }
}

extension DetailsViewModel {
    func routeToBasket() {
        activeLink = .basketLink
    }
}

private extension DetailsViewModel {
    func fetch() {
        DispatchQueue.global(qos: .background).async { [weak self] in
            self?.makeRequest {
                if let response = $0 {
                    DispatchQueue.main.async { self?.response = response }
                }
            }
        }
    }

    func makeRequest(completion: @escaping (DetailsResponse?) -> Void) {
        service.getData(DetailsResponse.self, for: .details) {
            switch $0 {
            case .success(let data): completion(data)
            case .failure(let error): print(error)
            }
        }
    }
}
