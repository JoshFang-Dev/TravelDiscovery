//
//  RestaurantDetails.swift
//  TravelDiscovery
//
//  Created by Yilei Huang on 2021-06-24.
//  Copyright © 2021 Joshua Fang. All rights reserved.
//

import SwiftUI

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
