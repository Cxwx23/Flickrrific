//
//  ImageGridView.swift
//  Flickrrific
//
//  Created by Cole Warner on 9/25/24.
//

import Foundation

import SwiftUI

struct ImageGrid: View {
    var dataArray: [ImageDataModel]
    
    let columns = Array(repeating: GridItem(.flexible()), count: 3)
    
    var body: some View {
        LazyVGrid(columns: columns, spacing: 12) {
            ForEach(dataArray, id: \.hashValue) { data in
                AsyncImage(url: URL(string: data.media?.m ?? "")) { result in
                    switch result {
                    case .success(let image):
                        image
                            .resizable()
                            .imageFormatting()
                    case .failure:
                        Image(systemName: SystemImages.photo.rawValue)
                            .resizable()
                            .imageFormatting()
                    case .empty:
                        ProgressView()
                            .imageFormatting()
                    @unknown default:
                        EmptyView()
                    }
                }
//                        .onAppear {
//                            loadImage(from: imageUrl)
//                        }
            }
        }
        .padding(.horizontal, 8)

    }
}
