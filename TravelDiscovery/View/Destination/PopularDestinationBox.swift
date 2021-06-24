//
//  PopularDestinationBox.swift
//  TravelDiscovery
//
//  Created by Yilei Huang on 2021-06-24.
//  Copyright © 2021 Joshua Fang. All rights reserved.
//

import SwiftUI

struct PopularDestinationBox:View{
    let destination: Destination
    var body: some View{
        VStack(alignment: .leading, spacing: 0){
            Image(destination.imageName)
                .resizable()
                .scaledToFill()
                .frame(width: HEIGHTSPACE*5, height: HEIGHTSPACE*5)
                .cornerRadius(4)
                .padding(.horizontal, 6)
                .padding(.vertical, 6)
            Text(destination.name)
                .font(.system(size: 12, weight: .semibold))
                .padding(.horizontal, 12)
                .foregroundColor(Color(.label))
            Text(destination.country)
                .font(.system(size: 12, weight: .semibold))
                .padding(.horizontal, 12)
                .padding(.bottom, 8)
                .foregroundColor(.gray)
                //.asTile()
        }
        .asTile()
    }
}
