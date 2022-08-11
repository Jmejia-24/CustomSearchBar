//
//  CustomSearchBar.swift
//  CustomSearchBar
//
//  Created by Byron Mejia on 8/11/22.
//

import SwiftUI

struct CustomSearchBar: View {
    @ObservedObject var searchData: SearchUsers

    var body: some View {
        VStack(spacing: 0) {
            HStack(spacing: 12) {
                Image(systemName: "magnifyingglass")
                    .font(.title2)
                    .foregroundColor(.gray)
                
                TextField("Search", text: $searchData.query)
            }
            .padding(.vertical, 10)
            .padding(.horizontal)
            
            if !searchData.searchesUsers.isEmpty {
                ScrollView(.vertical, showsIndicators: true) {
                    LazyVStack(alignment: .leading, spacing: 12) {
                        ForEach(searchData.searchesUsers, id: \.node_id) { user in
                            VStack(alignment: .leading, spacing: 6) {
                                Text(user.login)
                                Divider()
                            }
                            .padding(.horizontal)
                        }
                    }
                    .padding(.top)
                }
                .frame(height: 240)
            }
        }
        .background(Color("Color"))
        .clipShape(RoundedRectangle(cornerRadius: 20))
        .padding()
    }
}
