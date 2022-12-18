//  Extensions.swift
//  Created by aa on 12/18/22.

import SwiftUI

// MARK: - Binding
extension Binding {
    func map<T>(get: @escaping (Value) -> T?, set: @escaping (T?) -> Value) -> Binding<T?> {
        Binding<T?>(get: { get(wrappedValue) }, set: { wrappedValue = set($0) })
    }
}

// MARK: - UIColor
extension UIColor {
    convenience init (hex: Int, alpha: CGFloat = 1.0) {
        let red = CGFloat((hex >> 16) & 0xff) / 255
        let green = CGFloat((hex >> 08) & 0xff) / 255
        let blue = CGFloat((hex >> 00) & 0xff) / 255
        self.init(red: red, green: green, blue: blue, alpha: alpha)
    }
}
