//
//  ReviewUser.swift
//  TravelDiscovery
//
//  Created by Serhii Onyshchenko on 05.02.2024.
//

import Foundation

struct ReviewUser: Decodable, Hashable {
    let id: Int64
    let username: String
    let firstName: String
    let lastName: String
    let profileImage: String
}
