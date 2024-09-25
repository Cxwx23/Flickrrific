//
//  MockApiManager.swift
//  Flickrrific
//
//  Created by Cole Warner on 9/25/24.
//

import Foundation

class MockAPIManager: ApiManagerType {
    static let mockShared = MockAPIManager()
    private init() {}
    
    // MARK: - Public Method
       /// Fetches mock data for the given type and URL.

    func getData<T>(type for: T.Type, url: String) async throws -> T? where T: Codable {
        
        let items = [
            ImageDataModel(title: "Item 1", link: "Link 1", media: ImageModel(m: "https://picsum.photos/200/300"), description: "Description 1", published: "2024-01-01", author: "Author 1"),
            ImageDataModel(title: "Item 2", link: "Link 2", media: ImageModel(m: "https://picsum.photos/200/300"), description: "Description 2", published: "2024-01-02", author: "Author 2"),
            ImageDataModel(title: "Item 3", link: "Link 3", media: ImageModel(m: "https://picsum.photos/200/300"), description: "Description 3", published: "2024-01-03", author: "Author 3")
        ]
        
        return items as? T
    }
}
