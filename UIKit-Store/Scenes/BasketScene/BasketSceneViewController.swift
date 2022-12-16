import UIKit

protocol BasketSceneDisplayLogic: AnyObject {
  func displayBasket(_ viewModel: BasketSceneModel.ViewModel)
}

final class BasketSceneViewController: UIViewController, BasketSceneDisplayLogic {
  // MARK: - Stored Properties
  private let interactor: BasketSceneBusinessLogic
  private let router: BasketSceneRoutingLogic

  private var items: [BasketSceneModel.ViewModel.BasketItem] = []

  // MARK: - UI Components
  private lazy var leftNavBarButton: UIButton = {
    $0.layer.cornerRadius = 10
    $0.setImage(Styles.Images.navigationBack, for: .normal)
    $0.addTarget(self, action: #selector(didNavigationLeftBarButtonTapped), for: .touchUpInside)
    return $0
  }(UIButton())

  private lazy var rightNavBarButton: UIButton = {
    $0.layer.cornerRadius = 10
    $0.setImage(Styles.Images.navigationAddress, for: .normal)
    $0.addTarget(self, action: #selector(didNavigationRightBarButtonTapped), for: .touchUpInside)
    return $0
  }(UIButton())

  private let titleLabel: UILabel = {
    $0.font = UIFont(name: Styles.Fonts.medium, size: 15)
    $0.text = "Add Address"
    return $0
  }(UILabel())

  private let basketView = BasketSceneView()

  private lazy var table: UITableView = {
    $0.delegate = self
    $0.dataSource = self
    return $0
  }(basketView.cartItemsTable)

  // MARK: - Initialization
  init(interactor: BasketSceneBusinessLogic, router: BasketSceneRoutingLogic) {
    self.interactor = interactor
    self.router = router
    super.init(nibName: nil, bundle: nil)
    setUp()
    showItems()
  }

  required init?(coder: NSCoder) { nil }

  func displayBasket(_ viewModel: BasketSceneModel.ViewModel) {
    items = viewModel.items
    basketView.configure(with: viewModel.summary)
    table.reloadData()
  }
}

// MARK: - Private Methods
private extension BasketSceneViewController {
  func setUp() {
    navigationItem.titleView = titleLabel
    navigationItem.leftBarButtonItem = UIBarButtonItem(customView: leftNavBarButton)
    navigationItem.rightBarButtonItem = UIBarButtonItem(customView: rightNavBarButton)

    view = basketView
  }
}

private extension BasketSceneViewController {
  func showItems() {
    interactor.fetch(BasketSceneModel.Request())
  }

  @objc func didNavigationLeftBarButtonTapped() {
    router.routeToDetails()
  }

  @objc func didNavigationRightBarButtonTapped() {
  }
}

// MARK: - Delegates
extension BasketSceneViewController: BasketSceneViewDelegate {}

extension BasketSceneViewController: UITableViewDelegate {
  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat { 112 }
}

extension BasketSceneViewController: UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int { items.count }

  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let item = items[indexPath.item]

    guard let cell = tableView.dequeueReusableCell(
      withIdentifier: CartCell.identifier,
      for: indexPath
    ) as? ConfigurableCell else { return UITableViewCell() }

    cell.configure(with: item)
    return cell as? UITableViewCell ?? UITableViewCell()
  }
}
