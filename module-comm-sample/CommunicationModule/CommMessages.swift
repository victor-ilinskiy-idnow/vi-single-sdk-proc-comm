//
//  Event.swift
//  CommunicationModule
//
//  Created by VI_Business on 26.08.22.
//

import Foundation

public struct CommMessage {
    public let type: String
    public let payload: Data
    
    public init(type: String, payload: Data) {
        self.type = type
        self.payload = payload
    }
}

extension CommMessage: CustomStringConvertible {
    public var description: String {
        return "Type:\(type)\nPayload:\((try? JSONSerialization.jsonObject(with: payload)) ?? "invalid json")"
    }
}

public enum MessageTypes: String {
    case helloToModuleA
    case helloToModuleB
    case answerFromModuleA
    case answerFromModuleB
}
