//
//  Constants.swift
//  Flickrrific
//
//  Created by Cole Warner on 9/25/24.
//

import Foundation

enum Url: String {
    case exampleUrl = "https://api.flickr.com/services/feeds/photos_public.gne?format=json&nojsoncallback=1&tags=boxer dog"
    case apiUrl = "https://api.flickr.com/services/feeds/photos_public.gne?format=json&nojsoncallback=1&tags="
}

enum ErrorKeys: String {
    case url = "url"
    case response = "response"
    case decoding = "decoding"
}

enum ErrorComments: String {
    case url = "Bad URL provided"
    case response = "Bad HTTP response"
    case decoding = "Error decoding JSON"
}

enum SystemImages: String {
    case photo = "photo"
}
