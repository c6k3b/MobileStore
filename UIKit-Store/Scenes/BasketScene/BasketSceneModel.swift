enum BasketSceneModel {
  struct Request {}

  // MARK: - Response
  struct Response: Decodable {
    let basket: [BasketItem]
    let delivery: String
    let id: String
    let total: Int

    struct BasketItem: Decodable {
      let id: Int
      let images: String
      let price: Int
      let title: String
    }
  }

  // MARK: - ViewModel
  struct ViewModel {
    let items: [BasketItem]
    let summary: Summary

    struct BasketItem {
      let image: String
      let description: String
      let price: String
    }

    struct Summary {
      let total: String
      let delivery: String
    }
  }
}
