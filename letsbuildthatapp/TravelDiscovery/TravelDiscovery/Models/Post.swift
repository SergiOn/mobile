//
//  Post.swift
//  TravelDiscovery
//
//  Created by Serhii Onyshchenko on 11.02.2024.
//

import Foundation

struct Post: Decodable, Hashable {
    let title: String
    let imageUrl: String
    let views: String
    let hashtags: [String]
}
