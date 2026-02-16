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
    let id: Int
    let job, email, firstName: String
}

