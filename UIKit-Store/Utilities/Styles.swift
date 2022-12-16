import UIKit

enum Styles {
    enum Colors {
        static let background = UIColor(hex: 0xf8f8f8)
        static let buttonInactive = UIColor(hex: 0x000000, alpha: 0.5)
        static let carouselBackgroundInactive = UIColor(hex: 0xd4d4d4)
        static let checkmark = UIColor(hex: 0xfafafa)
        static let darkBlue = UIColor(hex: 0x010035)
        static let darkGrey = UIColor(hex: 0x282843)
        static let filtersGray = UIColor(hex: 0xdcdcdc)
        static let iconGrey = UIColor(hex: 0xb7b7b7)
        static let labelInactive = UIColor(hex: 0x8d8d8d)
        static let orange = UIColor(hex: 0xff6e4e)
        static let yellow = UIColor(hex: 0xffb800)
        static let white = UIColor.white
    }

    enum Fonts {
        static let heavy = "MarkPro-Heavy"
        static let bold = "MarkPro-Bold"
        static let medium = "MarkPro-Medium"
        static let regular = "MarkPro-Regular"
        static let extraLight = "MarkPro-ExtraLight"
    }

    enum Images {
        static let basket = UIImage(named: "BasketButton")
        static let bin = UIImage(named: "Bin")
        static let navigationBack = UIImage(named: "BackButton")
        static let navigationAddress = UIImage(named: "AddressButton")
        static let filter = UIImage(named: "Filter")
        static let position = UIImage(named: "Position")
        static let searchButton = UIImage(named: "SearchButton")

        static let star = UIImage(systemName: "star.fill")!
            .withTintColor(Colors.yellow, renderingMode: .alwaysOriginal)
        static let heart = UIImage(systemName: "heart")!
            .withTintColor(Colors.white, renderingMode: .alwaysOriginal)
        static let checkmark = UIImage(systemName: "checkmark")!
            .withTintColor(Colors.white, renderingMode: .alwaysOriginal)
        static let person = UIImage(systemName: "person")!
            .withTintColor(Colors.white, renderingMode: .alwaysOriginal)
        static let bag = UIImage(systemName: "bag")!
            .withTintColor(Colors.white, renderingMode: .alwaysOriginal)
        static let xmark = UIImage(systemName: "xmark")!
            .withTintColor(Colors.white, renderingMode: .alwaysOriginal)
        static let magnifyingGlass = UIImage(systemName: "magnifyingglass")!
            .withTintColor(Colors.orange, renderingMode: .alwaysOriginal)

        static let processor = UIImage(named: "Processor")
        static let camera = UIImage(named: "Camera")
        static let ram = UIImage(named: "Ram")
        static let ssd = UIImage(named: "Ssd")
    }
}
