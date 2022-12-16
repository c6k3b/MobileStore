import UIKit

class FilterListHeaderView: UICollectionReusableView {
  let label: UILabel = {
    $0.textColor = Styles.Colors.darkBlue
    $0.font = UIFont(name: Styles.Fonts.medium, size: 18)
    $0.translatesAutoresizingMaskIntoConstraints = false
    return $0
  }(UILabel())

  override init(frame: CGRect) {
    super.init(frame: frame)
    setUp()
  }

  required init?(coder: NSCoder) { nil }
}

private extension FilterListHeaderView {
  func setUp() {
    addSubview(label)
    activateConstraints()
  }
}

private extension FilterListHeaderView {
  func activateConstraints() {
    NSLayoutConstraint.activate([
      label.topAnchor.constraint(equalTo: topAnchor),
      label.leftAnchor.constraint(equalTo: leftAnchor),
      label.rightAnchor.constraint(equalTo: rightAnchor),
      label.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -8)
    ])
  }
}
