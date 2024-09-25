//
//  DetailImageViewModifier.swift
//  Flickrrific
//
//  Created by Cole Warner on 9/25/24.
//

import SwiftUI

struct DetailImageViewModifier: ViewModifier {
    var screenWidth: CGFloat {
        UIScreen.main.bounds.width
    }
    
    var frameWidth: CGFloat {
        screenWidth - 20.0
    }
    
    var frameHeight: CGFloat {
        frameWidth
    }
    
    func body(content: Content) -> some View {
        content
            .aspectRatio(contentMode: .fill)
            .scaledToFill()
            .frame(maxWidth: .infinity, maxHeight: 300)
            .background(Color.black.opacity(0.3))
            .clipped()
            .cornerRadius(10)
            .shadow(
                color: .black.opacity(0.3),
                radius: 5,
                x: 0,
                y: 4)
            .padding()
    }
}

extension View {
    func detailImageViewModifier() -> some View {
        modifier(DetailImageViewModifier())
    }
}
