//  CategoryView.swift
//  Created by aa on 12/18/22.

import SwiftUI

extension StoreView {
    @ViewBuilder var categoryView: some View {
        Section(content: {
            Text("Phones")
        }, header: {
            Text("Select Category")
        })
    }
}
