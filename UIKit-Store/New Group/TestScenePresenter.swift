//
//  testScenePresenter.swift
//  UIKit-Store
//

import UIKit

protocol TestScenePresenterInput {
}

typealias TestScenePresenterOutput = TestSceneViewControllerInput

final class TestScenePresenter {
  weak var viewController: TestScenePresenterOutput?
}

extension TestScenePresenter: TestScenePresenterInput {}
