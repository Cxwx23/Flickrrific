//
//  Title.swift
//  Flickrrific
//
//  Created by Cole Warner on 9/25/24.
//

import SwiftUI

struct Title: View {
    var body: some View {
        Text("Flickrrific")
            .font(.largeTitle)
            .fontWeight(.semibold)
            .shadow(color: .black.opacity(0.3), radius: 10, x: 0, y: 5)
    }
}

#Preview {
    Title()
}
