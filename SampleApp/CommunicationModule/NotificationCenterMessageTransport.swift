//
//  NotificationCenterTransport.swift
//  CommunicationModule
//
//  Created by VI_Business on 26.08.22.
//

import Foundation

class NotificationCenterMessageTransport: MessageTransport {
    static let shared = NotificationCenterMessageTransport()
    
    private let notificationCenter = NotificationCenter()
    
    func sendMessage(message: CommMessage) {
        
    }
    
    func startListenMessages(listener: (CommMessage) -> Void) -> MessageTransportCancelToken {
        return ""
    }
    
    func stopListenMassages(token: MessageTransportCancelToken) {
        
    }
    
    
}
