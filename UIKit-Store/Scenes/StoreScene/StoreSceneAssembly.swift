import UIKit

enum StoreSceneAssembly {
  static func build() -> UIViewController {
    let presenter = StoreScenePresenter()
    let worker = StoreSceneWorker(service: NetworkManager())
    let interactor = StoreSceneInteractor(presenter: presenter, worker: worker)
    let router = StoreSceneRouter()
    let viewController = StoreSceneViewController(interactor: interactor, router: router)

    presenter.viewController = viewController
    router.viewController = viewController

    return viewController
  }
}
