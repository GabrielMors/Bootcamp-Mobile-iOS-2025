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


// MARK: - Response
struct Response: Codable {
    let id, object: String
    let model: String
    let choices: [Choice]
}

// MARK: - Choice
struct Choice: Codable {
    let message: MessageElement
}

struct Request: Encodable {
    let model: String
    let messages: [MessageElement]
    let temperature: Double
}

struct MessageElement: Codable {
    let role, content: String
}
