//
//  ChatViewModel.swift
//  ChatGPT
//
//  Created by Gabriel Mors on 04/06/25.
//

import UIKit

class ChatViewModel {
    
    private var messageList: [Message] = []
    
    public var numberOfRowsInSection: Int {
        return messageList.endIndex
    }
    
    public func loadCurrentMessage(_ index: IndexPath) -> Message {
        return messageList[index.row]
    }
    
    public func addMessage(message: String, type: TypeMessage = .user) {
        messageList.insert(Message(message: message.trimmingCharacters(in: .whitespacesAndNewlines), typeMessage: type), at: .zero)
    }
    
    public func heightForRow(index: IndexPath) -> CGFloat {
        let message = loadCurrentMessage(index)
        let font = UIFont.helveticaNeueMedium(size: 16)
        let estimetedheight = message.message.heightWithConstrainedWidth(width: 220, font: font)
        
        return estimetedheight + 65
    }
}
