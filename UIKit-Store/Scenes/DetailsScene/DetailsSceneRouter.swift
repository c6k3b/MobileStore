import UIKit

protocol DetailsSceneRoutingLogic: AnyObject {
  func routeToHome()
  func routeToBasket()
}

final class DetailsSceneRouter: DetailsSceneRoutingLogic {
  weak var viewController: UIViewController?
  private let scenesFactory: ScenesFactory

  init(scenesFactory: ScenesFactory = DefaultScenesFactory()) {
    self.scenesFactory = scenesFactory
  }

  func routeToHome() {
    viewController?.navigationController?.popViewController(animated: true)
  }

  func routeToBasket() {
    let destinationVC = scenesFactory.build(scene: .basket)
    viewController?.navigationController?.pushViewController(destinationVC, animated: true)
  }
}
