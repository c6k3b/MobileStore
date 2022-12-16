//
//  testSceneInteractor.swift
//  UIKit-Store
//

import Foundation

protocol TestSceneInteractorInput {}

typealias TestSceneInteractorOutput = TestSceneInteractorInput

final class TestSceneInteractor {
    var presenter: TestScenePresenterInput?
}

extension TestSceneInteractor: TestSceneInteractorInput {}
