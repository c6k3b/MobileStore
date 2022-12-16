//
//  testSceneViewController.swift
//  UIKit-Store
//

import UIKit

protocol TestSceneViewControllerInput: AnyObject {}

typealias TestSceneViewControllerOutput = TestSceneInteractorInput

final class TestSceneViewController: UIViewController {
  var interactor: TestSceneViewControllerOutput?
  var router: TestSceneRoutingLogic?

  private let contentView: TestSceneView

  init(contentView: TestSceneView = DefaulttestSceneView()) {
    self.contentView = contentView
    super.init(nibName: nil, bundle: nil)
  }

  @available(*, unavailable)
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  override func viewDidLoad() {
    super.viewDidLoad()

    contentView.delegate = self
    self.view = contentView
  }
}

extension TestSceneViewController: TestSceneViewControllerInput {}

extension TestSceneViewController: TestSceneViewDelegate {}
