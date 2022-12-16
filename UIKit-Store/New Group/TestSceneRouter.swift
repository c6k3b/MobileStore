//
//  testSceneRouter.swift
//  UIKit-Store
//

import UIKit

protocol TestSceneRoutingLogic {}

final class TestSceneRouter: NSObject {
    weak var source: UIViewController?
}

extension TestSceneRouter: TestSceneRoutingLogic {}
