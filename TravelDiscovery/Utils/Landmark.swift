//
//  Landmark.swift
//  TravelDiscovery
//
//  Created by Yilei Huang on 2020-12-04.
//  Copyright © 2020 Joshua Fang. All rights reserved.
//

import Foundation
import MapKit

struct Landmark {
    let placemark: MKPlacemark
    var id: UUID{
        return UUID()
    }
    
    var name: String{
        self.placemark.name ?? ""
    }
    
    var title: String{
        self.placemark.title ?? ""
    }
    var coordinate: CLLocationCoordinate2D{
        self.placemark.coordinate
    }
}
