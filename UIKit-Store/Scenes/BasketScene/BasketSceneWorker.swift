import Foundation

protocol BasketSceneWorkerLogic: AnyObject {
  typealias Response = BasketSceneModel.Response
  func makeRequest(completion: @escaping (Response?) -> Void)
}

final class BasketSceneWorker: BasketSceneWorkerLogic {
  private let service: NetworkServiceLogic

  init(service: NetworkServiceLogic) {
    self.service = service
  }

  func makeRequest(completion: @escaping (Response?) -> Void) {
    service.getData(Response.self, for: .basket) {
      switch $0 {
        case .success(let data): completion(data)
        case .failure(let error): print(error)
      }
    }
  }
}
