//
//  CategoryDetailsViewModel.swift
//  TravelDiscovery
//
//  Created by Yilei Huang on 2021-06-24.
//  Copyright © 2021 Joshua Fang. All rights reserved.
//

import SwiftUI

class CategoryDetailsViewModel: ObservableObject{
    @Published var isLoading = true
    @Published var places = [Place]()
    @Published var errorMessage = ""
    init(name: String) {
        
        //net work code
        
        let urlString = "https://travel.letsbuildthatapp.com/travel_discovery/category?name=\(name.lowercased())"
            .addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? ""
        guard let url = URL(string: urlString) else{
            self.isLoading = false
            return}
        URLSession.shared.dataTask(with: url) { (data, resp, err) in
            
            //you want to check resp statuscode and err
            DispatchQueue.main.asyncAfter(deadline: .now()+1) {
                if let statusCode = (resp as? HTTPURLResponse)?.statusCode,
                   statusCode >= 400{
                    self.isLoading = false
                    self.errorMessage = "Bad status: \(statusCode)"
                    return
                }
                guard let data = data else{return}
                do{
                    self.places = try JSONDecoder().decode([Place].self, from: data)
                }catch{
                    debugPrint("Failed to decode Json: ",error)
                    self.errorMessage = error.localizedDescription
                }
                self.isLoading = false
            }
        }.resume() // make sure to have resume
        
    }
}

