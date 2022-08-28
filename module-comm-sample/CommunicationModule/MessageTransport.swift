//
//  File.swift
//  CommunicationModule
//
//  Created by VI_Business on 27.08.22.
//

import Foundation

public typealias MessageTransportListener = (CommMessage) -> Void
public typealias MessageTransportCancelToken = String

public protocol MessageTransport {
    func sendMessage(message: CommMessage)
    func startListenMessages(types: [String], listener: @escaping MessageTransportListener) -> MessageTransportCancelToken
    func stopListenMassages(token: MessageTransportCancelToken)
}
