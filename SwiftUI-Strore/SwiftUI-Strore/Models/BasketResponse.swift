//  BasketResponse.swift
//  Created by aa on 12/17/22.

import Foundation

struct BasketResponse: Decodable {
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
