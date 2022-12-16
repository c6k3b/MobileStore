import UIKit

class FilterView: UIView {
  private lazy var stack: UIStackView = {
    $0.axis = .vertical
    $0.spacing = 16
    $0.translatesAutoresizingMaskIntoConstraints = false
    return $0
  }(UIStackView(arrangedSubviews: [menuStack, collectionView]))

  private lazy var menuStack: UIStackView = {
    $0.axis = .horizontal
    $0.distribution = .equalSpacing
    return $0
  }(UIStackView(arrangedSubviews: [closeButton, menuLabel, doneButton]))

  let closeButton: UIButton = {
    $0.layer.cornerRadius = 10
    $0.widthAnchor.constraint(equalToConstant: 37).isActive = true
    $0.backgroundColor = Styles.Colors.darkBlue
    $0.setImage(Styles.Images.xmark, for: .normal)
    return $0
  }(UIButton())

  private let menuLabel: UILabel = {
    $0.text = "Filter options"
    $0.textColor = Styles.Colors.darkBlue
    $0.font = UIFont(name: Styles.Fonts.medium, size: 18)
    return $0
  }(UILabel())

  let doneButton: UIButton = {
    $0.layer.cornerRadius = 10
    $0.widthAnchor.constraint(equalToConstant: 86).isActive = true
    $0.setTitle("Done", for: .normal)
    $0.setTitleColor(Styles.Colors.white, for: .normal)
    $0.titleLabel?.font = UIFont(name: Styles.Fonts.medium, size: 18)
    $0.backgroundColor = Styles.Colors.orange
    return $0
  }(UIButton())

  private let filterItem = FilterItem()
  private lazy var collectionView = UICollectionView(frame: bounds, collectionViewLayout: createLayout())
  private var dataSource: UICollectionViewDiffableDataSource<
    FilterItem.Filter, FilterItem.DataItem
  >! = nil

  override init(frame: CGRect) {
    super.init(frame: frame)
    setUp()
  }

  required init?(coder: NSCoder) { nil }

  override func layoutSubviews() {
    super.layoutSubviews()
    activateConstraints()
  }
}

private extension FilterView {
  func setUp() {
    layer.cornerRadius = 30
    layer.maskedCorners = [CACornerMask.layerMinXMinYCorner, CACornerMask.layerMaxXMinYCorner]
    layer.shadowColor = Styles.Colors.darkGrey.cgColor
    layer.shadowOpacity = 0.1
    layer.shadowOffset = .zero
    layer.shadowRadius = 10

    backgroundColor = Styles.Colors.white
    translatesAutoresizingMaskIntoConstraints = false

    addSubview(stack)
    configureDataSource()
  }
}

private extension FilterView {
  func createLayout() -> UICollectionViewLayout {
    return UICollectionViewCompositionalLayout {
      (_, layoutEnvironment) in
      var config = UICollectionLayoutListConfiguration(appearance: .grouped)
      config.headerMode = .supplementary
      config.backgroundColor = Styles.Colors.white

      self.collectionView.tintColor = Styles.Colors.filtersGray
      self.collectionView.showsVerticalScrollIndicator = false

      return NSCollectionLayoutSection.list(
        using: config, layoutEnvironment: layoutEnvironment
      )
    }
  }

  func configureDataSource() {
    let headerRegistration = UICollectionView.SupplementaryRegistration<FilterListHeaderView>(
      elementKind: UICollectionView.elementKindSectionHeader
    ) {
      [weak self] (headerView, _, indexPath) in
      let headerItem = self?.dataSource.snapshot().sectionIdentifiers[indexPath.section]
      headerView.label.text = headerItem?.title
    }

    let headerCellRegistration = UICollectionView.CellRegistration<
      UICollectionViewListCell, FilterItem.Filter
    > {
      (cell, _, item) in
      cell.layer.cornerRadius = 5
      cell.layer.borderWidth = 1
      cell.layer.borderColor = Styles.Colors.filtersGray.cgColor

      var content = cell.defaultContentConfiguration()
      content.text = item.options[0].title
      content.textProperties.font = UIFont(name: Styles.Fonts.medium, size: 18)!

      cell.contentConfiguration = content

      cell.accessories = [.outlineDisclosure(options: UICellAccessory.OutlineDisclosureOptions(style: .header))
      ]
    }

    let cellRegistration = UICollectionView.CellRegistration<
      UICollectionViewListCell, FilterItem.Option
    > {
      (cell, _, item) in
      var content = cell.defaultContentConfiguration()
      content.text = item.title
      content.textProperties.font = UIFont(name: Styles.Fonts.medium, size: 18)!

      cell.contentConfiguration = content
    }

    dataSource = UICollectionViewDiffableDataSource<
      FilterItem.Filter, FilterItem.DataItem
    >(collectionView: collectionView) {
      (collectionView, indexPath, listItem) -> UICollectionViewCell? in
      switch listItem {
        case .filter(let filter):
          let cell = collectionView.dequeueConfiguredReusableCell(
            using: headerCellRegistration, for: indexPath, item: filter
          )
          return cell
        case .option(let option):
          let cell = collectionView.dequeueConfiguredReusableCell(
            using: cellRegistration, for: indexPath, item: option
          )
          return cell
      }
    }

    dataSource.supplementaryViewProvider = { [weak self]
      (_, _, indexPath) -> UICollectionReusableView? in
      return self?.collectionView.dequeueConfiguredReusableSupplementary(
        using: headerRegistration, for: indexPath
      )
    }

    for filter in filterItem.filters {
      var sectionSnapshot = NSDiffableDataSourceSectionSnapshot<FilterItem.DataItem>()

      let filterDataItem = FilterItem.DataItem.filter(filter)
      sectionSnapshot.append([filterDataItem])

      let optionsDataItemArray = filter.options.map { FilterItem.DataItem.option($0) }
      sectionSnapshot.append(optionsDataItemArray, to: filterDataItem)

      dataSource.apply(sectionSnapshot, to: filter, animatingDifferences: false)
    }
  }
}

private extension FilterView {
  func activateConstraints() {
    if let superview = superview {
      NSLayoutConstraint.activate([
        leftAnchor.constraint(equalTo: superview.safeAreaLayoutGuide.leftAnchor),
        bottomAnchor.constraint(equalTo: superview.bottomAnchor),
        rightAnchor.constraint(equalTo: superview.safeAreaLayoutGuide.rightAnchor),
        heightAnchor.constraint(equalToConstant: superview.bounds.height * 0.4)
      ])
    }

    NSLayoutConstraint.activate([
      stack.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 24),
      stack.leftAnchor.constraint(equalTo: safeAreaLayoutGuide.leftAnchor, constant: 32),
      stack.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor),
      stack.rightAnchor.constraint(equalTo: safeAreaLayoutGuide.rightAnchor, constant: -32)
    ])
  }
}
