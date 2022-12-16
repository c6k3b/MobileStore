import UIKit

class TechDetailsStack: UIStackView {
  private lazy var processorStack: UIStackView = {
    $0.axis = .vertical
    $0.alignment = .center
    $0.distribution = .fillEqually
    $0.spacing = 5
    return $0
  }(UIStackView(arrangedSubviews: [processorImage, processorLabel]))

  private let processorImage: UIImageView = {
    $0.image = Styles.Images.processor
    $0.contentMode = .scaleAspectFit
    return $0
  }(UIImageView())

  let processorLabel: UILabel = {
    $0.text = "Exynos 990"
    $0.font = UIFont(name: Styles.Fonts.regular, size: 11)
    $0.textColor = Styles.Colors.buttonInactive
    return $0
  }(UILabel())

  private lazy var cameraStack: UIStackView = {
    $0.axis = .vertical
    $0.alignment = .center
    $0.distribution = .fillEqually
    $0.spacing = 5
    return $0
  }(UIStackView(arrangedSubviews: [cameraImage, cameraLabel]))

  private let cameraImage: UIImageView = {
    $0.image = Styles.Images.camera
    $0.contentMode = .scaleAspectFit
    return $0
  }(UIImageView())

  let cameraLabel: UILabel = {
    $0.text = "108 + 12mp"
    $0.font = UIFont(name: Styles.Fonts.regular, size: 11)
    $0.textColor = Styles.Colors.buttonInactive
    return $0
  }(UILabel())

  private lazy var ramStack: UIStackView = {
    $0.axis = .vertical
    $0.alignment = .center
    $0.distribution = .fillEqually
    $0.spacing = 5
    return $0
  }(UIStackView(arrangedSubviews: [ramImage, ramLabel]))

  private let ramImage: UIImageView = {
    $0.image = Styles.Images.ram
    $0.contentMode = .scaleAspectFit
    return $0
  }(UIImageView())

  let ramLabel: UILabel = {
    $0.text = "8 GB"
    $0.font = UIFont(name: Styles.Fonts.regular, size: 11)
    $0.textColor = Styles.Colors.buttonInactive
    return $0
  }(UILabel())

  private lazy var ssdStack: UIStackView = {
    $0.axis = .vertical
    $0.alignment = .center
    $0.distribution = .fillEqually
    $0.spacing = 5
    return $0
  }(UIStackView(arrangedSubviews: [ssdImage, ssdLabel]))

  private let ssdImage: UIImageView = {
    $0.image = Styles.Images.ssd
    $0.contentMode = .scaleAspectFit
    return $0
  }(UIImageView())

  let ssdLabel: UILabel = {
    $0.text = "256 GB"
    $0.font = UIFont(name: Styles.Fonts.regular, size: 11)
    $0.textColor = Styles.Colors.buttonInactive
    return $0
  }(UILabel())

  override init(frame: CGRect) {
    super.init(frame: frame)
    setUp()
  }

  required init(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}

private extension TechDetailsStack {
  func setUp() {
    axis = .horizontal
    distribution = .fillEqually
    spacing = 16
    addArrangedSubview(processorStack)
    addArrangedSubview(cameraStack)
    addArrangedSubview(ramStack)
    addArrangedSubview(ssdStack)
  }
}
