import UIKit

class TabsStack: UIStackView {
  private lazy var shopButtonStack: UIStackView = {
    $0.axis = .vertical
    $0.addArrangedSubview(shopButton)
    if shopButton.isSelected {
      $0.addArrangedSubview(ButtonUnderscoreView())
      shopButton.titleLabel?.font = UIFont(name: Styles.Fonts.bold, size: 20)
    }
    return $0
  }(UIStackView())

  let shopButton: UIButton = {
    $0.setTitle("Shop", for: .normal)
    $0.titleLabel?.font = UIFont(name: Styles.Fonts.medium, size: 20)
    $0.setTitleColor(Styles.Colors.buttonInactive, for: .normal)
    $0.setTitleColor(Styles.Colors.darkBlue, for: .selected)
    $0.isSelected = true
    return $0
  }(UIButton())

  private lazy var detailsButtonStack: UIStackView = {
    $0.axis = .vertical
    return $0
  }(UIStackView(arrangedSubviews: [detailsButton]))

  let detailsButton: UIButton = {
    $0.setTitle("Details", for: .normal)
    $0.titleLabel?.font = UIFont(name: Styles.Fonts.medium, size: 20)
    $0.setTitleColor(Styles.Colors.buttonInactive, for: .normal)
    $0.setTitleColor(Styles.Colors.darkBlue, for: .selected)
    return $0
  }(UIButton())

  private lazy var featuresButtonStack: UIStackView = {
    $0.axis = .vertical
    return $0
  }(UIStackView(arrangedSubviews: [featuresButton]))

  let featuresButton: UIButton = {
    $0.setTitle("Features", for: .normal)
    $0.titleLabel?.font = UIFont(name: Styles.Fonts.medium, size: 20)
    $0.setTitleColor(Styles.Colors.buttonInactive, for: .normal)
    $0.setTitleColor(Styles.Colors.darkBlue, for: .selected)
    return $0
  }(UIButton())

  override func layoutSubviews() {
    super.layoutSubviews()
    setUp()
  }
}

private extension TabsStack {
  func setUp() {
    axis = .horizontal
    alignment = .leading
    distribution = .fillEqually
    spacing = 24
    addArrangedSubview(shopButtonStack)
    addArrangedSubview(detailsButtonStack)
    addArrangedSubview(featuresButtonStack)
  }
}
