import UIKit

protocol BasketSceneViewDelegate: AnyObject {}

protocol BasketSceneViewLogic: UIView {
  var delegate: BasketSceneViewDelegate? { get set }
}

final class BasketSceneView: UIView, BasketSceneViewLogic {
  // MARK: - Stored Properties
  weak var delegate: BasketSceneViewDelegate?

  // MARK: - UI Components
  private let basketLabel: UILabel = {
    $0.text = "My Cart"
    $0.font = UIFont(name: Styles.Fonts.bold, size: 35)
    $0.translatesAutoresizingMaskIntoConstraints = false
    return $0
  }(UILabel())

  private lazy var cartView: UIView = {
    $0.layer.cornerRadius = 30
    $0.layer.maskedCorners = [
      CACornerMask.layerMinXMinYCorner,
      CACornerMask.layerMaxXMinYCorner
    ]

    $0.backgroundColor = Styles.Colors.darkBlue
    $0.translatesAutoresizingMaskIntoConstraints = false

    $0.addSubview(cartStack)
    return $0
  }(UIView())

  private lazy var cartStack: UIStackView = {
    $0.axis = .vertical
    $0.spacing = 24
    $0.translatesAutoresizingMaskIntoConstraints = false
    return $0
  }(UIStackView(arrangedSubviews: [cartItemsTable, SeparatorView(), summaryStack, SeparatorView(), checkoutButton]))

  let cartItemsTable: UITableView = {
    $0.showsVerticalScrollIndicator = false
    $0.separatorStyle = .none
    $0.backgroundColor = Styles.Colors.darkBlue
    $0.register(CartCell.self, forCellReuseIdentifier: CartCell.identifier)
    return $0
  }(UITableView())

  let summaryStack = SummaryStackView()

  private let checkoutButton: UIButton = {
    $0.layer.cornerRadius = 10
    $0.backgroundColor = Styles.Colors.orange
    $0.titleLabel?.font = UIFont(name: Styles.Fonts.bold, size: 20)
    $0.setTitle("Checkout", for: .normal)
    $0.setTitleColor(Styles.Colors.white, for: .normal)
    return $0
  }(UIButton())

  // MARK: - Initialization
  init() {
    super.init(frame: .zero)
    setUp()
  }

  @available(*, unavailable)
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  func configure(with model: BasketSceneModel.ViewModel.Summary) {
    summaryStack.totalValueLabel.text = model.total
    summaryStack.deliveryValueLabel.text = model.delivery
  }

  override func layoutSubviews() {
    activateConstraints()
  }
}

// MARK: - Private Methods
private extension BasketSceneView {
  func setUp() {
    backgroundColor = Styles.Colors.background

    addSubview(basketLabel)
    addSubview(cartView)
  }
}

// MARK: - Constraints
private extension BasketSceneView {
  func activateConstraints() {
    NSLayoutConstraint.activate([
      basketLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 32),
      basketLabel.leftAnchor.constraint(equalTo: safeAreaLayoutGuide.leftAnchor, constant: 32),
      basketLabel.rightAnchor.constraint(equalTo: safeAreaLayoutGuide.rightAnchor, constant: -32)
    ])

    NSLayoutConstraint.activate([
      cartView.topAnchor.constraint(equalTo: topAnchor, constant: bounds.height / 3.5),
      cartView.leftAnchor.constraint(equalTo: safeAreaLayoutGuide.leftAnchor),
      cartView.bottomAnchor.constraint(equalTo: bottomAnchor),
      cartView.rightAnchor.constraint(equalTo: safeAreaLayoutGuide.rightAnchor)
    ])

    NSLayoutConstraint.activate([
      cartStack.topAnchor.constraint(equalTo: cartView.topAnchor, constant: 80),
      cartStack.leftAnchor.constraint(equalTo: cartView.leftAnchor, constant: 32),
      cartStack.bottomAnchor.constraint(equalTo: cartView.safeAreaLayoutGuide.bottomAnchor),
      cartStack.rightAnchor.constraint(equalTo: cartView.rightAnchor, constant: -32)
    ])

    NSLayoutConstraint.activate([
      checkoutButton.heightAnchor.constraint(equalToConstant: 54)
    ])
  }
}
