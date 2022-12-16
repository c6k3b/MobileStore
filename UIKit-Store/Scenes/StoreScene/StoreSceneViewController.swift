import UIKit

protocol StoreSceneDisplayLogic: AnyObject {}

final class StoreSceneViewController: UIViewController, StoreSceneDisplayLogic {
  let interactor: StoreSceneBusinessLogic
  let router: StoreSceneRoutingLogic

  private lazy var titleStack: UIStackView = {
    $0.axis = .horizontal
    $0.addArrangedSubview(titleImage)
    $0.addArrangedSubview(titleLabel)
    return $0
  }(UIStackView())

  private let titleImage: UIImageView = {
    $0.image = Styles.Images.position
    $0.contentMode = .scaleAspectFit
    return $0
  }(UIImageView())

  private let titleLabel: UILabel = {
    $0.text = " Zihuatanejo, Gro"
    $0.font = UIFont(name: Styles.Fonts.medium, size: 15)
    $0.textColor = Styles.Colors.darkBlue
    return $0
  }(UILabel())

  private lazy var rightNavBarButton: UIButton = {
    $0.setImage(Styles.Images.filter, for: .normal)
    $0.addTarget(self, action: #selector(didFilterBarButtonTapped), for: .touchUpInside)
    return $0
  }(UIButton())

  private let homeView = StoreSceneView()
  private let filterView = FilterView()

  // MARK: - Initialization
  init(interactor: StoreSceneBusinessLogic, router: StoreSceneRoutingLogic) {
    self.interactor = interactor
    self.router = router
    super.init(nibName: nil, bundle: nil)
    setUp()
//  interactor.fetchHomeStore(HomeModels.Items.Request())
  }

  required init?(coder: NSCoder) { nil }
}

// MARK: - Private Methods
private extension StoreSceneViewController {
  func setUp() {
    navigationItem.titleView = titleStack
    navigationItem.rightBarButtonItem = UIBarButtonItem(customView: rightNavBarButton)

    view = homeView
    addTargets()
  }

  func addTargets() {
    homeView.menuFooterView.bagButton.addTarget(self, action: #selector(didBagButtonTapped), for: .touchUpInside)
    homeView.menuFooterView.likeButton.addTarget(self, action: #selector(didLikeButtonTapped), for: .touchUpInside)
    filterView.closeButton.addTarget(self, action: #selector(didFilterCloseButtonTapped), for: .touchUpInside)
    filterView.doneButton.addTarget(self, action: #selector(didFilterDoneButtonTapped), for: .touchUpInside)
  }
}

private extension StoreSceneViewController {
  @objc func didFilterBarButtonTapped() {
    view.insertSubview(filterView, at: 2)
  }

  @objc func didFilterCloseButtonTapped() {
    filterView.removeFromSuperview()
  }

  @objc func didFilterDoneButtonTapped() {
    filterView.removeFromSuperview()
  }

  @objc func didBagButtonTapped() {
    router.routeToBasket()
  }

  @objc func didLikeButtonTapped() {
    router.routeToDetails()
  }
}

// MARK: - Delegates
extension StoreSceneViewController: StoreSceneViewDelegate {}
