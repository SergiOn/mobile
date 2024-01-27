//
//  Destination.swift
//  TravelDiscovery
//
//  Created by Serhii Onyshchenko on 14.01.2024.
//

import Foundation
import CoreLocation

struct Destination: Hashable {
    let name: String
    let country: String
    let imageName: String
    let latitude: CLLocationDegrees
    let longitude: CLLocationDegrees
}
