//
//  CoreModuleEngine.swift
//  ModuleCore
//
//  Created by VI_Business on 25.08.22.
//

import Foundation
import CommunicationModule
import Combine

public class CoreModuleEngine {
    public static let sharedInstance = CoreModuleEngine()
    var cancelToken: MessageTransportCancelToken = ""
    
    public let responsePublisher = PassthroughSubject<String, Never>()
    
    init() {
        FeatureModuleLoader().loadModules()
        
        TransportType.allCases.forEach { [weak self] type in
            let sender = MessageTransportFactory.createTransport(type: type)
            self?.cancelToken = sender.startListenMessages(types: [
                MessageTypes.answerFromModuleA.rawValue,
                MessageTypes.answerFromModuleB.rawValue]) { [weak self] msg in
                    let text = "Received message:\n\(msg.description)"
                    print(text)
                    self?.responsePublisher.send(text)
                }
        }
    }
    
    public func sendMessageToModuleA(transport: TransportType, text: String) {
        let sender = MessageTransportFactory.createTransport(type: transport)
        sender.sendMessage(message: .init(type: MessageTypes.helloToModuleA.rawValue,
                                          payload: makeSendPayload(text: text)))
    }
    
    public func sendMessageToModuleB(transport: TransportType, text: String) {
        let sender = MessageTransportFactory.createTransport(type: transport)
        sender.sendMessage(message: .init(type: MessageTypes.helloToModuleB.rawValue,
                                          payload: makeSendPayload(text: text)))
    }
    
    func makeSendPayload(text: String) -> Data {
        return try! JSONSerialization.data(withJSONObject: ["msg": text])
    }
}
