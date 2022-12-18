//  SwiftUI_StroreApp.swift
//  Created by aa on 12/17/22.

import SwiftUI

@main
struct SwiftUI_StroreApp: App {
    var body: some Scene {
        WindowGroup {
            StoreView(
                viewModel: StoreViewModel(
                    service: WebService(),
                    response: StoreResponse()
                )
            )
        }
    }
}
