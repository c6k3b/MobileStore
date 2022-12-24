//  ButtonView.swift
//  Created by aa on 12/24/22.

import SwiftUI

struct ButtonView: View {
    private let text: String
    private let action: () -> Void

    init(text: String, action: @escaping () -> Void) {
        self.text = text
        self.action = action
    }

    var body: some View {
        Button { action() } label: {
            HStack {
                Text(text)
            }
            .font(Font.custom(Styles.Fonts.bold, size: 20))
            .frame(maxWidth: .infinity, minHeight: 54)
            .foregroundColor(Styles.Colors.white)
            .background(Styles.Colors.orange)
            .cornerRadius(10)
        }
    }
}
