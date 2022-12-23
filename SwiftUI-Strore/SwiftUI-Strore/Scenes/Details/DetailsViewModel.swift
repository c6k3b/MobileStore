//  DetailsViewModel.swift
//  Created by aa on 12/17/22.

import Foundation

protocol DetailsViewModelProtocol: ObservableObject {
    var response: DetailsViewModel.Response { get }
    func routeToBasket()
}

final class DetailsViewModel: DetailsViewModelProtocol, DetailsFlowStateProtocol {
    private let service: WebServiceProtocol
    @Published var activeLink: DetailsLink?
    @Published private(set) var response: Response

    init(service: WebServiceProtocol, response: Response) {
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

    func makeRequest(completion: @escaping (Response?) -> Void) {
        service.request(Response.self, for: .details) {
            switch $0 {
            case .success(let data): completion(data)
            case .failure(let error): print(error)
            }
        }
    }
}

extension DetailsViewModel {
    struct Response: Decodable {
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
}
