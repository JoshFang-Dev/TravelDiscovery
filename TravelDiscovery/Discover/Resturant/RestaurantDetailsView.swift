//
//  RestaurantDetailView.swift
//  TravelDiscovery
//
//  Created by Yilei Huang on 2020-12-02.
//  Copyright © 2020 Joshua Fang. All rights reserved.
//

import SwiftUI
import KingfisherSwiftUI

struct RestaurantDetails: Decodable {
    let id:Int
    let description,name,city,country,category,thumbnail: String
    let popularDishes: [Dish]
    let reviews: [Review]
    let photos: [String]
}

struct Dish: Decodable, Hashable {
    let name,price,photo:String
    let numPhotos: Int
}

struct Review: Decodable, Hashable {
    let text:String
    let rating:Int
    let user : ReviewUser
}

struct ReviewUser: Decodable, Hashable {
    let username, firstName,lastName,profileImage:String
    let followers,following,id:Int
    let posts: [Post]
}

struct Post: Decodable, Hashable{
    let title,imageUrl,views: String
    let hashtags: [String]
}

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



struct RestaurantDetailsView: View{
    
    @ObservedObject var vm:RestaurantDetailsViewModel
    
    let restaurant: Resturant
    init(restaurant:Resturant) {
        self.restaurant = restaurant
        self.vm = .init(id: self.restaurant.id)
    }
    var body: some View{
        ScrollView{
            
            //topView
            RestDetailTopView(restaurant: vm.details!)
            
            //middle location view
            
            VStack(alignment: .leading, spacing: 8){
                Text("Location & Description")
                    .font(.system(size: 16, weight:.bold))
                Text("Tokyo, Japan")
                HStack{
                    ForEach(0..<5, id:\.self){ num in
                        Image(systemName: "dollarsign.circle.fill")
                    }.foregroundColor(.orange)
                    
                }
                HStack{Spacer()}
            }.padding(.top)
            .padding(.horizontal)
            
            Text(vm.details?.description ?? "")
                .font(.system(size: 14, weight:.regular))
                .padding(.horizontal)
                .padding(.bottom)
            
            // bottom popular dishes
            HStack(){
                Text("Popular Dishes")
                    .font(.system(size: 16, weight:.bold))
                Spacer()
            }.padding(.horizontal)
            
            ScrollView(.horizontal, showsIndicators: false){
                HStack(spacing:HEIGHTSPACE/2){
                    ForEach(vm.details?.popularDishes ?? [], id: \.self) { dish in
                        DishCell(dish: dish)
                    }
                }.padding(.horizontal)
            }
            
            // custoumer reviews
            if let reviews = vm.details?.reviews {
                ReviewBottomView(reviews: reviews)
                    .padding(.top)
            }
            
            
            
            
            
            
        }
        .navigationBarTitle(vm.details!.name, displayMode: .inline)
    }
    
   // let sampleDishPhotos = ["tapas","2"]
}





struct RestaurantDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            RestaurantDetailsView(restaurant: .init(name: "Japan's Finest Tapast", imageName: "tapas", country: "Japan", id: 0))
        }
    }
}


