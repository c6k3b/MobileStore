import UIKit

class SummaryStackView: UIStackView {
  private lazy var summaryLabelsStack: UIStackView = {
    $0.alignment = .leading
    $0.axis = .vertical
    $0.spacing = 12
    return $0
  }(UIStackView(arrangedSubviews: [totalLabel, deliveryLabel]))

  private lazy var summaryValuesStack: UIStackView = {
    $0.alignment = .trailing
    $0.axis = .vertical
    $0.spacing = 12
    return $0
  }(UIStackView(arrangedSubviews: [totalValueLabel, deliveryValueLabel]))

  private let totalLabel: UILabel = {
    $0.text = "Total"
    $0.textColor = Styles.Colors.white
    $0.font = UIFont(name: Styles.Fonts.regular, size: 15)
    return $0
  }(UILabel())

  private let deliveryLabel: UILabel = {
    $0.text = "Delivery"
    $0.textColor = Styles.Colors.white
    $0.font = UIFont(name: Styles.Fonts.regular, size: 15)
    return $0
  }(UILabel())

  let totalValueLabel: UILabel = {
    $0.textColor = Styles.Colors.white
    $0.font = UIFont(name: Styles.Fonts.bold, size: 15)
    return $0
  }(UILabel())

  let deliveryValueLabel: UILabel = {
    $0.textColor = Styles.Colors.white
    $0.font = UIFont(name: Styles.Fonts.bold, size: 15)
    return $0
  }(UILabel())

  override init(frame: CGRect) {
    super.init(frame: frame)
    setUp()
  }

  required init(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}

private extension SummaryStackView {
  func setUp() {
    alignment = .leading
    axis = .horizontal
    addArrangedSubview(summaryLabelsStack)
    addArrangedSubview(summaryValuesStack)
  }
}
