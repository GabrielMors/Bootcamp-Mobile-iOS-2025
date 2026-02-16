//
//  UserUpdateResponse.swift
//  CamadaNetwork
//
//  Created by Gabriel Mors Pulga on 17/11/25.
//

import Foundation

struct UserUpdateResponse: Codable {
    let id: Int
    let name: String?
    let job: String?
}
