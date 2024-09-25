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
    
    func usernameCleanup(title: String) -> String {
        let username = title
            .replacingOccurrences(of: "nobody@flickr.com (\"", with: "")
            .replacingOccurrences(of: ")", with: "")
            .replacingOccurrences(of: "\")", with: "")
            .replacingOccurrences(of: "(", with: "")

            .capitalized
        return username
    }
}
