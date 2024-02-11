//
//  UserDetails.swift
//  TravelDiscovery
//
//  Created by Serhii Onyshchenko on 11.02.2024.
//

import Foundation

struct UserDetails: Decodable {
    let id: Int64
    let username: String
    let firstName: String
    let lastName: String
    let profileImage: String
    let followers: Int
    let following: Int
    let posts: [Post]
}
