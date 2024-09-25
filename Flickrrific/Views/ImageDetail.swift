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
        VStack {
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
                        
                        WebView(htmlContent: data.description ?? "<html><body><h1>No Data</h1></body></html>")
                            .frame(height: 200, alignment: .center)
                            .padding(.horizontal)
                        
                        Text("Author: \(Helpers.shared.usernameCleanup(author: data.author ?? Labels.noData.rawValue))")
                            .fixedSize(horizontal: false, vertical: true)
                            .padding(.bottom
                            )
                        
                        if let datePublished = data.published {
                            Text("Published: \(Helpers.shared.formatDate(datePublished))")
                                .padding(.bottom)
                        }
                        
                        if let imageSize = Helpers.shared.getImageSize(from: data.description) {
                            Text("Image Size: \(imageSize)")
                                .padding(.top, 5)
                                .fixedSize(horizontal: false, vertical: true)
                        }
                    }
                }
            }
            
            Spacer()
            
            if let urlString = data.media?.m, let imageUrl = URL(string: urlString) {
                ShareLink(item: generateShareableContent(from: imageUrl)) {
                    Label("Share", systemImage: SystemImages.upArrow.rawValue)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                        .shadow(radius: 5)
                        .padding(.horizontal)
                        .padding(.top, 20)
                }
            }
        }
    }
    
    // MARK: - Generate Shareable Content
    func generateShareableContent(from imageUrl: URL) -> String {
        let shareableContent = """
            Title: \(data.title ?? Labels.noData.rawValue)
            Description: \(data.description ?? Labels.noData.rawValue)
            Author: \(data.author ?? Labels.noData.rawValue))
            Published: \(Helpers.shared.formatDate(data.published ?? Labels.noData.rawValue))
            Image URL: \(imageUrl)
            """
        return shareableContent
    }
}
