import UIKit

protocol ConfigurableCell: AnyObject {
  func configure(with model: BasketSceneModel.ViewModel.BasketItem)
}

class CartCell: UITableViewCell, ConfigurableCell {
  static var identifier: String { String(describing: CartCell.self) }

  private lazy var cellStack: UIStackView = {
    $0.axis = .horizontal
    $0.spacing = 16
    $0.translatesAutoresizingMaskIntoConstraints = false
    $0.setCustomSpacing(8, after: stepperStack)
    return $0
  }(UIStackView(arrangedSubviews: [itemImageView, itemStack, stepperStack, binButton]))

  private let itemImageView: UIImageView = {
    $0.clipsToBounds = true
    $0.layer.cornerRadius = 10
    $0.contentMode = .scaleAspectFill
    $0.translatesAutoresizingMaskIntoConstraints = false
    return $0
  }(UIImageView())

  private lazy var itemStack: UIStackView = {
    $0.alignment = .leading
    $0.distribution = .fillProportionally
    $0.axis = .vertical
    return $0
  }(UIStackView(arrangedSubviews: [decriptionLabel, priceLabel]))

  private let decriptionLabel: UILabel = {
    $0.numberOfLines = 0
    $0.textColor = Styles.Colors.white
    $0.font = UIFont(name: Styles.Fonts.bold, size: 20)
    return $0
  }(UILabel())

  private let priceLabel: UILabel = {
    $0.textColor = Styles.Colors.orange
    $0.font = UIFont(name: Styles.Fonts.bold, size: 20)
    return $0
  }(UILabel())

  private lazy var stepperStack: UIStackView = {
    $0.axis = .vertical
    $0.distribution = .fillEqually
    $0.alignment = .center
    $0.tintColor = Styles.Colors.white
    $0.backgroundColor = Styles.Colors.darkGrey
    $0.layer.cornerRadius = 12
    $0.translatesAutoresizingMaskIntoConstraints = false
    return $0
  }(UIStackView(arrangedSubviews: [plusButton, countLabel, minusButton]))

  private let plusButton: UIButton = {
    $0.setTitle("+", for: .normal)
    $0.titleLabel?.font = UIFont(name: Styles.Fonts.bold, size: 20)
    return $0
  }(UIButton())

  private let countLabel: UILabel = {
    $0.text = "2"
    $0.font = UIFont(name: Styles.Fonts.bold, size: 20)
    $0.textColor = Styles.Colors.white
    return $0
  }(UILabel())

  private let minusButton: UIButton = {
    $0.setTitle("-", for: .normal)
    $0.titleLabel?.font = UIFont(name: Styles.Fonts.bold, size: 20)
    return $0
  }(UIButton())

  private let binButton: UIButton = {
    $0.setImage(Styles.Images.bin, for: .normal)
    $0.contentMode = .scaleAspectFit
    return $0
  }(UIButton())

  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    setUp()
  }

  required init?(coder: NSCoder) { nil }

  func configure(with model: BasketSceneModel.ViewModel.BasketItem) {
    itemImageView.setImage(with: URL(string: model.image))
    decriptionLabel.text = model.description
    priceLabel.text = model.price
  }

  override func layoutSubviews() {
    super.layoutSubviews()
    contentView.frame = contentView.frame.inset(
      by: UIEdgeInsets(top: 12, left: 0, bottom: 12, right: 0)
    )
  }
}

private extension CartCell {
  func setUp() {
    backgroundColor = Styles.Colors.darkBlue
    selectionStyle = .none
    contentView.addSubview(cellStack)
    activateConstraints()
  }
}

private extension CartCell {
  func activateConstraints() {
    NSLayoutConstraint.activate([
      cellStack.topAnchor.constraint(equalTo: contentView.topAnchor),
      cellStack.leftAnchor.constraint(equalTo: contentView.leftAnchor),
      cellStack.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
      cellStack.rightAnchor.constraint(equalTo: contentView.rightAnchor)
    ])

    NSLayoutConstraint.activate([
      itemImageView.heightAnchor.constraint(equalToConstant: 88),
      itemImageView.widthAnchor.constraint(equalToConstant: 88)
    ])

    NSLayoutConstraint.activate([
      stepperStack.widthAnchor.constraint(equalToConstant: 26)
    ])
  }
}
