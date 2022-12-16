//
//  testSceneConfigurator.swift
//  UIKit-Store
//

import Foundation

protocol TestSceneConfigurator {
    func configured(_ viewController: TestSceneViewController) -> TestSceneViewController
}

final class DefaulttestSceneConfigurator: TestSceneConfigurator {
    func configured(_ viewController: TestSceneViewController) -> TestSceneViewController {
        let interactor = TestSceneInteractor()
        let presenter = TestScenePresenter()
        let router = TestSceneRouter()

        router.source = viewController
        presenter.viewController = viewController
        interactor.presenter = presenter
        viewController.interactor = interactor
        viewController.router = router

        return viewController
    }
}
