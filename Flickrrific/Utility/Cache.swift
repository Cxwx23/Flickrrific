//
//  Cache.swift
//  Flickrrific
//
//  Created by Cole Warner on 9/25/24.
//

import UIKit

class Cache {
    static let shared = Cache()

    private init() {}

    private let cache = NSCache<NSString, UIImage>()

    func getImage(for key: String) -> UIImage? {
        return cache.object(forKey: NSString(string: key))
    }

    func saveImage(_ image: UIImage, for key: String) {
        cache.setObject(image, forKey: NSString(string: key))
    }
}
