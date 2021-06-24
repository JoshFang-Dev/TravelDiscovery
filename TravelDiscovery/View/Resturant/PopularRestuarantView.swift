//
//  PopularRestuarantView.swift
//  TravelDiscovery
//
//  Created by Yilei Huang on 2020-11-30.
//  Copyright © 2020 Joshua Fang. All rights reserved.
//

import SwiftUI

struct PopularRestuarantView: View {
    var body: some View{
        VStack{
            HStack{
                Text("Popular places to eat")
                    .font(.system(size: 14, weight: .semibold))
                Spacer()
                Text("See All")
                    .font(.system(size: 12, weight: .semibold))
                    .lineLimit(nil)
            }.padding(.horizontal)
                .padding(.top)
            
            ScrollView(.horizontal, showsIndicators:false){
                HStack(spacing: 8.0){
                    ForEach(resturants, id: \.self) { restaurant in
                        
                        NavigationLink(
                            destination: RestaurantDetailsView(restaurant: restaurant),
                            label: {
                                ResturantBox(restaurant: restaurant)
                                    .foregroundColor(Color(.label))
                            })
                        
                        
                        
//                        Spacer()
                    }
                    
                }.padding(.horizontal)
                .padding(.bottom)
            }
            
        }
    }
}






struct PopularRestuarantView_Previews: PreviewProvider {
    static var previews: some View {
     //   PopularRestuarantView()
        HomeView()
    }
}
