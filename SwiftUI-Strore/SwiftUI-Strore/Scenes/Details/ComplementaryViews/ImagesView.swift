//  ImagesView.swift
//  Created by aa on 12/21/22.

import SwiftUI

extension DetailsView {
    @ViewBuilder var imagesView: some View {
        let imagesURLs = viewModel.response.images ?? []

        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 24) {
                ForEach(imagesURLs, id: \.self) { imageURL in
                    ZStack {
                        Rectangle()
                            .cornerRadius(20)
                            .foregroundColor(Styles.Colors.white)
                            .padding(EdgeInsets(top: 40, leading: 10, bottom: 10, trailing: 10))
                            .shadow(color: Styles.Colors.shadow, radius: 20)

                        AsyncImage(
                            url: URL(string: imageURL)
                        ) { $0.resizable() } placeholder: {
                            ProgressView().progressViewStyle(.circular)
                        }
                        .padding(EdgeInsets(top: 40, leading: 20, bottom: 10, trailing: 20))
                        .scaledToFit()
                        .frame(width: 266, height: 335)
                        .cornerRadius(20)
                    }
                }
            }
        }
    }
}
