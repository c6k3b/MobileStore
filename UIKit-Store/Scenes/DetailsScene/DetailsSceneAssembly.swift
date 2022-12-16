import UIKit

enum DetailsSceneAssembly {
  static func build() -> UIViewController {
    let presenter = DetailsScenePresenter()
    let worker = DetailsSceneWorker(service: NetworkManager())
    let interactor = DetailsSceneInteractor(presenter: presenter, worker: worker)
    let router = DetailsSceneRouter()
    let viewController = DetailsSceneViewController(interactor: interactor, router: router)

    presenter.viewController = viewController
    router.viewController = viewController

    return viewController
  }
}
