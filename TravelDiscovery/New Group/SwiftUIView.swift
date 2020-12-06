//
//  SwiftUIView.swift
//  TravelDiscovery
//
//  Created by Yilei Huang on 2020-12-04.
//  Copyright © 2020 Joshua Fang. All rights reserved.
//

import SwiftUI
import MapKit

struct SwiftUIView: View{
    @ObservedObject var locationManager = LocationManager()
    @State private var search: String = ""
    @State private var landmarks: [Landmark] = [Landmark]()
    @State private var tapped:Bool = false
    
    private func getNearByLandmarks(){
        let request = MKLocalSearch.Request()
        request.naturalLanguageQuery = search
        
        let search = MKLocalSearch(request: request)
        search.start { (resp, err) in
            if let resp = resp{
                let mapItems = resp.mapItems
                self.landmarks = mapItems.map{
                    Landmark(placemark: $0.placemark)
                }
                
            }
        }
    }
    func calculateOffset() -> CGFloat{
        if self.landmarks.count > 0 && !self.tapped{
            return UIScreen.main.bounds.size.height-UIScreen.main.bounds.size.height/4
        }else if self.tapped{
            return 100
        }else{
            return UIScreen.main.bounds.size.height
        }
    }
    
    var body: some View {
        ZStack(alignment: .top){
            MapView(landmarks:landmarks)
                
            
            TextField("Search", text:$search, onEditingChanged: {_ in})
            {
                self.getNearByLandmarks()
                
            }.textFieldStyle(RoundedBorderTextFieldStyle())
            .padding()
            .offset(y:44)
            
            PlaceListView(landmarks: self.landmarks) {
                self.tapped.toggle()
            }.animation(.spring())
            .offset(y: calculateOffset())
            
            
        }
    }
}

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUIView()
    }
}
