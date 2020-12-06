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



struct ResturantBox: View{
    
    let restaurant: Resturant
    
    var body: some View{
        HStack{
            Image(restaurant.imageName)
                .resizable()
                .scaledToFill()
                .frame(width: HEIGHTSPACE*2.5, height: HEIGHTSPACE*2.5)
                .cornerRadius(4)
                .padding(.horizontal, 6)
                .padding(.vertical, 6)
            
            VStack(alignment: .leading, spacing:HEIGHTSPACE/2){
                HStack{
                    Text(restaurant.name)
                    //Spacer()
                    Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                        Image(systemName: "ellipsis")
                            .foregroundColor(.gray)
                    })
                }
                HStack{
                    Image(systemName: "star.fill")
                    Text("4.7 • sushi • $$")
                }
                Text("tokyo, Japan")
            }.font(.system(size: 12, weight: .semibold))
            
        }
        .asTile()
    }
    
}


struct PopularRestuarantView_Previews: PreviewProvider {
    static var previews: some View {
     //   PopularRestuarantView()
        DiscoverView()
    }
}
