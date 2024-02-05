//
//  RestaurantDetailsViewModel.swift
//  TravelDiscovery
//
//  Created by Serhii Onyshchenko on 05.02.2024.
//

import SwiftUI

class RestaurantDetailsViewModel: ObservableObject {

    @Published var isLoading = true
    @Published var details: RestaurantDetails?

    init() {
        // fetch my NESTED JSON here
        let urlString = "https://travel.letsbuildthatapp.com/travel_discovery/restaurant?id=0"

        guard let url = URL(string: urlString) else { return }
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            // handle your errors properly

            guard let data = data else { return }

            DispatchQueue.main.async {
                self.details = try? JSONDecoder().decode(RestaurantDetails.self, from: data)
            }
        }
        .resume()
    }
}
