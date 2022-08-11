//
//  Home.swift
//  CustomSearchBar
//
//  Created by Byron Mejia on 8/8/22.
//

import SwiftUI

struct Home: View {
    @StateObject var searchData = SearchUsers()
    
    var body: some View {
        VStack {
            CustomSearchBar(searchData: searchData)
            
            Spacer()
        }
        .onChange(of: searchData.query) { newData in
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.4) {
                if newData == searchData.query {
                    if searchData.query != "" {
                        searchData.page = 1
                        searchData.find()
                    } else {
                        searchData.searchesUsers.removeAll()
                    }
                }
            }
        }
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
