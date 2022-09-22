//
//  ModuleAEngine.swift
//  ModuleA
//
//  Created by VI_Business on 28.08.22.
//

import Foundation
@_implementationOnly import CommunicationModule

class ModuleAEngine {
    static let sharedInstance = ModuleAEngine()
    private var cancelToken: MessageTransportCancelToken?
    
    init() {
        TransportType.allCases.forEach { [weak self] type in
            let sender = MessageTransportFactory.createTransport(type: type)
            self?.cancelToken = sender
                .startListenMessages(types: [MessageTypes.helloToModuleA.rawValue]) { msg in
                    let answerPayload = [
                        "orig": (try? JSONSerialization.jsonObject(with: msg.payload)) ?? "",
                        "resp": "Hello from module A"
                    ]
                    
                    sender.sendMessage(message: CommMessage(
                        type: MessageTypes.answerFromModuleA.rawValue,
                        payload: (try? JSONSerialization.data(withJSONObject: answerPayload)) ?? Data()
                    ))
                }
        }
    }
}
