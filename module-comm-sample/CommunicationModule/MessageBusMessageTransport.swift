//
//  MessageBusTransport.swift
//  CommunicationModule
//
//  Created by VI_Business on 26.08.22.
//

import Foundation

public class MessageBusMessageTransport: MessageTransport {
    static let shared = MessageBusMessageTransport()
    
    func sendMessage(message: CommMessage) {
        
    }
    
    func startListenMessages(listener: (CommMessage) -> Void) -> MessageTransportCancelToken {
        return ""
    }
    
    func stopListenMassages(token: MessageTransportCancelToken) {
        
    }
}
