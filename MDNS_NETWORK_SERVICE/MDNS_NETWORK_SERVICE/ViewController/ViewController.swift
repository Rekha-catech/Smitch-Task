//
//  ViewController.swift
//  MDNS_NETWORK_SERVICE
//
//  Created by PQC India iMac-2 on 21/09/22.
//

import UIKit
import Ciao

class ViewController: UIViewController {
  
    var netService : NetService?

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Smitch Task"
    }

    @IBAction func publishButtonTapped(_ sender: Any) {
        self.netService = NetService(domain: "local", type: "_http._tcp.", name: "smitch network", port: Int32(80))
        self.netService!.delegate = self
        self.netService!.publish()
    }
    
    @IBAction func scanButtonTapped(_ sender: Any) {
        let vc = DomainsViewController.init(domains: "local")
        self.navigationController?.pushViewController(vc, animated: true)
    }
}

extension ViewController: NetServiceDelegate{
    
    func netService(_ sender: NetService, didNotPublish errorDict: [String : NSNumber]) {
        print("uh oh, could not publish netService. domain:\(netService!.domain) type:\(netService!.type) name:\(netService!.name) port:\(netService!.port)")
        print("error code:\(errorDict)")
    }

    func netServiceDidPublish(_ sender: NetService) {
        print("netService published.")
        UIAlertController.showAlert(message: "Network service published successfully", target: self)
    }

    func netServiceDidStop(_ sender: NetService) {
        print("netService stopped.")
    }

    func netServiceWillPublish(_ sender: NetService) {
        print("Service will publish, apparently")
    }

}


extension UIAlertController {
    
    static func showAlert(title:String? = "",
                          message: String,
                          target:UIViewController?) {
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
        alert.addAction(okAction)
        DispatchQueue.main.async {
            target?.present(alert, animated: true, completion: nil)
        }
    }
    
}
