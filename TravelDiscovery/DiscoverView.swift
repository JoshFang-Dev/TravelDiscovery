//
//  ContentView.swift
//  TravelDiscovery
//
//  Created by Yilei Huang on 2020-11-28.
//  Copyright © 2020 Joshua Fang. All rights reserved.
//

import SwiftUI
struct DiscoverView: View {
    
    init(){
        UINavigationBar.appearance().largeTitleTextAttributes = [
            .foregroundColor:UIColor.white
        ]
    }
    var body: some View {
        NavigationView{
            ZStack{
                
                if #available(iOS 14.0, *) {
                    LinearGradient(gradient: Gradient(colors:[Color(#colorLiteral(red: 0.9736030698, green: 0.7127186656, blue: 0.2694658041, alpha: 1)), Color(#colorLiteral(red: 0.9706799388, green: 0.5768225789, blue: 0.2493174076, alpha: 1))]), startPoint: .top, endPoint: .center)
                        .ignoresSafeArea()
                } else {
                    // Fallback on earlier versions
                }
                
                Color.discoverBackground
                    .offset(y:HEIGHTSPACE*10)
                ScrollView{
                    //search bar
                    HStack{
                        Image(systemName: "magnifyingglass")
                        Text("Where do you want to go?")
                            
                        Spacer()
                    }.font(.system(size:14, weight: .semibold))
                    .foregroundColor(.white)
                    .padding()
                    .background(Color(.init(white: 1.0, alpha: 0.3)))
                    .cornerRadius(10)
                    .padding(16)
                    
                    //top category
                    DiscoverCategoriesView()
                    VStack{
                        PopularDestinationView()
                        PopularRestuarantView()
                        TrendingCreatorView()
                    }
//                    bottmbox setup
                    .background(Color.discoverBackground)
                    .cornerRadius(HEIGHTSPACE/2)
                    .padding(.top,HEIGHTSPACE)
                    
                }
            }
            .navigationBarTitle("Discover")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        DiscoverView()
    }
}
//40.78417894034642, -73.96030985433653
let destinations:[Destination] = [
    .init(name: "Paris", country: "France", imageName: "vancouver", info: "Vancouver, BC is a coastal city on the southwest corner of Canada. Read about its geography, weather, international alliances, and role as the Host", latitude:48.86358094601, longitude:2.296246417698961, attraction: [.init(name: "Arc de Triomphe", imageName: "paris1", latitude: 48.87532409441599, longitude: 2.2952164494359164),.init(name: "Sacré-Cœur", imageName: "paris2", latitude: 48.890450626390056, longitude: 2.3432816350446615)]),
    .init(name: "Tokyo", country: "Japan", imageName: "2", info: "Vancouver, BC is a coastal city on the southwest corner of Canada. Read about its geography, weather, international alliances, and role as the Host", latitude: 35.687126701201144, longitude: 139.7690116381597, attraction: [.init(name: "Meiji Jingu", imageName: "tokyo1", latitude: 35.68489585597972, longitude: 139.69691385974653), .init(name: "Tokyo Skytree", imageName: "tokyo2", latitude: 35.71500700234045, longitude: 139.81227030520753)
    ]
),
    .init(name: "New York", country: "US", imageName: "3", info: "Located in the spectacular Coast Mountains of British Columbia just two hours north of Vancouver, Whistler is Canada’s favourite year-round destination. There are two majestic mountains with a vibrant base Village, epic skiing and snowboarding, four championship golf courses, unbeatable shopping, restaurants and bars, accommodation to suit every budget, hiking trails, spas and arguably the best mountain bike park in the world. Dive in and discover Whistler for yourself:", latitude: 40.76583209520241, longitude: -73.9852057037487, attraction: [.init(name: "Empire State Building", imageName: "newyork1", latitude: 40.75167734101037, longitude: -73.9864671395415), .init(name: "Solomon R. Guggenheim Museum", imageName: "newyork2", latitude: 40.78417894034642, longitude: -73.96030985433653)] ),
]
let resturants :[Resturant] = [
    .init(name: "Japan's Finest Tapas", imageName: "tapas", country: "", id:0),
    .init(name: "Bar & Grill", imageName: "bar_grill", country: "", id: 1),
]













