//  StoreViewModel.swift
//  Created by aa on 12/17/22.

import Foundation

protocol StoreViewModelProtocol: ObservableObject {
    var response: StoreViewModel.Response { get }
    func routeToDetails()
    func routeToBasket()
}

final class StoreViewModel: StoreViewModelProtocol, StoreFlowStateProtocol {
    private let service: WebServiceProtocol
    @Published var activeLink: StoreLink?
    @Published private(set) var response: Response

    init(service: WebServiceProtocol, response: Response) {
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

    func makeRequest(completion: @escaping (Response?) -> Void) {
        service.request(Response.self, for: .store) {
            switch $0 {
            case .success(let data): completion(data)
            case .failure(let error): print(error)
            }
        }
    }
}

extension StoreViewModel {
    struct Response: Decodable {
        var hotSalesItems: [HotSalesItem]?
        var bestSellerItems: [BestSellerItem]?

        enum CodingKeys: String, CodingKey {
            case hotSalesItems = "home_store"
            case bestSellerItems = "best_seller"
        }

        init(
            hotSalesItems: [HotSalesItem]? = nil,
            bestSellerItems: [BestSellerItem]? = nil
        ) {
            self.hotSalesItems = hotSalesItems
            self.bestSellerItems = bestSellerItems
        }
    }

    struct HotSalesItem: Decodable, Hashable {
        let id: Int?
        let isNew: Bool?
        let title: String?
        let subtitle: String?
        let picture: String?
        let isAvailable: Bool?

        enum CodingKeys: String, CodingKey {
            case id, title, subtitle, picture
            case isNew = "is_new", isAvailable = "is_buy"
        }
    }

    struct BestSellerItem: Decodable, Hashable {
        let id: Int?
        let isInFavorites: Bool?
        let discountPrice: Int?
        let normalPrice: Int?
        let picture: String?
        let title: String?

        enum CodingKeys: String, CodingKey {
            case id, title, picture
            case isInFavorites = "is_favorites"
            case discountPrice = "price_without_discount"
            case normalPrice = "discount_price"
        }
    }
}
