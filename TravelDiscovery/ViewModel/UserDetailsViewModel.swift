//
//  UserDetailsViewModel.swift
//  TravelDiscovery
//
//  Created by Yilei Huang on 2021-06-24.
//  Copyright © 2021 Joshua Fang. All rights reserved.
//

import SwiftUI

class UserDetailsViewModel: ObservableObject {
    
    @Published var userDetails: UserDetails?
    
    init(userId: Int) {
        // network code
        
        guard let url = URL(string: "https://travel.letsbuildthatapp.com/travel_discovery/user?id=\(userId)") else { return }
        
        URLSession.shared.dataTask(with: url) { (data, resp, err) in
            
            DispatchQueue.main.async {
                guard let data = data else { return }
                do {
                    self.userDetails = try JSONDecoder().decode(UserDetails.self, from: data)
                } catch let jsonError {
                    print("Decoding failed for UserDetails:", jsonError)
                }
                print(data)
            }
            
        }.resume()
    }
    
}
