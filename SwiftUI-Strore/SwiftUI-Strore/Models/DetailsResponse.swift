//  DetailsResponse.swift
//  Created by aa on 12/17/22.

import Foundation

struct DetailsResponse: Decodable {
    var id: String?
    var images: [String]?
    var title: String?
    var isInFavorites: Bool?
    var rating: Double?
    var cpu: String?
    var camera: String?
    var ram: String?
    var rom: String?
    var color: [String]?
    var capacity: [String]?
    var price: Int?

    enum CodingKeys: String, CodingKey {
        case id, camera, capacity, color, images, title, price, rating
        case cpu = "CPU", rom = "sd", ram = "ssd", isInFavorites = "isFavorites"
    }

    init(
        id: String? = nil,
        images: [String]? = nil,
        title: String? = nil,
        isInFavorites: Bool? = nil,
        rating: Double? = nil,
        cpu: String? = nil,
        camera: String? = nil,
        ram: String? = nil,
        rom: String? = nil,
        color: [String]? = nil,
        capacity: [String]? = nil,
        price: Int? = nil
    ) {
        self.id = id
        self.images = images
        self.title = title
        self.isInFavorites = isInFavorites
        self.rating = rating
        self.cpu = cpu
        self.camera = camera
        self.ram = ram
        self.rom = rom
        self.color = color
        self.capacity = capacity
        self.price = price
    }
}
