//
//  CategoryDetailsView.swift
//  TravelDiscovery
//
//  Created by Yilei Huang on 2020-11-30.
//  Copyright © 2020 Joshua Fang. All rights reserved.
//

import SwiftUI

import KingfisherSwiftUI
import SDWebImageSwiftUI


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

struct CategoryDetailsView:View {
    
    private let name:String
    @ObservedObject private var vm: CategoryDetailsViewModel
    
    init(name:String) {
        print("newwork requeist for \(name)")
        self.name = name
        self.vm = .init(name: name)
    }
    //Where do I perform my network activity code?
    
   // @ObservedObject var vm = CategoryDetailsViewModel()
    
    @available(iOS 14.0, *)
    var body: some View{
        ZStack{
            if vm.isLoading{
                VStack{
                    ActivityIndeicatorView()
                    Text("Loading..")
                        .foregroundColor(.white)
                        .font(.system(size:16, weight:.semibold))
                }.padding()
                .background(Color.black)
                
                
            }else{
                ZStack{
                    if !vm.errorMessage.isEmpty{
                        VStack(spacing: 12){
                            Image(systemName: "xmark.octagon.fill")
                                .font(.system(size: 64, weight: .semibold) )
                                .foregroundColor(.red)
                            Text(vm.errorMessage)
                        }
                    }else{
                        ScrollView{
                            ForEach(vm.places,id:\.self){ place in
                                VStack(alignment:.leading, spacing:0){
                                //    KFImage(URL(string: place.thumbnail)!)
                                    WebImage(url: URL(string: place.thumbnail) )
                                        .resizable()
                                        .indicator(.activity) // Activity Indicator
                                        .transition(.fade(duration: 0.5))
                                        .scaledToFill()
                                    Text(place.name)
                                        .font(.system(size:12,weight:.semibold))
                                        .padding()
                                    
                                }.asTile()
                                .padding()
                            }
                        }
                    }
                    
                    
                }
                
            }
            
        } .navigationBarTitle(name, displayMode: .inline)
        
    }
}


//struct CategoryDetailsView_Previews: PreviewProvider {
//    static var previews: some View {
//        NavigationView{
//            CategoryDetailsView(name: "")
//        }
//    }
//}
