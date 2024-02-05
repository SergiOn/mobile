//
//  RestaurantDetails.swift
//  TravelDiscovery
//
//  Created by Serhii Onyshchenko on 05.02.2024.
//

import Foundation

struct RestaurantDetails: Decodable {
    let description: String
    let popularDishes: [Dish]
    let photos: [String]
    let reviews: [Review]
}
