//
//  testSceneView.swift
//  UIKit-Store
//

import UIKit

protocol TestSceneViewDelegate: AnyObject {}

protocol TestSceneView: UIView {
    var delegate: TestSceneViewDelegate? { get set }
}

final class DefaulttestSceneView: UIView, TestSceneView {
    weak var delegate: TestSceneViewDelegate?

    init() {
        super.init(frame: .zero)
        setupUI()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: UI setup
private extension DefaulttestSceneView {
    func setupUI() {}
}
