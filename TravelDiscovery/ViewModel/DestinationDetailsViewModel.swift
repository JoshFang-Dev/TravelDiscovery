//
//  DestinationDetailsViewModel.swift
//  TravelDiscovery
//
//  Created by Yilei Huang on 2021-06-24.
//  Copyright © 2021 Joshua Fang. All rights reserved.
//

import SwiftUI

class DestinationDetailsViewModel: ObservableObject{
    
    @Published var isLoading = true
    @Published var destiantionDetails: DestinationDetails?
    
    init(name:String){
        let urlString = "https://travel.letsbuildthatapp.com/travel_discovery/destination?name=\(name.lowercased())"
        .addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? ""
        guard let url = URL(string: urlString) else{return}
        URLSession.shared.dataTask(with: url) { (data, resp, err) in
            DispatchQueue.main.async {
                guard let data = data else {return}
                do{
                    self.destiantionDetails = try JSONDecoder().decode(DestinationDetails.self, from: data)
                }catch{
                    print("Failed to decode JSON,",error.localizedDescription)
                }
            }
            
        }.resume()
    }
}



