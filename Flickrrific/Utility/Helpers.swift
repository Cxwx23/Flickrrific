//
//  Helpers.swift
//  Flickrrific
//
//  Created by Cole Warner on 9/25/24.
//

import Foundation

class Helpers {
    static let shared = Helpers()
    private init() {}
    
    //  Gets the date in the ISO8601 format and sets the date and time styles to .short
    func formatDate(_ dateString: String) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        if let date = formatter.date(from: dateString) {
            formatter.dateStyle = .short
            formatter.timeStyle = .short
            return formatter.string(from: date)
        }
        return "N/A"
    }
    
    //  Removes all characters not in the username from the author
    func usernameCleanup(author: String) -> String {
        let username = author
            .replacingOccurrences(of: "nobody@flickr.com (\"", with: "")
            .replacingOccurrences(of: "\")", with: "")
            .replacingOccurrences(of: "(", with: "")
            .replacingOccurrences(of: ")", with: "")
            .capitalized
        return username
    }
    
    //  Gets the image size from the HTML
    func getImageSize(from html: String?) -> String? {
        guard let html = html else { return nil }
        
        // Regex pattern to extract width and height from the image tag
        let pattern = "<img[^>]*width=\"(\\d+)\"[^>]*height=\"(\\d+)\""
        guard let regex = try? NSRegularExpression(pattern: pattern, options: []) else { return nil }
        let nsString = html as NSString
        let results = regex.matches(in: html, options: [], range: NSRange(location: 0, length: nsString.length))
        
        if let match = results.first {
            let width = nsString.substring(with: match.range(at: 1))
            let height = nsString.substring(with: match.range(at: 2))
            return "Width: \(width) px, Height: \(height) px"
        }
        
        return nil
    }
}
