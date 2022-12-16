import UIKit

class ItemNameStack: UIStackView {
  private lazy var descriptionStack: UIStackView = {
    $0.axis = .horizontal
    return $0
  }(UIStackView(arrangedSubviews: [itemName, favoritesButton]))

  let itemName: UILabel = {
    $0.text = "Galaxy Note 20 Ultra"
    $0.font = UIFont(name: Styles.Fonts.medium, size: 24)
    return $0
  }(UILabel())

  private lazy var favoritesButton: UIButton = {
    $0.layer.cornerRadius = 10
    $0.backgroundColor = Styles.Colors.darkBlue
    $0.setImage(Styles.Images.heart, for: .normal)
    $0.translatesAutoresizingMaskIntoConstraints = false
    return $0
  }(UIButton())

  private lazy var starsStack: UIStackView = {
    $0.axis = .horizontal
    for _ in 0..<5 {
      let view: UIImageView = {
        $0.image = Styles.Images.star
        $0.contentMode = .scaleAspectFit
        return $0
      }(UIImageView())
      $0.addArrangedSubview(view)
    }
    return $0
  }(UIStackView())

  override init(frame: CGRect) {
    super.init(frame: frame)
    setUp()
  }

  required init(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}

private extension ItemNameStack {
  func setUp() {
    axis = .vertical
    alignment = .leading
    spacing = 4
    addArrangedSubview(descriptionStack)
    addArrangedSubview(starsStack)
    activateConstraints()
  }
}

private extension ItemNameStack {
  func activateConstraints() {
    NSLayoutConstraint.activate([
      favoritesButton.heightAnchor.constraint(equalToConstant: 37),
      favoritesButton.widthAnchor.constraint(equalToConstant: 37),
      favoritesButton.rightAnchor.constraint(equalTo: rightAnchor)
    ])
  }
}
