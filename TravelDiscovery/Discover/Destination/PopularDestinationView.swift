//
//  PopularDestinationView.swift
//  TravelDiscovery
//
//  Created by Yilei Huang on 2020-11-30.
//  Copyright © 2020 Joshua Fang. All rights reserved.
//

import SwiftUI
import MapKit

struct PopularDestinationView: View {
    
    var body: some View{
        VStack{
            HStack{
                Text("Popular Destinations")
                    .font(.system(size: 14, weight: .semibold))
                Spacer()
                Text("See All")
                    .font(.system(size: 12, weight: .semibold))
                    .lineLimit(nil)
            }.padding(.horizontal)
                .padding(.top)
            
            ScrollView(.horizontal, showsIndicators: false){
                HStack(spacing: 8.0){
                    ForEach(0..<3, id: \.self) { num in
                        NavigationLink(
                            destination:
                                NavigationLazyView(PopularDestinationDetailsView(destination: destinations[num])),
                            label: {
                                PopularDestinationBox(destination: destinations[num])
                                    .padding(.bottom)
                            })
                        
                    }
                }.padding(.horizontal)
            }
            
        }
    }
}

struct DestinationDetails: Decodable{
    let photos:[String]
    let description: String
    
}

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



struct CustomMapAnnotation:View{
    let attration: Attraction
    var body: some View{
        VStack{
            Image(attration.imageName)
                .resizable()
                .frame(width:HEIGHTSPACE*3.5, height:HEIGHTSPACE*2.5)
                .cornerRadius(4)
                .overlay(RoundedRectangle(cornerRadius: 4)
                            .stroke(Color(.init(white: 0, alpha: 0.5))))
                
            Text(attration.name)
                .padding(.horizontal, 6)
                .padding(.vertical, 4)
                .background(LinearGradient(gradient:Gradient(colors:[Color.red,Color.blue]), startPoint: .leading, endPoint: .trailing))
                .foregroundColor(.white)
                //.border(Color.black)
                .cornerRadius(4)
                .overlay(RoundedRectangle(cornerRadius: 4)
                            .stroke(Color(.init(white: 0, alpha: 0.5))))
            
        }.shadow(radius: 5)
    }
}



struct PopularDestinationBox:View{
    let destination: Destination
    var body: some View{
        VStack(alignment: .leading, spacing: 0){
            Image(destination.imageName)
                .resizable()
                .scaledToFill()
                .frame(width: HEIGHTSPACE*5, height: HEIGHTSPACE*5)
                .cornerRadius(4)
                .padding(.horizontal, 6)
                .padding(.vertical, 6)
            Text(destination.name)
                .font(.system(size: 12, weight: .semibold))
                .padding(.horizontal, 12)
                .foregroundColor(Color(.label))
            Text(destination.country)
                .font(.system(size: 12, weight: .semibold))
                .padding(.horizontal, 12)
                .padding(.bottom, 8)
                .foregroundColor(.gray)
        }
        .asTile()
    }
}
struct PopularDestinationView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            PopularDestinationDetailsView(destination: .init(name: "Parius", country: "France", imageName: "eiffel_tower", info: "", latitude:48.86064473141706, longitude:2.297619224300003, attraction: [Attraction]()))
                
        }
        DiscoverView()
    
        
    }
}
