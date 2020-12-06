//
//  TrendingCreatorView.swift
//  TravelDiscovery
//
//  Created by Yilei Huang on 2020-11-30.
//  Copyright © 2020 Joshua Fang. All rights reserved.
//

import SwiftUI

struct TrendingCreatorView: View {
    
    let users:[User] = [.init(name: "Amy Adms", imageName: "amy", id: 0),
                        .init(name: "Billy", imageName: "billy", id: 1),
                        .init(name: "Sam Smith", imageName: "sam", id: 2)
    ]

    var body: some View{
        VStack{
            HStack{
                Text("Trending Creators")
                    .font(.system(size: 14, weight: .semibold))
                Spacer()
                Text("See All")
                    .font(.system(size: 12, weight: .semibold))
                    .lineLimit(nil)
            }.padding(.horizontal)
                .padding(.top)
            
            ScrollView(.horizontal, showsIndicators: false){
                HStack(alignment: .top, spacing: 12){
                    CreatorBox(users: self.users)
                }.padding(.horizontal)
                .padding(.bottom)
            }
            
        }
    }
}


struct TrendingCreatorView_Previews: PreviewProvider {
    static var previews: some View {
        TrendingCreatorView()
        DiscoverView()
    }
}
//

struct CreatorBox: View {
    let users: [User]
    var body: some View {
        ForEach(users, id: \.self) { user in
            NavigationLink(
                destination: UserDetailsView(user: user),
                label: {
                    VStack(spacing:4){
                        Image(user.imageName)
                            .resizable()
                            .scaledToFill()
                            .frame(width: HEIGHTSPACE*2.5, height: HEIGHTSPACE*2.5)
                            .background(Color(.init(white:0.9, alpha: 1)) )
                            .cornerRadius(HEIGHTSPACE*2.5)
                            .shadow(color: .gray, radius: 4, x: 0.0, y: 2)
                        Text(user.name)
                            .font(.system(size: 12, weight: .semibold))
                            .multilineTextAlignment(.center)
                            .foregroundColor(Color(.label))
                    }
                    .frame(width: HEIGHTSPACE*2.5)
                })
        }
    }
}
