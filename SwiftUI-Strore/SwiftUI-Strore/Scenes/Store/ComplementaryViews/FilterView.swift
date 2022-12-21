//  Filter.swift
//  Created by aa on 12/21/22.

import SwiftUI

extension StoreView {
    @ViewBuilder var filterView: some View {
        VStack(spacing: 16, content: {
            VStack(alignment: .leading, spacing: 8, content: {
                ForEach(options.indices, id: \.self) { index in
                    Text(options[index])
                        .font(Font.custom(Styles.Fonts.medium, size: 18))
                    DisclosureGroup(parameters[index], content: {})
                        .padding(EdgeInsets(top: 4, leading: 14, bottom: 4, trailing: 14))
                        .border(Styles.Colors.grey)
                        .cornerRadius(5)
                }
            })
        })
        .tint(Styles.Colors.grey)
        .font(Font.custom(Styles.Fonts.regular, size: 18))
    }
}

extension StoreView {
    @ViewBuilder var filterToolbar: some View {
        HStack(content: {
            Button(action: {
                withAnimation(.easeIn(duration: 0.8)) { isFilterPresented.toggle() }
            }, label: {
                Styles.Images.xmark
                    .frame(width: 37, height: 37)
                    .background(Styles.Colors.darkBlue)
                    .cornerRadius(10)
                    .frame(width: 37, height: 37, alignment: .leading)
            })
            Spacer()

            Text("Filter Options")
                .font(Font.custom(Styles.Fonts.medium, size: 18))
                .foregroundColor(Styles.Colors.darkBlue)
            Spacer()

            Button(action: {
                withAnimation(.easeIn(duration: 0.8)) { isFilterPresented.toggle() }
            }, label: {
                Text("Done")
                    .frame(width: 88, height: 37)
                    .background(Styles.Colors.orange)
                    .cornerRadius(10)
            })
        })
        .font(Font.custom(Styles.Fonts.medium, size: 18))
        .foregroundColor(Styles.Colors.white)
    }
}
