import UIKit

protocol StoreSceneViewDelegate: AnyObject {}

protocol StoreSceneViewLogic: UIView {
  var delegate: StoreSceneViewDelegate? { get set }
}

final class StoreSceneView: UIView, StoreSceneViewLogic {
  weak var delegate: StoreSceneViewDelegate?

  // MARK: - UI Components
  private lazy var stack: UIStackView = {
    $0.axis = .vertical
    $0.spacing = 16
    $0.translatesAutoresizingMaskIntoConstraints = false
    return $0
  }(UIStackView(arrangedSubviews: [selectCategoryStack, searchStack, hotSalesStack, bestSellerStack]))

  private lazy var searchStack: UIStackView = {
    $0.axis = .horizontal
    $0.spacing = 12
    return $0
  }(UIStackView(arrangedSubviews: [searchField, searchButton]))

  private let searchField: UISearchTextField = {
    $0.backgroundColor = Styles.Colors.white
    $0.tintColor = Styles.Colors.orange
    $0.font = UIFont(name: Styles.Fonts.regular, size: 12)
    $0.attributedPlaceholder = NSAttributedString(
      string: "Search",
      attributes: [
        NSAttributedString.Key.foregroundColor: Styles.Colors.buttonInactive,
        NSAttributedString.Key.font: UIFont(name: Styles.Fonts.regular, size: 12) as Any
      ]
    )
    $0.layer.cornerRadius = 17
    $0.clipsToBounds = true
    $0.leftView = UIImageView(image: Styles.Images.magnifyingGlass)
    return $0
  }(UISearchTextField())

  private var searchButton: UIButton = {
    $0.setImage(Styles.Images.searchButton, for: .normal)
    $0.imageView?.contentMode = .scaleAspectFit
    return $0
  }(UIButton())

  private lazy var selectCategoryStack: UIStackView = {
    $0.axis = .horizontal
    $0.alignment = .firstBaseline
    return $0
  }(UIStackView(arrangedSubviews: [categoryLabel, viewAllButton]))

  private let categoryLabel: UILabel = {
    $0.text = "Select Category"
    $0.font = UIFont(name: Styles.Fonts.bold, size: 25)
    return $0
  }(UILabel())

  private let viewAllButton: UIButton = {
    $0.titleLabel?.font = UIFont(name: Styles.Fonts.medium, size: 15)
    $0.setTitle("view all", for: .normal)
    $0.setTitleColor(Styles.Colors.orange, for: .normal)
    return $0
  }(UIButton())

  private lazy var hotSalesStack: UIStackView = {
    $0.axis = .horizontal
    $0.alignment = .firstBaseline
    return $0
  }(UIStackView(arrangedSubviews: [hotSalesLabel, hotSalesButton]))

  private let hotSalesLabel: UILabel = {
    $0.text = "Hot Sales"
    $0.font = UIFont(name: Styles.Fonts.bold, size: 25)
    return $0
  }(UILabel())

  private let hotSalesButton: UIButton = {
    $0.titleLabel?.font = UIFont(name: Styles.Fonts.medium, size: 15)
    $0.setTitle("see more", for: .normal)
    $0.setTitleColor(Styles.Colors.orange, for: .normal)
    return $0
  }(UIButton())

  private lazy var bestSellerStack: UIStackView = {
    $0.axis = .horizontal
    $0.alignment = .firstBaseline
    return $0
  }(UIStackView(arrangedSubviews: [bestSellerLabel, bestSellerButton]))

  private let bestSellerLabel: UILabel = {
    $0.text = "Best Seller"
    $0.font = UIFont(name: Styles.Fonts.bold, size: 25)
    return $0
  }(UILabel())

  private let bestSellerButton: UIButton = {
    $0.titleLabel?.font = UIFont(name: Styles.Fonts.medium, size: 15)
    $0.setTitle("see more", for: .normal)
    $0.setTitleColor(Styles.Colors.orange, for: .normal)
    return $0
  }(UIButton())

  let menuFooterView = MenuFooterView()

  // MARK: - Initialization
  init() {
    super.init(frame: .zero)
    setUp()
  }

  @available(*, unavailable)
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  override func layoutSubviews() {
    super.layoutSubviews()
    activateConstraints()
  }
}

private extension StoreSceneView {
  func setUp() {
    backgroundColor = Styles.Colors.background

    addSubview(stack)
    addSubview(menuFooterView)
  }
}

private extension StoreSceneView {
  func activateConstraints() {
    NSLayoutConstraint.activate([
      stack.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 8),
      stack.leftAnchor.constraint(equalTo: safeAreaLayoutGuide.leftAnchor, constant: 16),
      stack.rightAnchor.constraint(equalTo: safeAreaLayoutGuide.rightAnchor, constant: -16)
    ])

    NSLayoutConstraint.activate([
      searchStack.heightAnchor.constraint(equalToConstant: 37)
    ])

    NSLayoutConstraint.activate([
      searchButton.widthAnchor.constraint(equalToConstant: 37)
    ])
  }
}
