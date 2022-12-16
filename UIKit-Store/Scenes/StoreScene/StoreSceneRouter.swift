import UIKit

protocol StoreSceneRoutingLogic: AnyObject {
  func routeToDetails()
  func routeToBasket()
}

final class StoreSceneRouter: StoreSceneRoutingLogic {
  weak var viewController: UIViewController?
  private let sceneFactory: ScenesFactory

  init(sceneFactory: ScenesFactory = DefaultScenesFactory()) {
    self.sceneFactory = sceneFactory
  }

  func routeToDetails() {
    let destinationVC = sceneFactory.build(scene: .details)
    viewController?.navigationController?.pushViewController(destinationVC, animated: true)
  }

  func routeToBasket() {
    let destinationVC = sceneFactory.build(scene: .basket)
    viewController?.navigationController?.pushViewController(destinationVC, animated: true)
  }
}
