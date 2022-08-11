//
//  SearchUser.swift
//  CustomSearchBar
//
//  Created by Byron Mejia on 8/11/22.
//

import SwiftUI

class SearchUsers: ObservableObject {
    @Published var searchesUsers = [User]()
    @Published var query = ""
    @Published var page = 1
    
    func find() {
        
    }
}

