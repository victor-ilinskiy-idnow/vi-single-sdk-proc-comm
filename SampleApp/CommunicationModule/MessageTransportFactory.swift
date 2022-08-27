//
//  File.swift
//  CommunicationModule
//
//  Created by VI_Business on 27.08.22.
//

import Foundation

public class MessageTransportFactory {
    enum TransportType {
        case notificationCenter
        case messageBus
    }
    
    func createTransport(type: TransportType) -> MessageTransport {
        switch type {
        case .notificationCenter:
            return NotificationCenterMessageTransport.shared
        case .messageBus:
            return MessageBusMessageTransport.shared
        }
    }
}
