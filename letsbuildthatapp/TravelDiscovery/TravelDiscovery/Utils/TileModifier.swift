//
//  TileModifier.swift
//  TravelDiscovery
//
//  Created by Serhii Onyshchenko on 14.01.2024.
//

import SwiftUI

extension View {
    func asTile() -> some View {
        modifier(TileModifier())
    }
}

struct TileModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .background(Color.white)
            .cornerRadius(5)
            .shadow(
                color: .init(.sRGB, white: 0.8, opacity: 1),
                radius: 4, x: 0, y: 2
            )
    }
}
