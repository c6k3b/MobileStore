//  Extensions.swift
//  Created by aa on 12/18/22.

import SwiftUI

// MARK: - Binding
extension Binding {
    func map<T>(get: @escaping (Value) -> T?, set: @escaping (T?) -> Value) -> Binding<T?> {
        Binding<T?>(get: { get(wrappedValue) }, set: { wrappedValue = set($0) })
    }
}
