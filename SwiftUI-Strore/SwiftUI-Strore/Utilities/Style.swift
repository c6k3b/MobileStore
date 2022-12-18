import SwiftUI

enum Style {
    enum Colors {
        static let background = UIColor(hex: 0xf8f8f8)
        static let buttonInactive = UIColor(hex: 0x000000, alpha: 0.5)
        static let carouselBackgroundInactive = UIColor(hex: 0xd4d4d4)
        static let checkmark = UIColor(hex: 0xfafafa)
        static let darkBlue = Color("DarkBlue")
        static let darkGrey = UIColor(hex: 0x282843)
        static let filtersGray = UIColor(hex: 0xdcdcdc)
        static let iconGrey = UIColor(hex: 0xb7b7b7)
        static let labelInactive = UIColor(hex: 0x8d8d8d)
        static let orange = Color("Orange")
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
        static let basket = Image("BasketButton")
        static let bin = UIImage(named: "Bin")
        static let navigationBack = Image("BackButton")
        static let navigationAddress = Image("AddressButton")
        static let filter = Image("Filter")
        static let pin = Image("Pin")
        static let searchButton = Image("SearchButton")

        static let star = UIImage(systemName: "star.fill")
        static let heart = UIImage(systemName: "heart")
        static let checkmark = UIImage(systemName: "checkmark")
        static let person = UIImage(systemName: "person")
        static let bag = UIImage(systemName: "bag")
        static let xmark = UIImage(systemName: "xmark")
        static let magnifyingGlass = Image(systemName: "magnifyingglass")
        static let chevronDown = Image(systemName: "chevron.down")

        static let processor = UIImage(named: "Processor")
        static let camera = UIImage(named: "Camera")
        static let ram = UIImage(named: "Ram")
        static let ssd = UIImage(named: "Ssd")
    }
}
