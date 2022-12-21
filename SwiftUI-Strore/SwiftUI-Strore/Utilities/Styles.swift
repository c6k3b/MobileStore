import SwiftUI

enum Styles {
    enum Colors {
        static let error = UIColor(.pink)

        static let background = Color(uiColor: UIColor(hexString: "#F8F8F8") ?? Colors.error)
        static let checkmark = Color(uiColor: UIColor(hexString: "#FAFAFA") ?? Colors.error)
        static let darkBlue = Color(uiColor: UIColor(hexString: "#010035") ?? Colors.error)
        static let grey = Color(uiColor: UIColor(hexString: "#B7B7B7") ?? Colors.error)
        static let orange = Color(uiColor: UIColor(hexString: "#FF6E4E") ?? Colors.error)
        static let shadow = Color(uiColor: UIColor(hexString: "#A7ABC9", alpha: 0.15) ?? Colors.error)
        static let yellow = Color(uiColor: UIColor(hexString: "#FFB800") ?? Colors.error)
        static let white = Color.white
    }

    enum Fonts {
        static let bold = "MarkPro-Bold"
        static let medium = "MarkPro-Medium"
        static let regular = "MarkPro-Regular"
    }

    enum Images {
        static let basket = Image("BasketButton")
        static let bin = Image("Bin")
        static let navigationBack = Image("BackButton")
        static let navigationAddress = Image("AddressButton")
        static let filter = Image("Filter")
        static let pin = Image("Pin")
        static let searchButton = Image("SearchButton")

        static let star = Image(systemName: "star.fill")
        static let heart = Image(systemName: "heart")
        static let heartFill = Image(systemName: "heart.fill")
        static let checkmark = Image(systemName: "checkmark")
        static let person = Image(systemName: "person")
        static let bag = Image(systemName: "bag")
        static let xmark = Image(systemName: "xmark")
        static let magnifyingGlass = Image(systemName: "magnifyingglass")
        static let chevronDown = Image(systemName: "chevron.down")
    }
}
