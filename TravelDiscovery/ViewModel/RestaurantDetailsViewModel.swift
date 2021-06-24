//
//  RestaurantDetailsViewModel.swift
//  TravelDiscovery
//
//  Created by Yilei Huang on 2021-06-24.
//  Copyright © 2021 Joshua Fang. All rights reserved.
//

import SwiftUI


class RestaurantDetailsViewModel: ObservableObject{
    @Published var isLoading = true
    @Published var details: RestaurantDetails?
    init(id:Int){
       
        let urlString = "https://travel.letsbuildthatapp.com/travel_discovery/restaurant?id=\(id)"
       
        guard let url = URL(string: urlString) else {return}
        URLSession.shared.dataTask(with: url) { (data, resp, err) in
            guard let data = data else {return}
            DispatchQueue.main.async {
                self.details = try?JSONDecoder().decode(RestaurantDetails.self, from: data)
                print("loading restaurant: ", self.details?.name)
            }
            
        }.resume()
        
    }
}

