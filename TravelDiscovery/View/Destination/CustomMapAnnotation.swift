//
//  CustomMapAnnotation.swift
//  TravelDiscovery
//
//  Created by Yilei Huang on 2021-06-24.
//  Copyright © 2021 Joshua Fang. All rights reserved.
//

import SwiftUI

struct CustomMapAnnotation:View{
    let attration: Attraction
    var body: some View{
        VStack{
            Image(attration.imageName)
                .resizable()
                .frame(width:HEIGHTSPACE*3.5, height:HEIGHTSPACE*2.5)
                .cornerRadius(4)
                .overlay(RoundedRectangle(cornerRadius: 4)
                            .stroke(Color(.init(white: 0, alpha: 0.5))))
                
            Text(attration.name)
                .padding(.horizontal, 6)
                .padding(.vertical, 4)
                .background(LinearGradient(gradient:Gradient(colors:[Color.red,Color.blue]), startPoint: .leading, endPoint: .trailing))
                .foregroundColor(.white)
                //.border(Color.black)
                .cornerRadius(4)
                .overlay(RoundedRectangle(cornerRadius: 4)
                            .stroke(Color(.init(white: 0, alpha: 0.5))))
            
        }.shadow(radius: 5)
    }
}
