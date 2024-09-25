//
//  ImageViewModel.swift
//  Flickrrific
//
//  Created by Cole Warner on 9/25/24.
//

import Foundation

/// <#Description#>: The ViewModel takes the URL string for the API as a parameter and populates the data array after calling the getData function.
class ImageViewModel: ObservableObject {
    @Published var dataArray = [ImageDataModel]()
    @Published var isLoading: Bool = false
    
    @MainActor
    func getImageData(url: String) async throws {
        do {
            self.isLoading = true
            let response = try await ApiManager.shared.getData(type: ResponseModel.self, url: url)
            if let response = response {
                self.dataArray = response.items ?? []
            } else {
                print(ErrorComments.response.rawValue)
            }
        } catch {
            self.isLoading = false
            print(ErrorComments.response.rawValue, error)
        }
    }
}
