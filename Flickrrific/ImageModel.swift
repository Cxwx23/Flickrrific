//
//  ImageModel.swift
//  Flickrrific
//
//  Created by Cole Warner on 9/25/24.
//

import Foundation

struct ResponseModel: Codable, Hashable {
    let title: String?
    let link: String?
    let description: String?
    let modified: String?
    let generator: String?
    let items: [ImageDataModel]?
}

struct ImageDataModel: Codable, Hashable {
    let title: String?
    let link: String?
    let media: ImageModel?
    let description: String?
    let published: String?
    let author: String?
    let tags: String?
}

struct ImageModel: Codable, Hashable {
    let m: String?
}
