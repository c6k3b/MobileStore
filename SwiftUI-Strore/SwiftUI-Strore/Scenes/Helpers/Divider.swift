//  Divider.swift
//  Created by aa on 12/24/22.

import SwiftUI

struct Divider: ViewModifier {
    func body(content: Content) -> some View {
        return content
            .foregroundColor(Styles.Colors.white).opacity(0.3)
            .frame(height: 1)
    }
}
