//
//  PlaceListView.swift
//  TravelDiscovery
//
//  Created by Yilei Huang on 2020-12-04.
//  Copyright © 2020 Joshua Fang. All rights reserved.
//

import SwiftUI
import MapKit

struct PlaceListView: View {
    let landmarks:[Landmark]
    var onTap:()->()
    
    
    var body: some View {
        VStack(alignment:.leading){
            HStack{
                EmptyView()
            }.frame(width: UIScreen.main.bounds.size.width, height: 60)
            .background(Color.gray)
            .gesture(TapGesture().onEnded(self.onTap))
            
            
            List{
                ForEach(self.landmarks, id:\.id){ landmark in
                    VStack(alignment: .leading){
                        Text(landmark.name)
                            .fontWeight(.bold)
                        //Text(landmark.title)
                    }
                }
            }.animation(nil)
        }
        
    }
}

struct PlaceListView_Previews: PreviewProvider {
    static var previews: some View {
        PlaceListView(landmarks: [Landmark(placemark: MKPlacemark())], onTap: {})
    }
}
