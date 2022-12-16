import UIKit

protocol DetailsSceneDisplayLogic: AnyObject {}

final class DetailsSceneViewController: UIViewController, DetailsSceneDisplayLogic {
  // MARK: - Stored Properties
  let interactor: DetailsSceneBusinessLogic
  let router: DetailsSceneRoutingLogic

  // MARK: - UI Components
  private lazy var leftNavBarButton: UIButton = {
    $0.layer.cornerRadius = 10
    $0.setImage(Styles.Images.navigationBack, for: .normal)
    $0.addTarget(self, action: #selector(didNavigationLeftBarButtonTapped), for: .touchUpInside)
    return $0
  }(UIButton())

  private lazy var rightNavBarButton: UIButton = {
    $0.layer.cornerRadius = 10
    $0.setImage(Styles.Images.basket, for: .normal)
    $0.addTarget(self, action: #selector(didNavigationRightBarButtonTapped), for: .touchUpInside)
    return $0
  }(UIButton())

  private let titleLabel: UILabel = {
    $0.text = "Product Details"
    $0.font = UIFont(name: Styles.Fonts.medium, size: 18)
    return $0
  }(UILabel())

  private let detailsView = DetailsSceneView()

  // MARK: - Initialization
  init(interactor: DetailsSceneBusinessLogic, router: DetailsSceneRoutingLogic) {
    self.interactor = interactor
    self.router = router
    super.init(nibName: nil, bundle: nil)
    setUp()
  }

  required init?(coder: NSCoder) { nil }
}

// MARK: - Private Methods
private extension DetailsSceneViewController {
  func setUp() {
    navigationItem.titleView = titleLabel
    navigationItem.leftBarButtonItem = UIBarButtonItem(customView: leftNavBarButton)
    navigationItem.rightBarButtonItem = UIBarButtonItem(customView: rightNavBarButton)

    view = detailsView
  }
}

private extension DetailsSceneViewController {
  func showDetails() {
    interactor.fetch(DetailsSceneModel.Request())
  }

  @objc func didNavigationLeftBarButtonTapped() {
    router.routeToHome()
  }

  @objc func didNavigationRightBarButtonTapped() {
    router.routeToBasket()
  }
}

// MARK: - Delegates
extension DetailsSceneViewController: DetailsSceneViewDelegate {}
