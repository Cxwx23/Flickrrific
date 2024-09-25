//
//  ImageGrid.swift
//  Flickrrific
//
//  Created by Cole Warner on 9/25/24.
//

import SwiftUI

struct ImageGrid: View {
    var dataArray: [ImageDataModel]
    
    let columns = Array(repeating: GridItem(.flexible()), count: 3)
    
    var body: some View {
        LazyVGrid(columns: columns, spacing: 12) {
            ForEach(dataArray, id: \.hashValue) { data in
                NavigationLink(destination: ImageDetail(data: data)) {
                    AsyncImage(url: URL(string: data.media?.m ?? "")) { result in
                        switch result {
                        case .success(let image):
                            image
                                .resizable()
                                .imageViewModifier()
                        case .failure:
                            Image(systemName: SystemImages.photo.rawValue)
                                .resizable()
                                .imageViewModifier()
                        default:
                            ProgressView()
                                .imageViewModifier()
                        }
                    }
                    .onAppear {
                        getCachedImage(from: data.media?.m ?? "")
                    }
                }
            }
        }
        .padding(.horizontal, 8)
    }
    
    private func getCachedImage(from urlString: String) {
        let key = urlString
        if Cache.shared.getImage(for: key) == nil, !urlString.isEmpty {
            guard let url = URL(string: urlString) else {
                print(ErrorComments.url.rawValue)
                return
            }
            URLSession.shared.dataTask(with: url) { data, response, error in
                if let data = data, let image = UIImage(data: data) {
                    Cache.shared.saveImage(image, for: key)
                }
            }
        }
    }
}
