//
//  ReviewBottomView.swift
//  TravelDiscovery
//
//  Created by Yilei Huang on 2020-12-03.
//  Copyright © 2020 Joshua Fang. All rights reserved.
//

import SwiftUI
import KingfisherSwiftUI

struct ReviewBottomView: View {
    let reviews: [Review]
    var body: some View{
        HStack(){
            Text("Customer Reviews")
                .font(.system(size: 16, weight:.bold))
            Spacer()
        }.padding(.horizontal)
        //  if let reviews = vm.details?.reviews {
        ForEach(reviews, id: \.self){ review in
            VStack(alignment:.leading){
                HStack(){
                    KFImage(URL(string: review.user.profileImage))
                        .resizable()
                        .scaledToFit()
                        .frame(width:HEIGHTSPACE*2)
                        .clipShape(Circle())
                    
                    VStack(alignment:.leading, spacing:4){
                        Text("\(review.user.firstName) \(review.user.lastName)")
                            .font(.system(size: 14, weight:.bold))
                        HStack(spacing:2){
                            ForEach(0..<review.rating,id:\.self){ star in
                                Image(systemName: "star.fill")
                            }.foregroundColor(.orange)
                            let time = 5 - review.rating
                            ForEach(0..<time,id:\.self){ star in
                                Image(systemName: "star.fill")
                            }.foregroundColor(.gray)
                        }
                        .font(.system(size:12))
                        
                    }
                    Spacer()
                    Text("Dec 2020")
                        .font(.system(size: 14, weight:.bold))
                    
                }
                Text(review.text)
                    .font(.system(size: 14, weight:.regular))
            }
            
        }
        .padding(.horizontal)
    }
}

//struct ReviewBottomView_Previews: PreviewProvider {
//    static var previews: some View {
//        ReviewBottomView(reviews: [Review()])
//    }
//}
