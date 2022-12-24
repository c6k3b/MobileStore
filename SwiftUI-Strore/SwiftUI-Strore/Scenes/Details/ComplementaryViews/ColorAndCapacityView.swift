//  ColorAndCapacityView.swift
//  Created by aa on 12/20/22.

import SwiftUI

extension DetailsView {
    @ViewBuilder var colorAndCapacityView: some View {
        let ssd = viewModel.response.capacity ?? []
        let colors = viewModel.response.color ?? []

        VStack(alignment: .leading) {
            HStack {
                Text("Select color and capacity")
                    .font(Font.custom(Styles.Fonts.medium, size: 16))
                Spacer()
            }

            HStack {
                HStack {
                    ForEach(colors.indices, id: \.self) { index in
                        ZStack {
                            Circle()
                                .frame(width: 40, height: 40)
                                .foregroundColor(Color(uiColor: .init(hexString: colors[index]) ?? Styles.Colors.error))
                            if index == colorIndex {
                                Styles.Images.checkmark
                                    .font(Font.custom(Styles.Fonts.bold, size: 18))
                                    .foregroundColor(Styles.Colors.checkmark)
                            }
                        }
                        .onTapGesture { colorIndex = index }
                        .animation(.easeInOut, value: colorIndex)
                    }
                }
                Spacer()

                HStack {
                    ForEach(ssd.indices, id: \.self) { index in
                        Text(ssd[index] + " GB")
                            .font(Font.custom(Styles.Fonts.bold, size: 13))
                            .foregroundColor(index == ssdIndex ? Styles.Colors.white : Styles.Colors.grey)
                            .frame(width: 72, height: 30)
                            .background(index == ssdIndex ? Styles.Colors.orange : nil)
                            .cornerRadius(10)
                            .onTapGesture { ssdIndex = index }
                            .animation(.easeInOut, value: ssdIndex)
                    }
                }
            }
        }
    }
}
