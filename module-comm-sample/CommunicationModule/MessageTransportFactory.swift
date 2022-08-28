//
//  File.swift
//  CommunicationModule
//
//  Created by VI_Business on 27.08.22.
//

import Foundation

public enum TransportType: CaseIterable {
    case notificationCenter
    case messageBus
}

public class MessageTransportFactory {
    public static func createTransport(type: TransportType) -> MessageTransport {
        switch type {
        case .notificationCenter:
            return NotificationCenterMessageTransport.shared
        case .messageBus:
            return MessageBusMessageTransport.shared
        }
    }
}
