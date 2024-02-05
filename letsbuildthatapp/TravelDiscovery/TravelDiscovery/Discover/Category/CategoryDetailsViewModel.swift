//
//  CategoryDetailsViewModel.swift
//  TravelDiscovery
//
//  Created by Serhii Onyshchenko on 05.02.2024.
//

import SwiftUI

class CategoryDetailsViewModel: ObservableObject {

    @Published var isLoading = true
    @Published var places = [Place]()
    @Published var errorMassage = ""

    init(name: String) {
        // network code will happen here
        // real network code

//        let urlString = "https://travel.letsbuildthatapp.com/travel_discovery/category?name=\(name.lowercased())"
//        let urlString = "https://travel.letsbuildthatapp.com/travel_discovery/category?name=\(name)"
        let urlString = "https://travel.letsbuildthatapp.com/travel_discovery/category?name=\(name)"
            .addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? ""

        guard let url = URL(string: urlString) else {
            self.isLoading = false
            return
        }

        URLSession.shared.dataTask(with: url) { (data, response, error) in
            // you want to check response statusCode and error
            if let statusCode = (response as? HTTPURLResponse)?.statusCode, statusCode >= 400 {
                self.isLoading = false
                self.errorMassage = "Bad status: \(statusCode)"
                return
            }

//            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            DispatchQueue.main.async {
                guard let data = data else { return }

                do {
                    self.places = try JSONDecoder().decode([Place].self, from: data)
                } catch {
                    print("Failed to decode JSON:", error)
                    self.errorMassage = error.localizedDescription
                }

                self.isLoading = false
            }
        }
        // make sure to have resume
        .resume()
    }
}
