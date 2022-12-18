//  BasketViewModel.swift
//  Created by aa on 12/17/22.

import Foundation

protocol BasketViewModelProtocol: ObservableObject {
    var response: BasketResponse { get }
}

final class BasketViewModel: BasketViewModelProtocol, BasketFlowStateProtocol {
    private let service: WebServiceProtocol
    @Published var activeLink: BasketLink?
    @Published private(set) var response: BasketResponse
    
    init(service: WebServiceProtocol, response: BasketResponse) {
        self.service = service
        self.response = response
        fetch()
    }
}

private extension BasketViewModel {
    func fetch() {
        DispatchQueue.global(qos: .background).async { [weak self] in
            self?.makeRequest {
                if let response = $0 {
                    DispatchQueue.main.async { self?.response = response }
                }
            }
        }
    }
    
    func makeRequest(completion: @escaping (BasketResponse?) -> Void) {
        service.getData(BasketResponse.self, for: .basket) {
            switch $0 {
                case .success(let data): completion(data)
                case .failure(let error): print(error)
            }
        }
    }
}
