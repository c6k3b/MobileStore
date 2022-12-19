import SwiftUI

enum Style {
    enum Colors {
        static let background = Color("Background")
        static let buttonInactive = Color("ButtonInactive")
        static let carouselBackgroundInactive = Color("CarouselBackgroundInactive")
        static let checkmark = Color("Checkmark")
        static let darkBlue = Color("DarkBlue")
        static let darkGrey = Color("DarkGrey")
        static let filtersGray = Color("FiltersGray")
        static let iconGrey = Color("IconGrey")
        static let labelInactive = Color("LabelInactive")
        static let orange = Color("Orange")
        static let shadowCategories = Color("CategoriesShadow")
        static let shadowSearch = Color("SearchShadow")
        static let shadowFavorites = Color("FavoritesShadow")
        static let shadowBestSellerCard = Color("BestSellerShadow")
        static let yellow = Color("Yellow")
        static let white = Color.white
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
        static let bin = Image("Bin")
        static let navigationBack = Image("BackButton")
        static let navigationAddress = Image("AddressButton")
        static let filter = Image("Filter")
        static let pin = Image("Pin")
        static let searchButton = Image("SearchButton")

        static let star = Image(systemName: "star.fill")
        static let heart = Image(systemName: "heart")
        static let heartFilled = Image(systemName: "heart.filled")
        static let checkmark = Image(systemName: "checkmark")
        static let person = Image(systemName: "person")
        static let bag = Image(systemName: "bag")
        static let xmark = Image(systemName: "xmark")
        static let magnifyingGlass = Image(systemName: "magnifyingglass")
        static let chevronDown = Image(systemName: "chevron.down")

        static let processor = Image("Processor")
        static let camera = Image("Camera")
        static let ram = Image("Ram")
        static let ssd = Image("Ssd")

        static let phones = Image("Phones")
        static let computer = Image("Computer")
        static let health = Image("Health")
        static let books = Image("Books")

    }
}
