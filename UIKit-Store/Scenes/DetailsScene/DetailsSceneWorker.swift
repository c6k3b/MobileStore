import Foundation

protocol DetailsSceneWorkerLogic: AnyObject {
  typealias Response = DetailsSceneModel.Response
  func makeRequest(completion: @escaping (Response?) -> Void)
}

final class DetailsSceneWorker: DetailsSceneWorkerLogic {
  private let service: NetworkServiceLogic

  init(service: NetworkServiceLogic) {
    self.service = service
  }

  func makeRequest(completion: @escaping (Response?) -> Void) {
    service.getData(Response.self, for: .details) {
      switch $0 {
        case .success(let data): completion(data)
        case .failure(let error): print(error)
      }
    }
  }
}
