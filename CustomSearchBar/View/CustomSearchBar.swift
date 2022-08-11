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
                    .textInputAutocapitalization(.none)
            }
            .padding(.vertical, 10)
            .padding(.horizontal)
            
            if !searchData.searchesUsers.isEmpty {
                ScrollView(.vertical, showsIndicators: true) {
                    LazyVStack(alignment: .leading, spacing: 12) {
                        ForEach(searchData.searchesUsers, id: \.self) { user in
                            VStack(alignment: .leading, spacing: 6) {
                                Text(user.login)
                                Divider()
                            }
                            .padding(.horizontal)
                            .onAppear {
                                if user.node_id == searchData.searchesUsers.last?.node_id && searchData.page <= 3 {
                                    searchData.page += 1
                                    searchData.find()
                                }
                            }
                        }
                    }
                    .padding(.top)
                }
                .frame(maxHeight: .infinity, alignment: .top)
            }
        }
        .background(Color("Color"))
        .clipShape(RoundedRectangle(cornerRadius: 20))
        .padding()
    }
}
