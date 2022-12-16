import Foundation

protocol DetailsSceneBusinessLogic: AnyObject {
  func fetch(_ request: DetailsSceneModel.Request)
}

final class DetailsSceneInteractor: DetailsSceneBusinessLogic {
  private let presenter: DetailsScenePresentationLogic
  private let worker: DetailsSceneWorkerLogic

  init(presenter: DetailsScenePresentationLogic, worker: DetailsSceneWorkerLogic) {
    self.presenter = presenter
    self.worker = worker
  }

  func fetch(_ request: DetailsSceneModel.Request) {
    DispatchQueue.global(qos: .background).async { [weak self] in
      self?.worker.makeRequest {
        if let response = $0 {
          DispatchQueue.main.async {
            self?.presenter.presentItem(response)
          }
        }
      }
    }
  }
}
