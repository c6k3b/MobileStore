//  SwiftUIStoreApp.swift
//  Created by aa on 12/17/22.

import SwiftUI

@main
struct SwiftUIStoreApp: App {
    var body: some Scene {
        WindowGroup {
//            DetailsView(
//                viewModel: DetailsViewModel(
//                    service: WebService(),
//                    response: DetailsResponse()
//                )
//            )
            StoreView(
                viewModel: StoreViewModel(
                    service: WebService(),
                    response: StoreResponse()
                )
            )
        }
    }
}
