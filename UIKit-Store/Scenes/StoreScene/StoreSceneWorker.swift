import Foundation

protocol StoreSceneWorkerLogic: AnyObject {
  typealias Response = StoreSceneModel.Response
  func makeRequest(completion: @escaping (Response?) -> Void)
}

final class StoreSceneWorker: StoreSceneWorkerLogic {
  private let service: NetworkServiceLogic

  init(service: NetworkServiceLogic) {
    self.service = service
  }

  func makeRequest(completion: @escaping (Response?) -> Void) {
    service.getData(Response.self, for: .store) {
      switch $0 {
        case .success(let data): completion(data)
        case .failure(let error): print(error)
      }
    }
  }
}
