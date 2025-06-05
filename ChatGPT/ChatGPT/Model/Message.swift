//
//  Message.swift
//  ChatGPT
//
//  Created by Gabriel Mors on 04/06/25.
//

enum TypeMessage {
    case user
    case chatGPT
}

struct Message {
    var message: String
    var typeMessage: TypeMessage
}
