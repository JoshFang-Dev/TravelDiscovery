//
//  PopularDestinationView.swift
//  TravelDiscovery
//
//  Created by Yilei Huang on 2020-11-30.
//  Copyright © 2020 Joshua Fang. All rights reserved.
//

import SwiftUI
import MapKit

struct PopularDestinationView: View {
    
    var body: some View{
        VStack{
            HStack{
                Text("Popular Destinations")
                    .font(.system(size: 14, weight: .semibold))
                Spacer()
                Text("See All")
                    .font(.system(size: 12, weight: .semibold))
                    .lineLimit(nil)
            }.padding(.horizontal)
                .padding(.top)
            
            ScrollView(.horizontal, showsIndicators: false){
                HStack(spacing: 8.0){
                    ForEach(0..<3, id: \.self) { num in
                        NavigationLink(
                            destination:
                                NavigationLazyView(PopularDestinationDetailsView(destination: destinations[num])),
                            label: {
                                PopularDestinationBox(destination: destinations[num])
                                    .padding(.bottom)
                            })
                        
                    }
                }.padding(.horizontal)
            }
            
        }
    }
}









struct PopularDestinationView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            PopularDestinationDetailsView(destination: .init(name: "Parius", country: "France", imageName: "eiffel_tower", info: "", latitude:48.86064473141706, longitude:2.297619224300003, attraction: [Attraction]()))
                
        }
        HomeView()
    
        
    }
}
