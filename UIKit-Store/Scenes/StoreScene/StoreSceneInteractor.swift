import Foundation

protocol StoreSceneBusinessLogic: AnyObject {
  func fetch(_ request: StoreSceneModel.Request)
}

final class StoreSceneInteractor: StoreSceneBusinessLogic {
  private let presenter: StoreScenePresentationLogic
  private let worker: StoreSceneWorkerLogic

  init(presenter: StoreScenePresentationLogic, worker: StoreSceneWorkerLogic) {
    self.presenter = presenter
    self.worker = worker
  }

  func fetch(_ request: StoreSceneModel.Request) {
    DispatchQueue.global(qos: .background).async { [weak self] in
      self?.worker.makeRequest {
        if let response = $0 {
          DispatchQueue.main.async {
            self?.presenter.presentStore(response)
          }
        }
      }
    }
  }
}
