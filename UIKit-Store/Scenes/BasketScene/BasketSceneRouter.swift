import UIKit

protocol BasketSceneRoutingLogic: AnyObject {
  func routeToDetails()
}

final class BasketSceneRouter: BasketSceneRoutingLogic {
  weak var viewController: UIViewController?

  func routeToDetails() {
    viewController?.navigationController?.popToRootViewController(animated: true)
  }
}
