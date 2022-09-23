//
//  ViewController.swift
//  SampleApp
//
//  Created by VI_Business on 25.08.22.
//

import UIKit
import ModuleCore
import Combine

class ViewController: UIViewController {
    @IBOutlet var messageText: UITextField?
    @IBOutlet var transportMenu: UIButton?
    @IBOutlet var sendAButton: UIButton?
    @IBOutlet var sendBButton: UIButton?
    
    private var selectedTransport: String?
    private var subscribers = Set<AnyCancellable>()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateButtons()
        
        CoreModuleEngine.sharedInstance.responsePublisher
            .receive(on: DispatchQueue.main)
            .sink { text in
                let c = UIAlertController(title: "Message!", message: text, preferredStyle: .alert)
                c.addAction(.init(title: "OK", style: .default))
                self.present(c, animated: true)
            }.store(in: &subscribers)
    }

    @IBAction func onSendToA(_ sender: Any) {
        CoreModuleEngine.sharedInstance.sendMessageToModuleA(transport: selectedTransport!, text: messageText?.text ?? "")
    }
    
    @IBAction func onSendToB(_ sender: Any) {
        CoreModuleEngine.sharedInstance.sendMessageToModuleB(transport: selectedTransport!, text: messageText?.text ?? "")
    }
    
    @IBAction func onNotificationCenterSelect(_ sender: Any) {
        transportMenu?.setTitle("Notification Center", for: .normal)
        selectedTransport = "notificationCenter"
        updateButtons()
    }
        
    @IBAction func onMesageBusSelect(_ sender: Any) {
        transportMenu?.setTitle("Message Bus", for: .normal)
        selectedTransport = "messageBus"
        updateButtons()
    }
    
    func updateButtons() {
        let isEnabled = selectedTransport != nil
        sendAButton?.isEnabled = isEnabled
        sendBButton?.isEnabled = isEnabled
    }
}

