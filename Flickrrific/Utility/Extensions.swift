//
//  Extensions.swift
//  Flickrrific
//
//  Created by Cole Warner on 9/25/24.
//

import Foundation

extension String {
    func removeHTMLTags() -> String {
        guard let data = self.data(using: .utf8) else { return self }
        
        // Convert the HTML string to an NSAttributedString
        if let attributedString = try? NSAttributedString(
            data: data,
            options: [
                .documentType: NSAttributedString.DocumentType.html,
                .characterEncoding: String.Encoding.utf8.rawValue
            ],
            documentAttributes: nil) {
            
            // Return the plain string from NSAttributedString
            return attributedString.string
        } else {
            
            // If the conversion fails, return the original string
            return self
        }
    }
}

