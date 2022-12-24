//  SectionHeaderView.swift
//  Created by aa on 12/24/22.

import SwiftUI

struct SectionHeaderView: View {
    private let label: String
    private let sublabel: String

    init(label: String, sublabel: String) {
        self.label = label
        self.sublabel = sublabel
    }

    var body: some View {
        HStack {
            Text(label)
                .font(Font.custom(Styles.Fonts.bold, size: 25))
            Spacer()

            Button {} label: {
                Text(sublabel)
                    .font(Font.custom(Styles.Fonts.regular, size: 15))
                    .foregroundColor(Styles.Colors.orange)
            }
        }
    }
}
