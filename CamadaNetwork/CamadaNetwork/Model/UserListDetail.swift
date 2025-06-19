//
//  UserListDetail.swift
//  CamadaNetwork
//
//  Created by Gabriel Mors on 18/06/25.
//

import UIKit

struct UserListDetail: Codable {
    var data: [User]
}

struct User: Codable {
    var id: Int
    var email, firstName, lastName: String
    var avatar: String
    
    enum CodingKeys: String, CodingKey {
        case id, email
        case firstName = "first_name"
        case lastName = "last_name"
        case avatar
    }
}
