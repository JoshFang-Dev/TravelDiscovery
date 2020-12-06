//
//  RestaurantDetailTop.swift
//  TravelDiscovery
//
//  Created by Yilei Huang on 2020-12-03.
//  Copyright © 2020 Joshua Fang. All rights reserved.
//

import SwiftUI
import KingfisherSwiftUI

struct RestDetailTopView: View {
    let restaurant: RestaurantDetails
    var body: some View {
        ZStack(alignment: .bottomLeading){
           
            KFImage(URL(string: restaurant.thumbnail))
                .resizable()
                .scaledToFill()
            
            LinearGradient(gradient: Gradient(colors: [Color.clear, Color.black]), startPoint: .center, endPoint: .bottom)
            
            
            HStack{
                VStack(alignment:.leading, spacing: 4){
                    Text(restaurant.name)
                        .foregroundColor(.white)
                        .font(.system(size: 18, weight:.bold))
                    HStack{
                        ForEach(0..<5, id:\.self){ num in
                            Image(systemName: "star.fill")
                        }.foregroundColor(.orange)
                    }
                }
                
                Spacer()
                
                NavigationLink(
                    destination: RestInnerPhotosView(photoUrls: restaurant.photos),
                    label: {
                        Text("See more photos")
                            .foregroundColor(.white)
                            .font(.system(size: 14, weight:.bold))
                            .frame(width:WIDTHSPACE*3)
                            .multilineTextAlignment(.trailing)
                    })
                
               
            }.padding()
            
        }
    }
}

struct RestDetailTopView_Previews: PreviewProvider {
    static var previews: some View {
        DiscoverView()
       // RestDetailTopView(restaurant: resturants[0])
    }
}
