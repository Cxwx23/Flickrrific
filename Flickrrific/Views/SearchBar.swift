//
//  SearchBar.swift
//  Flickrrific
//
//  Created by Cole Warner on 9/25/24.
//

import SwiftUI

struct SearchBar: View {
    @Binding var searchText: String
    
    var body: some View {
        HStack {
            HStack {
                Image(systemName: "magnifyingglass")
                TextField("Search...", text: $searchText)
                    .padding(8)
            }
            .padding(10)
            .background(Color(.systemGray6))
            .cornerRadius(25)
            .shadow(color: Color.black.opacity(0.3), radius: 10, x: 0, y: 5)
            .padding(.horizontal)
            .padding(.bottom)
        }
    }
}
