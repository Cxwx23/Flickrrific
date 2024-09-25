//
//  ContentView.swift
//  Flickrrific
//
//  Created by Cole Warner on 9/25/24.
//

import SwiftUI

struct ContentView: View {
    @StateObject var viewModel = ImageViewModel()
    @State var searchText = ""

    var searchUrl: String {
        Url.apiUrl(query: searchText).value
    }
    
    var body: some View {
        NavigationStack {
            VStack {
                Title()
                SearchBar(searchText: $searchText)
                    .onChange(of: searchText) {
                        Task {
                            await getData()
                        }
                    }
                if !viewModel.isLoading {
                    ProgressView()
                }
                
                Spacer()
                
                ScrollView {
                    ImageGrid(dataArray: viewModel.dataArray)
                }
            }
        }
        .task {
            await getData()
        }
    }
    
    private func getData() async {
        do {
            try await viewModel.getImageData(url: searchUrl)
        } catch {
            print(ErrorComments.response.rawValue)
        }
    }
}

#Preview {
    ContentView()
}
