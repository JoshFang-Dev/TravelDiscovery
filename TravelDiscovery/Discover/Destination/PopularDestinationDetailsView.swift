//
//  DestionationDetailView.swift
//  TravelDiscovery
//
//  Created by Yilei Huang on 2020-12-02.
//  Copyright © 2020 Joshua Fang. All rights reserved.
//

import SwiftUI
import MapKit

struct PopularDestinationDetailsView: View{
    @ObservedObject var vm:DestinationDetailsViewModel
    
    let destination: Destination
    
//    var region: MKCoordinateRegion
    @State var region: MKCoordinateRegion
    @State var isShowingAttrations = true
    
    init(destination:Destination) {
        self.destination = destination
        self._region = State(initialValue: MKCoordinateRegion(center: .init(latitude:self.destination.latitude, longitude:self.destination.longitude), span: .init(latitudeDelta: 0.2, longitudeDelta: 0.2)))
        self.vm = .init(name: destination.name)
        print("Destination city requested:",destination.name)
    }
    
    var body: some View{
        ScrollView{
//top pvc
            if let photos = vm.destiantionDetails?.photos{
                DestinationHeaderContainer(imageUrlString: photos)
                .frame(height:HEIGHTSPACE*10)
            }
            VStack(alignment: .leading){
                Text(destination.name)
                    .font(.system(size:18,weight:.bold))
                Text(destination.country)
                HStack{
                    ForEach(0..<5,id:\.self) { num in
                        Image(systemName: "star.fill")
                            .foregroundColor(.orange)
                    }
                }.padding(.top,2)
                
                HStack{
//                    Text(destination.info)
                    Text(vm.destiantionDetails?.description ?? "")
                        .padding(.top,4)
                        .font(.system(size:14))
                    Spacer()
                }
            }
            .padding(.horizontal)
            
            HStack{
                Text("Location")
                    .font(.system(size: 18, weight: .semibold))
                Spacer()
                
                Button(action:{ isShowingAttrations.toggle() },label:{
                    Text("\(isShowingAttrations ? "Hide" : "Show") Attrations")
                        .font(.system(size:14, weight:.semibold))
                })
                Toggle("", isOn: $isShowingAttrations)
                    .labelsHidden()
            }.padding(.horizontal)
                
            
 //bottom Maps
            Map(coordinateRegion: $region, annotationItems: isShowingAttrations ? destination.attraction:[]) { attration in
                MapAnnotation(coordinate: .init(latitude: attration.latitude, longitude: attration.longitude)){
                    CustomMapAnnotation(attration: attration)
                   
                }
                
            }
            .frame(height:HEIGHTSPACE*12)
        }.navigationBarTitle(destination.name,displayMode: .inline)
    }
  
    let attrations: [Attraction] = [
       // 50.067827472166265, -122.95894709245864
       // 40.709642454744966, -74.05112367258354
        .init(name: "Whistler MT", imageName: "whistlerMountain", latitude:48.8566, longitude:2.35),
        .init(name: "Mt Currie", imageName: "mt_currie", latitude:35.67988, longitude:139.769584),
        .init(name: "Blackcomb Peak", imageName: "blackcomb", latitude:40.709642454744966, longitude:-74.05112367258354)
    ]
}
struct PopularDestinationDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        DiscoverView()
        //PopularDestinationDetailsView(destination: )
    }
}
