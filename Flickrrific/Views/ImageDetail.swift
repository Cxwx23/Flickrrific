//
//  ImageDetail.swift
//  Flickrrific
//
//  Created by Cole Warner on 9/25/24.
//

import SwiftUI

struct ImageDetail: View {
    let data: ImageDataModel
    
    var body: some View {
        ScrollView {
            VStack (alignment: .leading){
                AsyncImage(url: URL(string: data.media?.m ?? "")) { result in
                    switch result {
                    case .success(let image):
                        image
                            .resizable()
                            .detailImageViewModifier()
                    case .failure:
                        Image(systemName: SystemImages.photo.rawValue)
                            .resizable()
                            .detailImageViewModifier()
                    default:
                        ProgressView()
                            .detailImageViewModifier()
                    }
                }
                
                VStack(alignment: .center) {
                    Text(data.title ?? "")
                        .font(.title)
                        .fontWeight(.semibold)
                        .padding(.bottom)
                        .shadow(color: .black.opacity(0.3), radius: 10, x: 0, y: 5)
                    
                    Text(data.description ?? Labels.noData.rawValue)
                        .frame(alignment: .leading)
                        .font(.headline)
                        .fontWeight(.medium)
                        .padding(.bottom)
                        .padding(.horizontal)
                    
                    Text("Author: " + (data.author ?? ""))
                        .padding(.bottom)
                        .padding(.horizontal)
                    
                    if let datePublished = data.published {
                        Text("Published: \(Helpers.shared.formatDate(datePublished))")
                        .padding(.bottom)
                    }
                }
            }
        }
    }
}
