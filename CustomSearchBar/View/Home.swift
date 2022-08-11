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
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
