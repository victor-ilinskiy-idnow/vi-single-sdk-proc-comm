//
//  File.swift
//  CommunicationModule
//
//  Created by VI_Business on 27.08.22.
//

import Foundation

typealias MessageTransportListener = (CommMessage) -> Void
typealias MessageTransportCancelToken = String

protocol MessageTransport {
    func sendMessage(message: CommMessage)
    func startListenMessages(types: [String], listener: @escaping MessageTransportListener) -> MessageTransportCancelToken
    func stopListenMassages(token: MessageTransportCancelToken)
}
