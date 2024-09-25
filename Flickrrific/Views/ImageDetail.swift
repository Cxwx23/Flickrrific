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
            }
        }
    }
}
