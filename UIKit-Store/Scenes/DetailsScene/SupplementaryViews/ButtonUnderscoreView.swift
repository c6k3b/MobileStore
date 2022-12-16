import UIKit

class ButtonUnderscoreView: UIView {
  override init(frame: CGRect) {
    super.init(frame: frame)
    setUp()
  }

  required init?(coder: NSCoder) { nil }

  override var intrinsicContentSize: CGSize {
    return CGSize(width: UIView.noIntrinsicMetric, height: 1 / UIScreen.main.scale * 10)
  }
}

private extension ButtonUnderscoreView {
  func setUp() {
    backgroundColor = Styles.Colors.orange
  }
}
