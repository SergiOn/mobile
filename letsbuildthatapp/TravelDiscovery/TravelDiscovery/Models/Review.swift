//
//  Review.swift
//  TravelDiscovery
//
//  Created by Serhii Onyshchenko on 05.02.2024.
//

import Foundation

struct Review: Decodable, Hashable {
    let user: ReviewUser
    let rating: Int
    let text: String
}
