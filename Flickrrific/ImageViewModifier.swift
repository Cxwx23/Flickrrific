//
//  ImageViewModifier.swift
//  Flickrrific
//
//  Created by Cole Warner on 9/25/24.
//

import Foundation
import SwiftUI

struct ImageViewModifier: ViewModifier {
    
    var screenWidth: CGFloat {
        UIScreen.main.bounds.width
    }
    
    var frameWidth: CGFloat {
        (screenWidth - 40.0) / 3
    }
    
    var frameHeight: CGFloat {
        frameWidth
    }
    
    func body(content: Content) -> some View {
        content                            
            .aspectRatio(contentMode: .fill)
            .scaledToFill()
            .frame(width: frameWidth, height: frameHeight)
            .background(Color.black.opacity(0.3))
            .clipped()
            .cornerRadius(10)
            .shadow(
                color: .black.opacity(0.3),
                radius: 5,
                x: 0,
                y: 4)
    }
}

extension View {
    func imageFormatting() -> some View {
        modifier(ImageViewModifier())
    }
}
