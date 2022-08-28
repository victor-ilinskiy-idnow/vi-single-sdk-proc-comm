//
//  ModuleAEngine.swift
//  ModuleA
//
//  Created by VI_Business on 28.08.22.
//

import Foundation
import CommunicationModule

class ModuleBEngine {
    static let sharedInstance = ModuleBEngine()
    private var cancelToken: MessageTransportCancelToken?
    
    init() {
        TransportType.allCases.forEach { [weak self] type in
            let sender = MessageTransportFactory.createTransport(type: type)
            self?.cancelToken = sender
                .startListenMessages(types: [MessageTypes.helloToModuleB.rawValue]) { msg in
                    let answerPayload = [
                        "orig": (try? JSONSerialization.jsonObject(with: msg.payload)) ?? "",
                        "resp": "Hello from module B"
                    ]
                    
                    sender.sendMessage(message: CommMessage(
                        type: MessageTypes.answerFromModuleB.rawValue,
                        payload: (try? JSONSerialization.data(withJSONObject: answerPayload)) ?? Data()
                    ))
                }
        }
    }
}
