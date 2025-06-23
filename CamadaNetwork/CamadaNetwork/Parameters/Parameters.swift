//
//  Parameters.swift
//  CamadaNetwork
//
//  Created by Gabriel Mors Pulga on 23/06/25.
//


import Foundation

enum Parameters {
    case dictianary([String: Any])
    case encodable(Encodable)
}


//let resquet = APIRequest(
//    url: "/login",
//    method: .post,
//    headers: ["Content-Type:": "Aplication/JSON"],
//    parameters: .encodable(Login(email: "gabriel@gmail.com", password: "123456"))
//
//)
//
//    .parameters(.dictianary([
//        "email": "gabreil@gmail.com",
//        "password": "123456"
//        
//)


//"""
//{
//    "email": "gabriel@gmail.com"
//    "password": "123456"
//}
//"""
