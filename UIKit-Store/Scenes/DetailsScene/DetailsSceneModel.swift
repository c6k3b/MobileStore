enum DetailsSceneModel {
  struct Request {}
  struct Response: Decodable {
    let cpu: String
    let camera: String
    let capacity: [String]
    let color: [String]
    let id: String
    let images: [String]
    let isInFavorites: Bool
    let price: Int
    let rating: Double
    let rom: String
    let ram: String
    let title: String

    enum CodingKeys: String, CodingKey {
      case camera, capacity, color, images, title, price, rating
      case cpu = "CPU"
      case id
      case isInFavorites = "isFavorites"
      case rom = "sd"
      case ram = "ssd"
    }
  }
  struct ViewModel {
  }
}
