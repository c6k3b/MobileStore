//  RectangleButtonView.swift
//  Created by aa on 12/24/22.

import SwiftUI

struct RectangleButtonView: View {
    private let image: Image
    private let color: Color
    private let action: () -> Void

    init(image: Image, color: Color, action: @escaping (() -> Void)) {
        self.image = image
        self.color = color
        self.action = action
    }

    var body: some View {
        Button { action() } label: {
            ZStack {
                RoundedRectangle(cornerRadius: 10)
                    .fill(color)
                    .frame(width: 37, height: 37)

                image
                    .font(Font.custom(Styles.Fonts.bold, size: 14))
                    .foregroundColor(Styles.Colors.white)
            }
        }
    }
}
