//
//  Destination.swift
//  TravelDiscovery
//
//  Created by Yilei Huang on 2020-11-29.
//  Copyright © 2020 Joshua Fang. All rights reserved.
//

import Foundation
import UIKit
//struct Destination: Hashable{
//    var name, country, imageName:String?
//    var latitude, longitude:Double?
//
//    init(dictionary:[String:Any]) {
//        self.name = dictionary["name"] as? String
//        self.country = dictionary["country"] as? String
//        self.imageName = dictionary["imageName"] as? String
//        seslf.latitude = dictionary["latitude"] as? Double
//        self.longitude = dictionary["longitude"] as? Double
//    }
//}
//

struct Destination{
    //var id: ObjectIdentifier
    
   
    
    var name, country, imageName, info:String
    var latitude, longitude:Double
    
    var attraction: [Attraction]


}
