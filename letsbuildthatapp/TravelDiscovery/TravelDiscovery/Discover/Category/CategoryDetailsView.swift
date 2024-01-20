//
//  CategoryDetailsView.swift
//  TravelDiscovery
//
//  Created by Serhii Onyshchenko on 20.01.2024.
//

// api
// https://travel.letsbuildthatapp.com/travel_discovery/category?name=art

// dependencies
// https://github.com/onevcat/Kingfisher
// https://github.com/SDWebImage/SDWebImageSwiftUI

import SwiftUI
import Kingfisher
import SDWebImageSwiftUI

class CategoryDetailsViewModel: ObservableObject {
    
    @Published var isLoading = true
    @Published var places = [Place]()
    @Published var errorMassage = ""
    
    init() {
        // network code will happen here
        // real network code
        
        guard let url = URL(string: "https://travel.letsbuildthatapp.com/travel_discovery/category?name=art")
        else {
            return
        }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            // you want to check response statusCode and error
            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
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

struct CategoryDetailsView: View {
    
    @ObservedObject var vm = CategoryDetailsViewModel()

    var body: some View {
        ZStack {
            if vm.isLoading {
                VStack {
//                    ProgressView()
                    ActivityIndicatorView()
                    Text("Loading...")
                        .foregroundColor(.white)
                        .font(.system(size: 16, weight: .semibold))
                }
                .padding()
                .background(Color.black)
                .cornerRadius(8)
            } else {
                ZStack {
                    Text(vm.errorMassage)
                    ScrollView {
                        ForEach(vm.places, id: \.self) { place in
                            VStack(alignment: .leading, spacing: 0) {
                                /*
                                Image("art1")
                                    .resizable()
                                    .scaledToFill()
      
                                // Kingfisher
                                KFImage(URL(string: place.thumbnail))
                                    .resizable()
                                    .scaledToFill()

                                // SDWebImageSwiftUI
                                AnimatedImage(url: URL(string: place.thumbnail))
                                    .resizable()
                                    .scaledToFill()
                                WebImage(url: URL(string: place.thumbnail))
                                    .resizable()
                                    .indicator(.activity)
                                    .transition(.fade(duration: 0.5))
                                    .scaledToFill()
 
                                // AsyncImage
                                AsyncImage(url: URL(string: place.thumbnail)) { image in
                                    image.resizable()
                                } placeholder: {
                                    ProgressView()
                                }
                                .scaledToFill()
                                */

                                WebImage(url: URL(string: place.thumbnail))
                                    .resizable()
                                    .indicator(.activity)
                                    .transition(.fade(duration: 0.5))
                                    .scaledToFill()

                                Text(place.name)
                                    .font(.system(size: 12, weight: .semibold))
                                    .padding()
                            }
                            .asTile()
                            .padding()
                        }
                    }
                }
            }
        }
        .navigationTitle("Category")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    NavigationView {
        CategoryDetailsView()
    }
}

#Preview {
    DiscoverView()
}

#Preview {
    NavigationView {
        NavigationLink(
            destination: Text("Transition Screen"),
            label: {
                Text("Link")
            })
    }
}
