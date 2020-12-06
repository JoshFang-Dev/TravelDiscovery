//
//  DiscoverCategoriesView.swift
//  TravelDiscovery
//
//  Created by Yilei Huang on 2020-11-30.
//  Copyright © 2020 Joshua Fang. All rights reserved.
//

import SwiftUI

struct NavigationLazyView<T: View>: View {
    let build: () -> T
    init(_ build: @autoclosure @escaping () -> T) {
        self.build = build
    }
    var body: T {
        build()
    }
}

struct DiscoverCategoriesView: View {
    let categories:[Category] = [
        .init(name: "Art", imageName: "paintpalette.fill"),
        .init(name: "Sports", imageName: "sportscourt.fill"),
        .init(name: "Live Events", imageName: "music.mic"),
        .init(name: "Food", imageName: "tray.fill"),
        .init(name: "History", imageName: "books.vertical.fill"),
    ]
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(alignment: .top, spacing:14){
                ForEach(categories, id: \.self) { category in
                    NavigationLink(
                        destination: NavigationLazyView(CategoryDetailsView(name: category.name)),
                        label: {
                            VStack(spacing:8){
                                // Spacer()
                                Image(systemName: category.imageName)
                                    .font(.system(size: 20))
                                    .foregroundColor(Color(#colorLiteral(red: 0.9709280133, green: 0.5917922854, blue: 0.246740669, alpha: 1)))
                                    .frame(width: HEIGHTSPACE*2.5, height: HEIGHTSPACE*2.5)
                                    .background(Color.white)
                                    .cornerRadius(HEIGHTSPACE*2.5)
                                // .shadow(color: .gray, radius: 4, x: 0.0, y: 2)
                                Text(category.name)
                                    .font(.system(size: 12, weight: .semibold))
                                    .multilineTextAlignment(.center)
                                    .foregroundColor(.white)
                            }
                        })
                    
                }
                
            }.padding(.horizontal)
        }
    }
}





struct DiscoverCategoriesView_Previews: PreviewProvider {
    static var previews: some View {
        DiscoverView()
    }
}
