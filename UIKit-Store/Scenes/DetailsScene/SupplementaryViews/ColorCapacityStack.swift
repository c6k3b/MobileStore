import UIKit

class ColorCapacityStack: UIStackView {
  private lazy var colorStack: UIStackView = {
    axis = .horizontal
    return $0
  }(UIStackView(arrangedSubviews: [colorButtonBrown, colorButtonDarkBlue]))

  let colorButtonBrown: UIButton = {
    $0.layer.cornerRadius = 20
    $0.heightAnchor.constraint(equalToConstant: 40).isActive = true
    $0.widthAnchor.constraint(equalToConstant: 40).isActive = true
    $0.backgroundColor = .brown
    $0.setImage(Styles.Images.checkmark, for: .selected)
    $0.isSelected = true
    return $0
  }(UIButton())

  let colorButtonDarkBlue: UIButton = {
    $0.layer.cornerRadius = 20
    $0.heightAnchor.constraint(equalToConstant: 40).isActive = true
    $0.widthAnchor.constraint(equalToConstant: 40).isActive = true
    $0.backgroundColor = Styles.Colors.darkBlue
    $0.setImage(Styles.Images.checkmark, for: .selected)
    $0.isSelected = false
    return $0
  }(UIButton())

  private lazy var ssdCapasity: UIStackView = {
    $0.axis = .horizontal
    return $0
  }(UIStackView(arrangedSubviews: [capacutyButton1, capacutyButton2]))

  let capacutyButton1: UIButton = {
    $0.layer.cornerRadius = 10
    $0.widthAnchor.constraint(equalToConstant: 72).isActive = true
    $0.setTitle("128 GB", for: .normal)
    $0.setTitleColor(Styles.Colors.white, for: .selected)
    $0.setTitleColor(Styles.Colors.darkGrey, for: .normal)
    $0.backgroundColor = Styles.Colors.orange
    $0.titleLabel?.font = UIFont(name: Styles.Fonts.bold, size: 13)
    $0.isSelected = true
    return $0
  }(UIButton())

  let capacutyButton2: UIButton = {
    $0.layer.cornerRadius = 10
    $0.widthAnchor.constraint(equalToConstant: 72).isActive = true
    $0.setTitle("256 GB", for: .normal)
    $0.titleLabel?.font = UIFont(name: Styles.Fonts.bold, size: 13)
    $0.setTitleColor(Styles.Colors.white, for: .selected)
    $0.setTitleColor(Styles.Colors.iconGrey, for: .normal)
    $0.isSelected = false
    return $0
  }(UIButton())

  override init(frame: CGRect) {
    super.init(frame: frame)
    setUp()
  }

  required init(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}

private extension ColorCapacityStack {
  func setUp() {
    axis = .horizontal
    spacing = 16
    addArrangedSubview(colorStack)
    addArrangedSubview(ssdCapasity)
  }
}
