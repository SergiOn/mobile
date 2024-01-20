//
//  Place.swift
//  TravelDiscovery
//
//  Created by Serhii Onyshchenko on 20.01.2024.
//

import Foundation

struct Place: Decodable, Hashable {
    let id: Int64
//    let id: String
    let name: String
    let thumbnail: String

    /*
     id": 4,
     "name": "Art Academy",
     "country": "Japan",
     "description": "",
     "thumbnail": "https://letsbuildthatapp-videos.s3.us-west-2.amazonaws.com/42eb62ad-8f4a-4fdd-8ed2-3a7614a2f9e2",
     "photos": [
       
     ]
     */
}
