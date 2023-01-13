//
//  Post.swift
//  Module-Demo
//
//  Created by cleanmac on 13/01/23.
//

import Foundation

struct Post: Decodable {
    var userId: Int
    var postId: Int
    var title: String
    var body: String
    
    private enum CodingKeys: String, CodingKey {
        case userId
        case postId = "id"
        case title
        case body
    }
}
