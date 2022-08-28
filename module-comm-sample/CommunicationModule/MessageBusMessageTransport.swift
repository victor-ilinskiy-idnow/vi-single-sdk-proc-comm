//
//  MessageBusTransport.swift
//  CommunicationModule
//
//  Created by VI_Business on 26.08.22.
//

import Foundation

class MessageBusMessageTransport: MessageTransport {
    static let shared = MessageBusMessageTransport()
    private var bus: [String: [MessageTransportCancelToken]] = [:]
    private var subscribers: [MessageTransportCancelToken: MessageTransportListener] = [:]
    private let notificationQueue: OperationQueue
    
    init() {
        notificationQueue = OperationQueue()
        notificationQueue.maxConcurrentOperationCount = 1
    }
    
    func sendMessage(message: CommMessage) {
        notificationQueue.addOperation { [weak self] in
            self?.bus[message.type]?.forEach { token in
                guard let subscriber = self?.subscribers[token] else {
                    return
                }
                
                subscriber(message)
            }
        }
    }
    
    func startListenMessages(types: [String], listener: @escaping (CommMessage) -> Void) -> MessageTransportCancelToken {
        let token = UUID().uuidString
        notificationQueue.addOperation { [weak self] in
            self?.subscribers[token] = listener
            
            types.forEach { type in
                if (self?.bus[type]?.append(token) == nil) {
                    self?.bus[type] = [token]
                }
            }
        }
        
        return token
    }
    
    func stopListenMassages(token: MessageTransportCancelToken) {
        notificationQueue.addOperation { [weak self] in
            self?.bus.keys.forEach { key in
                self?.bus[key]?.removeAll(where: {$0 == token})
            }
            
            self?.subscribers[token] = nil
        }
    }
}
