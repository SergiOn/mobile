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

struct CategoryDetailsView: View {
    
//    let name: String
//    @ObservedObject var vm = CategoryDetailsViewModel()

    private let name: String
    @ObservedObject private var vm: CategoryDetailsViewModel

    init(name: String) {
        print("Loaded CategoryDetails View and making a network request for \(name)")
        self.name = name
//        self.vm = CategoryDetailsViewModel(name: name)
//        self.vm = CategoryDetailsViewModel(name: name.lowercased())
        self.vm = .init(name: name.lowercased())
    }

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
                    if !vm.errorMassage.isEmpty {
                        VStack(spacing: 12) {
                            Image(systemName: "xmark.octagon.fill")
                                .font(.system(size: 64, weight: .semibold))
                                .foregroundColor(.red)
                            Text(vm.errorMassage)
                        }
                    }

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
        .navigationTitle(name)
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    NavigationView {
        CategoryDetailsView(name: "Art")
//        CategoryDetailsView(name: "Food")
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
