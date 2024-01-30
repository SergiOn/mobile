//
//  PopularDestinationsView.swift
//  TravelDiscovery
//
//  Created by Serhii Onyshchenko on 14.01.2024.
//

// Map
// https://stackoverflow.com/questions/76865201/mapcoordinateregion-showsuserlocation-deprecated-in-ios-17-0

import SwiftUI
import MapKit

struct PopularDestinationsView: View {

    let destinations: [Destination] = [
        .init(name: "Paris", country: "France", imageName: "eiffel_tower", latitude: 48.859565, longitude: 2.353235),
        .init(name: "Tokyo", country: "Japan", imageName: "japan", latitude: 35.679693, longitude: 139.771913),
        .init(name: "New York", country: "US", imageName: "new_york", latitude: 40.71592, longitude: -74.0055)
    ]

    var body: some View {
        VStack {
            HStack {
                Text("Popular destination")
                    .font(.system(size: 14, weight: .semibold))
                Spacer()
                Text("See all")
                    .font(.system(size: 14, weight: .semibold))
            }
            .padding(.top)
            .padding(.horizontal)

            ScrollView(.horizontal) {
                HStack(spacing: 8) {
                    ForEach(destinations, id: \.self) { destination in
                        NavigationLink(
                            destination: PopularDestinationDetailsView(destination: destination),
                            label: {
                                PopularDestinationTile(destination: destination)
                                    .padding(.bottom)
                            })
                    }
                }
                .padding(.horizontal)
            }
        }
    }
}

struct PopularDestinationDetailsView: View {
    
    let attractions: [Attraction] = [
        .init(name: "Eiffel Tower", imageName: "eiffel_tower", latitude: 48.858605, longitude: 2.2946),
        .init(name: "Champs-Elysees", imageName: "new_york", latitude: 48.866867, longitude: 2.311780),
        .init(name: "Louvre Museum", imageName: "art2", latitude: 48.860288, longitude: 2.337789)
    ]

    let destination: Destination
    @State var region: MKCoordinateRegion
//    @State var position: MapCameraPosition
//    @State var isShowingAttractions: Bool = false
    @State var isShowingAttractions: Bool = true

    init(destination: Destination) {
        self.destination = destination
        self.region = MKCoordinateRegion(
            center: .init(latitude: destination.latitude, longitude: destination.longitude),
            span: .init(latitudeDelta: 0.1, longitudeDelta: 0.1)
        )
//        self._region = State(initialValue: MKCoordinateRegion(
//            center: .init(latitude: destination.latitude, longitude: destination.longitude),
//            span: .init(latitudeDelta: 0.1, longitudeDelta: 0.1)
//        ))
//        self._position = State(initialValue: MapCameraPosition.region(MKCoordinateRegion(
//            center: .init(latitude: destination.latitude, longitude: destination.longitude),
//            span: .init(latitudeDelta: 0.1, longitudeDelta: 0.1)
//        )))
    }

    var body: some View {
        ScrollView {
            Image(destination.imageName)
                .resizable()
                .scaledToFill()
                .frame(height: 200)
                .clipped()

            VStack(alignment: .leading) {
                Text(destination.name)
                    .font(.system(size: 18, weight: .bold))
                Text(destination.country)
                HStack {
                    ForEach(0..<5, id: \.self) { num in
                        Image(systemName: "star.fill")
                            .foregroundColor(.orange)
                    }
                }
                .padding(.top, 2)

                Text("Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book."
                )
                .padding(.top, 8)
                .font(.system(size: 14))

                HStack {
                    Spacer()
                }
            }
            .padding(.horizontal)

            HStack {
                Text("Location")
                    .font(.system(size: 18, weight: .semibold))
                Spacer()
                Button {
                    isShowingAttractions.toggle()
                } label: {
                    Text("\(isShowingAttractions ? "Hide" : "Show") Attractions")
                        .font(.system(size: 12, weight: .semibold))
                }
                Toggle("", isOn: $isShowingAttractions)
                    .labelsHidden()
            }
            .padding(.horizontal)

//            Map(coordinateRegion: $region)
//                .frame(height: 300)
            Map(
                coordinateRegion: $region,
                annotationItems: isShowingAttractions ? attractions : [],
                annotationContent: { attraction in
//                    MapMarker(
//                        coordinate: .init(
//                            latitude: attraction.latitude,
//                            longitude: attraction.longitude
//                        ),
//                        tint: .red
//                    )
                    MapAnnotation(coordinate: .init(
                        latitude: attraction.latitude,
                        longitude: attraction.longitude
                    )) {
                        VStack {
                            Image(attraction.imageName)
                                .resizable()
                                .frame(width: 80, height: 60)
                                .cornerRadius(4)
                                .overlay(RoundedRectangle(cornerRadius: 4)
                                    .stroke(Color(.init(white: 0, alpha: 0.5)))
                                )
                            Text(attraction.name)
                                .font(.system(size: 12, weight: .semibold))
                                .padding(.horizontal, 6)
                                .padding(.vertical, 4)
                                .background(LinearGradient(
                                    gradient: Gradient(colors: [Color.red, Color.blue]),
                                    startPoint: .leading,
                                    endPoint: .trailing
                                ))
                                .foregroundColor(.white)
                                .cornerRadius(4)
                                .overlay(RoundedRectangle(cornerRadius: 4)
                                    .stroke(Color(.init(white: 0, alpha: 0.5)))
                                )
                        }
                        .shadow(radius: 5)
                    }
                }
            )
            .frame(height: 300)

//            Map(position: $position) {
//                UserAnnotation()
//            }
//            .frame(height: 300)
        }
        .navigationTitle(destination.name)
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct PopularDestinationTile: View {

    let destination: Destination

    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            Image(destination.imageName)
                .resizable()
                .scaledToFill()
                .frame(width: 125, height: 125)
                .cornerRadius(4)
                .padding(.horizontal, 6)
                .padding(.vertical, 6)

            Text(destination.name)
                .font(.system(size: 12, weight: .semibold))
                .padding(.horizontal, 12)
//                .foregroundColor(.black)
                .foregroundColor(Color(.label))

            Text(destination.country)
                .font(.system(size: 12, weight: .semibold))
                .padding(.horizontal, 12)
                .padding(.bottom, 8)
                .foregroundColor(.gray)
        }
//        .modifier(TileModifier())
        .asTile()
    }
}

#Preview {
    NavigationView {
        PopularDestinationDetailsView(destination: .init(name: "Paris", country: "France", imageName: "eiffel_tower", latitude: 48.859565, longitude: 2.353235))
//        PopularDestinationDetailsView(destination: .init(name: "Tokyo", country: "Japan", imageName: "japan", latitude: 35.679693, longitude: 139.771913))
    }
}

#Preview {
    NavigationView {
        PopularDestinationsView()
    }
}

#Preview {
    DiscoverView()
}
