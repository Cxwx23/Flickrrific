//
//  Constants.swift
//  Flickrrific
//
//  Created by Cole Warner on 9/25/24.
//

import Foundation

// MARK: - URLs
enum Url {
    case exampleUrl
    case apiUrl(query: String)
    
    var value: String {
        switch self {
        case .exampleUrl:
            return "https://api.flickr.com/services/feeds/photos_public.gne?format=json&nojsoncallback=1&tags=boxer dog"
        case .apiUrl(let query):
            return "https://api.flickr.com/services/feeds/photos_public.gne?format=json&nojsoncallback=1&tags=\(query)"
        }
    }
}

// MARK: - Error Keys
enum ErrorKeys: String {
    case url = "url"
    case response = "response"
    case decoding = "decoding"
}

// MARK: - Error Comments
enum ErrorComments: String {
    case url = "Bad URL provided"
    case response = "Bad HTTP response"
    case decoding = "Error decoding JSON"
}

// MARK: - System Images
enum SystemImages: String {
    case photo = "photo"
    case search = "magnifyingglass"
    case upArrow = "square.and.arrow.up"
}

// MARK: - Labels
enum Labels: String {
    case noData = "There was no description for this item"
    case search = "Search..."
    case noUsername = "Unknown User"
}

// MARK: - Accessibility Identifier
enum AccessibilityIdentifier: String {
    case imageGridView = "ImageGridView"
    case searchBar = "searchBar"
}

// MARK: - Accessibility Label
enum AccessibilityLabel: String {
    case clearText = "Clear text"
}
