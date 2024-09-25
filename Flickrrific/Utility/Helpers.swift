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
            .replacingOccurrences(of: ")", with: "")
            .replacingOccurrences(of: "\")", with: "")
            .replacingOccurrences(of: "(", with: "")

            .capitalized
        return username
    }
}
