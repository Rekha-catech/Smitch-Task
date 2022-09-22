//
//  DomainsViewController.swift
//  MDNS_NETWORK_SERVICE
//
//  Created by PQC India iMac-2 on 21/09/22.
//

import Ciao
import UIKit

class DomainsViewController: UIViewController {
    let tableView = UITableView()

    var datasource: [String]
    override func loadView() {
        view = tableView
    }

    init(domains: String...) {
        self.datasource = domains
        super.init(nibName: nil, bundle: nil)
    }

    let serviceType = ServiceType.tcp("_http._tcp")
    
    override func viewDidLoad() {
        super.viewDidLoad()

        title = "domains"
        tableView.register(TableViewCell.self, forCellReuseIdentifier: TableViewCell.identifier)
        tableView.dataSource = self
        tableView.delegate = self
        
        let server1 = CiaoServer(type: serviceType, name: "server1")
        let server2 = CiaoServer(type: serviceType, name: "server2", port: 3000)
        server1.txtRecord = ["server": "first"]
        server2.txtRecord = ["server": "second"]
        server1.start(options: .listenForConnections)
        server2.start()

    }

    required init?(coder: NSCoder) { nil }
}

extension DomainsViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        datasource.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: TableViewCell.identifier, for: indexPath)
        cell.accessoryType = .disclosureIndicator
        cell.textLabel?.text = datasource[indexPath.row]
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let domain = datasource[indexPath.row]
        let servicesViewController = ServicesViewController(domain: domain)
        navigationController?.pushViewController(servicesViewController, animated: true)
    }
}
