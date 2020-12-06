//
//  TileModifier.swift
//  TravelDiscovery
//
//  Created by Yilei Huang on 2020-11-30.
//  Copyright © 2020 Joshua Fang. All rights reserved.
//

import SwiftUI

extension View{
    func asTile() -> some View{
        modifier(TileModifer())
    }
}

struct TileModifer: ViewModifier{
    func body(content: Content) -> some View {
        content
        .background(Color.white )
            .cornerRadius(5)
        .shadow(color: .init(.sRGB, white: 0.6, opacity: 1), radius: 4, x: 0.0, y: 2)
    }
}


extension Color {
    static let discoverBackground = Color(.init(white:0.95, alpha: 1))
}
