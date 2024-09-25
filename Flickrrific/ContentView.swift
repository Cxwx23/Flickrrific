//
//  ContentView.swift
//  Flickrrific
//
//  Created by Cole Warner on 9/25/24.
//

import SwiftUI

struct ContentView: View {
    @StateObject var viewModel = ImageViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
                ScrollView {
                    ImageGrid(dataArray: viewModel.dataArray)
                }
            }
            .toolbar(content: {
                ToolbarItem(placement: .principal) {
                    Text("Flickrrific")
                        .font(.largeTitle)
                        .fontWeight(.semibold)
                        .shadow(color: .black.opacity(0.5), radius: 10, x: 0, y: 5)
}
            })
        }
        .task {
            await self.viewModel.getImageData()
        }
    }
}

#Preview {
    ContentView()
}
