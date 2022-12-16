import UIKit

protocol BasketScenePresentationLogic: AnyObject {
  func presentBasket(_ response: BasketSceneModel.Response)
}

final class BasketScenePresenter: BasketScenePresentationLogic {
  weak var viewController: BasketSceneDisplayLogic?

  private var presentedItems: [BasketSceneModel.ViewModel.BasketItem] = []
  private var itemsSummary: BasketSceneModel.ViewModel.Summary?

  func presentBasket(_ response: BasketSceneModel.Response) {
    for item in response.basket {
      let presentedItem = BasketSceneModel.ViewModel.BasketItem(
        image: item.images,
        description: item.title,
        price: String(item.price)
      )
      presentedItems.append(presentedItem)
    }

    itemsSummary = BasketSceneModel.ViewModel.Summary(
      total: String(response.total),
      delivery: response.delivery
    )

    let viewModel = BasketSceneModel.ViewModel(
      items: presentedItems,
      summary: itemsSummary ?? BasketSceneModel.ViewModel.Summary(total: "", delivery: "")
    )
    viewController?.displayBasket(viewModel)
  }
}
