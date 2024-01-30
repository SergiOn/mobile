//
//  Attraction.swift
//  TravelDiscovery
//
//  Created by Serhii Onyshchenko on 30.01.2024.
//

import Foundation
import CoreLocation

struct Attraction: Identifiable {
    let id = UUID().uuidString
    let name: String
    let imageName: String
    let latitude: CLLocationDegrees
    let longitude: CLLocationDegrees
}
