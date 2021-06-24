//
//  DishCell.swift
//  TravelDiscovery
//
//  Created by Yilei Huang on 2020-12-03.
//  Copyright © 2020 Joshua Fang. All rights reserved.
//

import SwiftUI
import KingfisherSwiftUI

struct DishCell:View{
    let dish: Dish
    var body: some View{
        VStack(alignment: .leading){
            ZStack(alignment: .bottomLeading){
                KFImage(URL(string: dish.photo))
                    .resizable()
                    .scaledToFill()
                    .overlay(RoundedRectangle(cornerRadius: 5).stroke(Color.gray))
                    .shadow(radius: 2 )
                    .padding(.vertical, 2)
                
                LinearGradient(gradient: Gradient(colors: [Color.clear, Color.black]), startPoint: .center, endPoint: .bottom)
                
                Text(dish.price)
                    .foregroundColor(.white)
                    .font(.system(size:13, weight:.bold))
                    .padding(.horizontal, 6)
                    .padding(.bottom, 4)
            }
            .frame(height:HEIGHTSPACE*4)
            .cornerRadius(5)
           
            
            Text(dish.name)
                .font(.system(size: 14, weight:.bold))
            
            Text("\(dish.numPhotos) photos")
                .foregroundColor(.gray)
                .font(.system(size: 12, weight:.regular))
        }
    }
}


