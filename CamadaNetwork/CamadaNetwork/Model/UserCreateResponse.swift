//
//  UserCreateResponse.swift
//  CamadaNetwork
//
//  Created by Gabriel Mors Pulga on 20/06/25.
//

import Foundation

struct UserCreateResponse: Codable {
    let id: Int
    let name: String?
    let job: String?
}
