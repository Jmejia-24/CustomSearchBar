//
//  User.swift
//  CustomSearchBar
//
//  Created by Byron Mejia on 8/8/22.
//

import SwiftUI

struct User: Decodable, Hashable {
    var node_id: String
    var login: String
    var avatar_url: String
}

struct Results: Decodable {
    var items: [User]
}

