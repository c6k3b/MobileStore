import UIKit

enum BasketSceneAssembly {
  static func build() -> UIViewController {
    let presenter = BasketScenePresenter()
    let worker = BasketSceneWorker(service: NetworkManager())
    let interactor = BasketSceneInteractor(presenter: presenter, worker: worker)
    let router = BasketSceneRouter()
    let viewController = BasketSceneViewController(interactor: interactor, router: router)

    presenter.viewController = viewController
    router.viewController = viewController

    return viewController
  }
}
