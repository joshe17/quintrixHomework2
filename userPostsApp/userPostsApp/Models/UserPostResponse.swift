//
//  UserResponse.swift
//  userPostsApp
//
//  Created by Joshua Ho on 6/21/23.
//

import Foundation

struct UserPost: Decodable, Identifiable {
    let id: Int
    let userId: Int
    let title: String
    let body: String
    
    private enum CodingKeys: String, CodingKey {
        case id = "id"
        case userId = "userId"
        case title = "title"
        case body = "body"
    }
}
