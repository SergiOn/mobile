//
//  DiscoverCategoriesView.swift
//  TravelDiscovery
//
//  Created by Serhii Onyshchenko on 14.01.2024.
//

// NavigationView is deprecated, migration guide
// https://developer.apple.com/documentation/swiftui/migrating-to-new-navigation-types

import SwiftUI

struct DiscoverCategoriesView: View {
    
    let categories: [Category] = [
        .init(name: "Art", imageName: "paintpalette.fill"),
        .init(name: "Sport", imageName: "sportscourt.fill"),
        .init(name: "Live Events", imageName: "music.mic"),
        .init(name: "Food", imageName: "tray.fill"),
        .init(name: "History", imageName: "books.vertical.fill")
    ]
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(alignment: .top, spacing: 14) {
                ForEach(categories, id: \.self) { category in
                    NavigationLink(
                        destination: CategoryDetailsView(),
                        label: {
                            VStack(spacing: 8) {
                                Image(systemName: category.imageName)
                                    .foregroundColor(Color(#colorLiteral(red: 1, green: 0.5059075952, blue: 0.2313886285, alpha: 1))
                                    )
                                    .frame(width: 64, height: 64)
                                    .background(Color.white)
                                    .cornerRadius(.infinity)
                                Text(category.name)
                                    .font(.system(size: 12, weight: .semibold))
                                    .multilineTextAlignment(.center)
                                    .foregroundColor(.white)
                            }
                            .frame(width: 68)
                        })
                }
            }
            .padding(.horizontal)
        }
    }
}

struct ActivityIndicatorView: UIViewRepresentable {
    typealias UIViewType = UIActivityIndicatorView

    func makeUIView(context: Context) -> UIActivityIndicatorView {
        let aiv = UIActivityIndicatorView(style: .large)
        aiv.startAnimating()
        aiv.color = .white
        return aiv
    }
    
    func updateUIView(_ uiView: UIActivityIndicatorView, context: Context) {
    }
}

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
                                Image("art1")
                                    .resizable()
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
    NavigationView {
        NavigationLink(
            destination: Text("Transition Screen"),
            label: {
                Text("Link")
            })
    }
}

#Preview {
    ZStack {
        Color.orange
        DiscoverCategoriesView()
    }
}

#Preview {
    DiscoverView()
}
