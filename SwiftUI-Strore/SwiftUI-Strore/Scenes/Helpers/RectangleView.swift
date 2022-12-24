//  RectangleView.swift
//  Created by aa on 12/24/22.

import SwiftUI

struct RectangleView: View {
    private let color: Color

    init(color: Color) {
        self.color = color
    }

    var body: some View {
        Rectangle()
            .cornerRadius(30, corners: [.topLeft, .topRight])
            .foregroundColor(color)
            .edgesIgnoringSafeArea([.bottom])
            .frame(width: UIScreen.main.bounds.width)
            .shadow(color: Styles.Colors.shadow, radius: 20)
    }
}
