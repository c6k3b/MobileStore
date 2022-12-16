import Foundation

class FilterItem {
  struct Filter: Hashable {
    var title: String
    let options: [Option]
  }

  struct Option: Hashable {
    let title: String
  }

  enum DataItem: Hashable {
    case filter(Filter)
    case option(Option)
  }

  var filters: [Filter] { return _filters }
  private var _filters = [Filter]()

  init() { generateFilters() }
}

private extension FilterItem {
  func generateFilters() {
    _filters = [
      Filter(title: "Brand", options: [
        Option(title: "All"),
        Option(title: "Samsung"),
        Option(title: "Xiaomi"),
        Option(title: "Motorola")
      ]),

      Filter(title: "Price", options: [
        Option(title: "All"),
        Option(title: "$300 - $499"),
        Option(title: "$500 - $999"),
        Option(title: "$1,000 - $10,000")
      ]),

      Filter(title: "Size", options: [
        Option(title: "All"),
        Option(title: "4.5 to 5.5 inches"),
        Option(title: "5.6 to 6.7 inches")
      ])
    ]
  }
}
