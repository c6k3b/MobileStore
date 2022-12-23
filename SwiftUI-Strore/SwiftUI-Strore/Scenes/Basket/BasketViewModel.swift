//  BasketViewModel.swift
//  Created by aa on 12/17/22.

import Foundation

protocol BasketViewModelProtocol: ObservableObject {
    var response: BasketViewModel.Response { get }
}

final class BasketViewModel: BasketViewModelProtocol, BasketFlowStateProtocol {
    private let service: WebServiceProtocol
    @Published var activeLink: BasketLink?
    @Published private(set) var response: Response

    init(service: WebServiceProtocol, response: Response) {
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

    func makeRequest(completion: @escaping (Response?) -> Void) {
        service.request(Response.self, for: .basket) {
            switch $0 {
            case .success(let data): completion(data)
            case .failure(let error): print(error)
            }
        }
    }
}

extension BasketViewModel {
    struct Response: Decodable {
        var id: String?
        var basket: [BasketItem]?
        var delivery: String?
        var total: Int?

        struct BasketItem: Decodable {
            let id: Int?
            let images: String?
            let price: Int?
            let title: String?
        }

        init(id: String? = nil, basket: [BasketItem]? = nil, delivery: String? = nil, total: Int? = nil) {
            self.basket = basket
            self.delivery = delivery
            self.id = id
            self.total = total
        }
    }
}
