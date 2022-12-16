import UIKit

protocol DetailsScenePresentationLogic: AnyObject {
  func presentItem(_ response: DetailsSceneModel.Response)
}

final class DetailsScenePresenter: DetailsScenePresentationLogic {
  weak var viewController: DetailsSceneDisplayLogic?

  func presentItem(_ response: DetailsSceneModel.Response) {
  }
}
