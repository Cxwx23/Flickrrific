//
//  ImageViewModel.swift
//  Flickrrific
//
//  Created by Cole Warner on 9/25/24.
//

import Foundation

class ImageViewModel: ObservableObject {
    @Published var dataArray = [ImageDataModel]() //= []
    @Published var errorMessage: String?
    @Published var isLoading: Bool = false
        
    @MainActor 
    func getImageData() async {
        do {
            let response = try await ApiManager.shared.getData(type: ResponseModel.self)
            if let response = response {
                self.dataArray = response.items ?? []
                print(String(describing: response.items))
            } else {
                self.errorMessage = "No response recieved"
            }
            self.isLoading = true
        } catch {
            self.isLoading = false
            self.errorMessage = "There was an error getting the data: \(error)"
        }
    }
}
