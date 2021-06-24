//
//  ResturantBox.swift
//  TravelDiscovery
//
//  Created by Yilei Huang on 2021-06-24.
//  Copyright © 2021 Joshua Fang. All rights reserved.
//

import SwiftUI

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
