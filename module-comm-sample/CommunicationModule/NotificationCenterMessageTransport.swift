//
//  NotificationCenterTransport.swift
//  CommunicationModule
//
//  Created by VI_Business on 26.08.22.
//

import Foundation

class NotificationCenterMessageTransport: MessageTransport {
    static let shared = NotificationCenterMessageTransport()
    private let notificationQueue: OperationQueue
    private let notificationCenter = NotificationCenter()
    private var subscribers: [String: [AnyObject]] = [:]
    
    init() {
        notificationQueue = OperationQueue()
        notificationQueue.maxConcurrentOperationCount = 1
    }
    
    func sendMessage(message: CommMessage) {
        notificationCenter.post(name: Notification.Name(message.type), object: message)
    }
    
    func startListenMessages(types: [String], listener: @escaping (CommMessage) -> Void) -> MessageTransportCancelToken {
        let listeners = types.map { type in
            notificationCenter.addObserver(
                forName: Notification.Name(type),
                object: nil,
                queue: self.notificationQueue) { notif in
                    listener(notif.object as! CommMessage)
                }
        }
        
        let key = UUID().uuidString
        
        notificationQueue.addOperation { [weak self] in
            self?.subscribers[key] = listeners
        }
        
        return key
    }
    
    func stopListenMassages(token: MessageTransportCancelToken) {
        guard let listeners = subscribers[token] else {
            return
        }
        
        listeners.forEach { notificationCenter.removeObserver($0) }
        
        notificationQueue.addOperation { [weak self] in
            self?.subscribers[token] = nil
        }
    }
}
