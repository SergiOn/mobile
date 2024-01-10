//
//  ContentView.swift
//  TravelDiscovery
//
//  Created by Serhii Onyshchenko on 09.01.2024.
//

// NavigationView is deprecated
// https://developer.apple.com/documentation/swiftui/navigationview

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            ScrollView {
                DiscoverCategoriesView()
            }
            .navigationTitle("Discover")
        }
    }
}

#Preview {
    ContentView()
}

struct DiscoverCategoriesView: View {
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 8) {
                ForEach(0..<5, id: \.self) { num in
                    VStack(spacing: 4) {
                        Spacer()
                            .frame(width: 50, height: 50)
                            .background(Color.gray)
                            .cornerRadius(.infinity)
                            .shadow(color: .gray, radius: 4, x: 0, y: 2)
                        Text("Art")
                            .font(.system(size: 12, weight: .semibold))
                    }
                }
            }
            .padding(.horizontal)
        }
        // .background(Color.red)
    }
}
