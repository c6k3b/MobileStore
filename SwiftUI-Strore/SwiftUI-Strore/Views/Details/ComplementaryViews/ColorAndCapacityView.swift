//  ColorAndCapacityView.swift
//  Created by aa on 12/20/22.

import SwiftUI

extension DetailsView {
    @ViewBuilder var colorAndCapacityView: some View {
        VStack(alignment: .leading, content: {
            HStack(content: {
                Text("Select color and capacity")
                    .font(Font.custom(Style.Fonts.medium, size: 16))
                Spacer()
            })

            HStack(content: {
                HStack(content: {
                    Circle()
                        .frame(width: 40, height: 40)
                        .foregroundColor(Style.Colors.orange)

                    Circle()
                        .frame(width: 40, height: 40)
                        .foregroundColor(Style.Colors.orange)
                })
                Spacer()

                HStack(content: {
                    Button(action: {
                    }, label: {
                        Text("Done")
                            .font(Font.custom(Style.Fonts.bold, size: 13))
                            .foregroundColor(Style.Colors.white)
                            .frame(width: 72, height: 30)
                            .background(Style.Colors.orange)
                            .cornerRadius(10)
                    })

                    Button(action: {
                    }, label: {
                        Text("Done")
                            .font(Font.custom(Style.Fonts.bold, size: 13))
                            .foregroundColor(Style.Colors.white)
                            .frame(width: 72, height: 30)
                            .background(Style.Colors.orange)
                            .cornerRadius(10)
                    })
                })
            })
        })
    }
}
