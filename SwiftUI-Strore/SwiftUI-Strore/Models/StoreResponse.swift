//  StoreResponse.swift
//  Created by aa on 12/17/22.

import Foundation

struct StoreResponse: Decodable {
    var hotSalesItems: [HotSalesItem]?
    var bestSellerItems: [BestSellerItem]?

    enum CodingKeys: String, CodingKey {
        case hotSalesItems = "home_store"
        case bestSellerItems = "best_seller"
    }

    init(
        hotSalesItems: [HotSalesItem]? = nil,
        bestSellerItems: [BestSellerItem]? = nil) {
            self.hotSalesItems = hotSalesItems
            self.bestSellerItems = bestSellerItems
        }
}

extension StoreResponse {
    struct HotSalesItem: Decodable, Identifiable, Hashable {
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
}

extension StoreResponse {
    struct BestSellerItem: Decodable, Identifiable, Hashable {
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

