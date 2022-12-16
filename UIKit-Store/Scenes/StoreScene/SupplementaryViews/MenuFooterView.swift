import UIKit

class MenuFooterView: UIView {
  private lazy var menuStack: UIStackView = {
    $0.axis = .horizontal
    $0.distribution = .equalSpacing
    $0.translatesAutoresizingMaskIntoConstraints = false
    return $0
  }(UIStackView(arrangedSubviews: [explorerButton, bagButton, likeButton, accountButton]))

  private let explorerButton: UIButton = {
    $0.setTitle("· Explorer", for: .normal)
    $0.titleLabel?.font = UIFont(name: Styles.Fonts.bold, size: 15)
    return $0
  }(UIButton())

  let bagButton: UIButton = {
    $0.setImage(Styles.Images.bag, for: .normal)
    return $0
  }(UIButton())

  let likeButton: UIButton = {
    $0.setImage(Styles.Images.heart, for: .normal)
    return $0
  }(UIButton())

  private let accountButton: UIButton = {
    $0.setImage(Styles.Images.person, for: .normal)
    return $0
  }(UIButton())

  override init(frame: CGRect) {
    super.init(frame: frame)
    setUp()
  }

  required init?(coder: NSCoder) { nil }

  override func layoutSubviews() {
    activateConstraints()
  }
}

private extension MenuFooterView {
  func setUp() {
    layer.cornerRadius = 30
    layer.maskedCorners = [CACornerMask.layerMinXMinYCorner, CACornerMask.layerMaxXMinYCorner]

    backgroundColor = Styles.Colors.darkBlue
    translatesAutoresizingMaskIntoConstraints = false

    addSubview(menuStack)
  }
}

private extension MenuFooterView {
  func activateConstraints() {
    if let superview = superview {
      NSLayoutConstraint.activate([
        topAnchor.constraint(equalTo: superview.bottomAnchor, constant: -88),
        leftAnchor.constraint(equalTo: superview.safeAreaLayoutGuide.leftAnchor),
        bottomAnchor.constraint(equalTo: superview.bottomAnchor),
        rightAnchor.constraint(equalTo: superview.safeAreaLayoutGuide.rightAnchor)
      ])
    }

    NSLayoutConstraint.activate([
      menuStack.topAnchor.constraint(equalTo: topAnchor, constant: 28),
      menuStack.leftAnchor.constraint(equalTo: leftAnchor, constant: 28),
      menuStack.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -28)
    ])
  }
}
