//
//  DestinationHeaderContainer.swift
//  TravelDiscovery
//
//  Created by Serhii Onyshchenko on 01.02.2024.
//

// api
// https://travel.letsbuildthatapp.com/travel_discovery/destination?name=paris
// https://travel.letsbuildthatapp.com/travel_discovery/destination?name=tokyo
// https://travel.letsbuildthatapp.com/travel_discovery/destination?name=new%20york

import SwiftUI
import Kingfisher

struct DestinationHeaderContainer: View {

    let imageUrlString: [String]
    @State var selectedPhoto: Int = 0

    init(imageUrlString: [String]) {
        self.imageUrlString = imageUrlString
    }

    var body: some View {
        TabView(selection: $selectedPhoto) {
            ForEach(Array(imageUrlString.enumerated()), id: \.offset) { index, photoUrl in
                KFImage(URL(string: photoUrl))
                    .resizable()
                    .scaledToFill()
                    .clipped()
                    .tag(index)
            }
        }
//            .tabViewStyle(PageTabViewStyle())
//            .tabViewStyle(.page)
//            .tabViewStyle(.page(indexDisplayMode: .always))
        .tabViewStyle(.page(indexDisplayMode: .never))
//            .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))
//            .indexViewStyle(.page(backgroundDisplayMode: .always))
//            .accentColor(.red)
//            .tint(Color.red)
//            .toolbarBackground(.red, for: .tabBar)
//            .toolbarBackground(.visible, for: .tabBar)
//            .toolbarColorScheme(.light, for: .tabBar)
        .frame(height: 250)

        HStack(spacing: 10) {
            ForEach(0..<imageUrlString.count, id: \.self) { index in
                let isActive = index == selectedPhoto
                
                Button {
                    withAnimation {
                        selectedPhoto = index
                    }
                } label: {
                    Circle()
                        .frame(width: 8)
                        .foregroundColor(isActive ? .red : .black)
                        .opacity(isActive ? 1 : 0.25)
                }
            }
        }
    }
}

#Preview {

    let imageUrlString: [String] = [
        "https://letsbuildthatapp-videos.s3.us-west-2.amazonaws.com/7156c3c6-945e-4284-a796-915afdc158b5",
        "https://letsbuildthatapp-videos.s3-us-west-2.amazonaws.com/b1642068-5624-41cf-83f1-3f6dff8c1702",
        "https://letsbuildthatapp-videos.s3-us-west-2.amazonaws.com/6982cc9d-3104-4a54-98d7-45ee5d117531",
        "https://letsbuildthatapp-videos.s3-us-west-2.amazonaws.com/2240d474-2237-4cd3-9919-562cd1bb439e"
    ]

    return DestinationHeaderContainer(imageUrlString: imageUrlString)

//    struct PreviewWrapper: View {
//        let imageUrlString: [String] = [
//            "https://letsbuildthatapp-videos.s3.us-west-2.amazonaws.com/7156c3c6-945e-4284-a796-915afdc158b5",
//            "https://letsbuildthatapp-videos.s3-us-west-2.amazonaws.com/b1642068-5624-41cf-83f1-3f6dff8c1702",
//            "https://letsbuildthatapp-videos.s3-us-west-2.amazonaws.com/6982cc9d-3104-4a54-98d7-45ee5d117531",
//            "https://letsbuildthatapp-videos.s3-us-west-2.amazonaws.com/2240d474-2237-4cd3-9919-562cd1bb439e"
//        ]
//
//        var body: some View {
//            DestinationHeaderContainer(imageUrlString: imageUrlString)
//        }
//    }
//    return PreviewWrapper()
}
