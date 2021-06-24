//
//  UserDetails.swift
//  TravelDiscovery
//
//  Created by Yilei Huang on 2021-06-24.
//  Copyright © 2021 Joshua Fang. All rights reserved.
//

import SwiftUI

struct UserDetails: Decodable {
    let username, firstName, lastName, profileImage: String
    let followers, following: Int
    let posts: [Posted]
}

struct Posted: Decodable, Hashable {
    let title, imageUrl, views: String
    let hashtags: [String]
}
