//
//  ContentView.swift
//  CustomSearchBar
//
//  Created by Byron Mejia on 8/8/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            Home()
                .preferredColorScheme(.dark)
                .navigationTitle("GitHub Users")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
