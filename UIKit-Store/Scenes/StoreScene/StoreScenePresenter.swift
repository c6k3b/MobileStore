import UIKit

protocol StoreScenePresentationLogic: AnyObject {
  func presentStore(_ response: StoreSceneModel.Response)
}

final class StoreScenePresenter: StoreScenePresentationLogic {
  weak var viewController: StoreSceneDisplayLogic?

  func presentStore(_ response: StoreSceneModel.Response) {
  }
}
