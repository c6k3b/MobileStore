import Foundation

protocol BasketSceneBusinessLogic: AnyObject {
  func fetch(_ request: BasketSceneModel.Request)
}

final class BasketSceneInteractor: BasketSceneBusinessLogic {
  private let presenter: BasketScenePresentationLogic
  private let worker: BasketSceneWorkerLogic

  init(presenter: BasketScenePresentationLogic, worker: BasketSceneWorkerLogic) {
    self.presenter = presenter
    self.worker = worker
  }

  func fetch(_ request: BasketSceneModel.Request) {
    DispatchQueue.global(qos: .background).async { [weak self] in
      self?.worker.makeRequest {
        if let response = $0 {
          DispatchQueue.main.async {
            self?.presenter.presentBasket(response)
          }
        }
      }
    }
  }
}
