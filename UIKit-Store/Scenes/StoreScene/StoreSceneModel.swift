enum StoreSceneModel {
  struct Request {}

  struct Response: Decodable { // swiftlint:disable nesting
    let hotSalesItems: [HotSalesItem]
    let bestSellerItems: [BestSellerItem]

    enum CodingKeys: String, CodingKey {
      case hotSalesItems = "home_store"
      case bestSellerItems = "best_seller"
    }

    struct HotSalesItem: Decodable {
      let id: Int
      let isNew: Bool?
      let title: String
      let subtitle: String
      let picture: String
      let isAvailable: Bool

      enum CodingKeys: String, CodingKey {
        case id
        case isNew = "is_new"
        case title, subtitle, picture
        case isAvailable = "is_buy"
      }
    }

    struct BestSellerItem: Decodable {
      let id: Int
      let isInFavorites: Bool
      let title: String
      let discountPrice: Int
      let normalPrice: Int
      let picture: String

      enum CodingKeys: String, CodingKey {
        case id
        case isInFavorites = "is_favorites"
        case title
        case discountPrice = "price_without_discount"
        case normalPrice = "discount_price"
        case picture
      }
    }
  }

  struct ViewModel {}
}
