//
//  DiscoverCategoriesView.swift
//  TravelDiscovery
//
//  Created by Serhii Onyshchenko on 14.01.2024.
//

// NavigationView is deprecated, migration guide
// https://developer.apple.com/documentation/swiftui/migrating-to-new-navigation-types

// NavigationLink Lazy View
// https://stackoverflow.com/questions/57594159/swiftui-navigationlink-loads-destination-view-immediately-without-clicking

import SwiftUI

struct NavigationLazyView<Content: View>: View {
    let build: () -> Content

    init(_ build: @autoclosure @escaping () -> Content) {
        self.build = build
    }

    var body: Content {
        build()
    }
}

struct DiscoverCategoriesView: View {

    let categories: [Category] = [
        .init(name: "Art", imageName: "paintpalette.fill"),
        .init(name: "Sports", imageName: "sportscourt.fill"),
        .init(name: "Live Events", imageName: "music.mic"),
        .init(name: "Food", imageName: "tray.fill"),
        .init(name: "History", imageName: "books.vertical.fill")
    ]

    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(alignment: .top, spacing: 14) {
                ForEach(categories, id: \.self) { category in
                    NavigationLink(
                        destination: NavigationLazyView(CategoryDetailsView(name: category.name)),
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

//        ScrollView(.horizontal, showsIndicators: false) {
//            HStack(alignment: .top, spacing: 14) {
//                ForEach(categories, id: \.self) { category in
//                    NavigationLink(value: category) {
//                        VStack(spacing: 8) {
//                            Image(systemName: category.imageName)
//                                .foregroundColor(Color(#colorLiteral(red: 1, green: 0.5059075952, blue: 0.2313886285, alpha: 1))
//                                )
//                                .frame(width: 64, height: 64)
//                                .background(Color.white)
//                                .cornerRadius(.infinity)
//                            Text("n\(category.name)")
//                                .font(.system(size: 12, weight: .semibold))
//                                .multilineTextAlignment(.center)
//                                .foregroundColor(.white)
//                        }
//                        .frame(width: 68)
//                    }
//                    .navigationDestination(for: Category.self) { category in
//                        CategoryDetailsView(name: category.name)
//                    }
//                }
//                
//            }
//            .padding(.horizontal)
//        }
    }
}

#Preview {
    NavigationView {
        ZStack {
            Color.orange
            DiscoverCategoriesView()
        }
    }
}

#Preview {
    DiscoverView()
}
