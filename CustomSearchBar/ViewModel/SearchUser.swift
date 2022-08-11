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
        let searchQuery = query.replacingOccurrences(of: " ", with: "%20")
        let url = "https://api.github.com/search/users?q=\(searchQuery)&page=\(page)&per_page=10"
        
        let session = URLSession(configuration: .default)
        
        session.dataTask(with: URL(string: url)!) { data, _, error in
            guard let jsonData = data else { return }
            
            do {
                let users = try JSONDecoder().decode(Results.self, from: jsonData)
                
                DispatchQueue.main.async {
                    if self.page == 1 {
                        self.searchesUsers.removeAll()
                    }
                    self.searchesUsers = Array(Set(self.searchesUsers).union(Set(users.items)))
                }
            } catch {
                print(error.localizedDescription)
            }
        }
        .resume()
    }
}

