//
//  Attraction.swift
//  TravelDiscovery
//
//  Created by Yilei Huang on 2020-12-02.
//  Copyright © 2020 Joshua Fang. All rights reserved.
//

import Foundation
struct Attraction:Identifiable{
    var id = UUID().uuidString
    
    let name,imageName:String
    let latitude, longitude:Double
}
