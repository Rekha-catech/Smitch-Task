//
//  TableViewCell.swift
//  MDNS_Network
//
//  Created by PQC India iMac-2 on 21/09/22.
//

import Foundation
import UIKit

class TableViewCell: UITableViewCell {
    static let identifier = "TableViewCell"
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .subtitle, reuseIdentifier: reuseIdentifier)
    }

    required init?(coder: NSCoder) { nil }
}

class LoadingTableView: UITableView {
    let activityIndicator = UIActivityIndicatorView(style: .whiteLarge)
    override init(frame: CGRect, style: UITableView.Style) {
        super.init(frame: frame, style: style)
        addSubview(activityIndicator)
        activityIndicator.color = .black
        activityIndicator.translatesAutoresizingMaskIntoConstraints = false
        activityIndicator.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        activityIndicator.topAnchor.constraint(equalTo: self.topAnchor, constant: 2).isActive = true
    }

    required init?(coder: NSCoder) { nil }
}
