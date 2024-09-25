//
//  ImageViewModel.swift
//  Flickrrific
//
//  Created by Cole Warner on 9/25/24.
//

import Foundation

class ImageViewModel: ObservableObject {
    @Published var dataArray = [ImageDataModel]()
    @Published var isLoading: Bool = true
        
    @MainActor 
    func getImageData(url: String) async throws {
        do {
            let response = try await ApiManager.shared.getData(type: ResponseModel.self, url: url)
            if let response = response {
                self.dataArray = response.items ?? []
            } else {
                print(ErrorComments.response.rawValue)
            }
            self.isLoading = false
        } catch {
            self.isLoading = true
            print(ErrorComments.response.rawValue, error)
        }
    }
}
