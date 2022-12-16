import UIKit

protocol DetailsSceneViewDelegate: AnyObject {}

protocol DetailsSceneViewLogic: UIView {
  var delegate: DetailsSceneViewDelegate? { get set }
}

final class DetailsSceneView: UIView, DetailsSceneViewLogic {
  // MARK: - Stored Properties
  weak var delegate: DetailsSceneViewDelegate?

  // MARK: - UI Components
  private lazy var photosScrollView: UIScrollView = {
    $0.backgroundColor = Styles.Colors.background
    $0.showsHorizontalScrollIndicator = false
    $0.translatesAutoresizingMaskIntoConstraints = false
    $0.addSubview(contentView)
    return $0
  }(UIScrollView())

  private lazy var contentView: UIView = {
    $0.translatesAutoresizingMaskIntoConstraints = false
    $0.addSubview(stackView)
    return $0
  }(UIView())

  private lazy var stackView: UIStackView = {
    $0.axis = .horizontal
    $0.spacing = 16
    $0.translatesAutoresizingMaskIntoConstraints = false
    for _ in 0 ..< 3 {
      let view: UIImageView = {
        $0.backgroundColor = Styles.Colors.white
        $0.layer.cornerRadius = 30
        $0.layer.shadowColor = Styles.Colors.darkGrey.cgColor
        $0.layer.shadowOpacity = 0.1
        $0.layer.shadowOffset = .zero
        $0.layer.shadowRadius = 10
        $0.image = Styles.Images.camera
        $0.contentMode = .scaleAspectFit
        return $0
      }(UIImageView())
      $0.addArrangedSubview(view)
    }
    return $0
  }(UIStackView())

  private lazy var descriptionView: UIView = {
    $0.layer.cornerRadius = 30
    $0.layer.maskedCorners = [CACornerMask.layerMinXMinYCorner, CACornerMask.layerMaxXMinYCorner]

    $0.layer.shadowColor = Styles.Colors.darkGrey.cgColor
    $0.layer.shadowOpacity = 0.1
    $0.layer.shadowOffset = .zero
    $0.layer.shadowRadius = 10

    $0.backgroundColor = Styles.Colors.white
    $0.translatesAutoresizingMaskIntoConstraints = false
    $0.addSubview(detailsStack)
    return $0
  }(UIView())

  private lazy var detailsStack: UIStackView = {
    $0.axis = .vertical
    $0.distribution = .equalSpacing
    $0.translatesAutoresizingMaskIntoConstraints = false
    return $0
  }(UIStackView(arrangedSubviews: [
    itemNameStack, tabsStack, techDetailsStack, colorCapasityLabel, colorCapacityStack, addToCartButton
  ]))

  let itemNameStack = ItemNameStack()
  let tabsStack = TabsStack()
  let techDetailsStack = TechDetailsStack()
  let colorCapacityStack = ColorCapacityStack()

  let colorCapasityLabel: UILabel = {
    $0.text = "Select color and capacity"
    $0.font = UIFont(name: Styles.Fonts.medium, size: 16)
    return $0
  }(UILabel())

  let addToCartButton: UIButton = {
    $0.layer.cornerRadius = 10
    $0.backgroundColor = Styles.Colors.orange
    $0.titleLabel?.font = UIFont(name: Styles.Fonts.bold, size: 20)
    $0.setTitle("Add to Cart", for: .normal)
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

  override func layoutSubviews() {
    super.layoutSubviews()
    activateConstraints()
  }
}

// MARK: - Methods
private extension DetailsSceneView {
  func setUp() {
    backgroundColor = Styles.Colors.background
    addSubview(photosScrollView)
    addSubview(descriptionView)
  }
}

// MARK: - Constraints
private extension DetailsSceneView {
  func activateConstraints() {
    NSLayoutConstraint.activate([
      photosScrollView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
      photosScrollView.leftAnchor.constraint(equalTo: leftAnchor),
      photosScrollView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -bounds.height / 2),
      photosScrollView.rightAnchor.constraint(equalTo: rightAnchor)
    ])

    NSLayoutConstraint.activate([
      descriptionView.topAnchor.constraint(equalTo: topAnchor, constant: bounds.height / 2),
      descriptionView.leftAnchor.constraint(equalTo: safeAreaLayoutGuide.leftAnchor),
      descriptionView.bottomAnchor.constraint(equalTo: bottomAnchor),
      descriptionView.rightAnchor.constraint(equalTo: safeAreaLayoutGuide.rightAnchor)
    ])

    NSLayoutConstraint.activate([
      contentView.topAnchor.constraint(equalTo: photosScrollView.topAnchor),
      contentView.rightAnchor.constraint(equalTo: photosScrollView.rightAnchor),
      contentView.bottomAnchor.constraint(equalTo: photosScrollView.bottomAnchor),
      contentView.leftAnchor.constraint(equalTo: photosScrollView.leftAnchor),
      contentView.heightAnchor.constraint(equalTo: photosScrollView.heightAnchor)
    ])

    NSLayoutConstraint.activate([
      stackView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
      stackView.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 16),
      stackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8),
      stackView.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -16)
    ])

    for view in stackView.arrangedSubviews {
      NSLayoutConstraint.activate([
        view.topAnchor.constraint(equalTo: stackView.topAnchor),
        view.bottomAnchor.constraint(equalTo: stackView.bottomAnchor),
        view.widthAnchor.constraint(equalToConstant: 250)
      ])
    }

    NSLayoutConstraint.activate([
      detailsStack.topAnchor.constraint(equalTo: descriptionView.safeAreaLayoutGuide.topAnchor, constant: 16),
      detailsStack.leftAnchor.constraint(equalTo: descriptionView.safeAreaLayoutGuide.leftAnchor, constant: 32),
      detailsStack.bottomAnchor.constraint(equalTo: descriptionView.safeAreaLayoutGuide.bottomAnchor),
      detailsStack.rightAnchor.constraint(equalTo: descriptionView.safeAreaLayoutGuide.rightAnchor, constant: -32)
    ])

    NSLayoutConstraint.activate([
      addToCartButton.heightAnchor.constraint(equalToConstant: 54)
    ])
  }
}
