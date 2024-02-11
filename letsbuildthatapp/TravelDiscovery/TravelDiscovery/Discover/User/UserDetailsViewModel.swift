//
//  UserDetailsViewModel.swift
//  TravelDiscovery
//
//  Created by Serhii Onyshchenko on 11.02.2024.
//

import SwiftUI

class UserDetailsViewModel: ObservableObject {

    @Published var userDetails: UserDetails?

    init(userId: Int64) {
        // network code
        let urlString = "https://travel.letsbuildthatapp.com/travel_discovery/user?id=\(userId)"
        guard let url = URL(string: urlString) else { return }

        URLSession.shared.dataTask(with: url) { (data, response, error) in
            // handle your errors properly

            guard let data = data else { return }

//            let jsonString = String(data: data, encoding: String.Encoding.utf8) ?? ""
//            print(jsonString)

            DispatchQueue.main.async {
                do {
                    self.userDetails = try JSONDecoder().decode(UserDetails.self, from: data)
                    print(self.userDetails!)
                } catch let jsonError {
                    print("Decoding failed for UserDetails:", jsonError)
                }
            }
        }
        .resume()
    }
}
