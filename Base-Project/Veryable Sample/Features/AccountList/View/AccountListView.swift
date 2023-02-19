//
//  AccountListView.swift
//  Veryable Sample
//
//  Created by Isaac Sheets on 5/27/21.
//  Copyright © 2021 Veryable Inc. All rights reserved.
//

import Foundation
import UIKit
import SnapKit

protocol AccountListDelegate: AnyObject {}

class AccountListView: UIView {

    //MARK: Private members
    private weak var del: AccountListDelegate?
    
    let tableView = UITableView()
    
    //MARK: Inits
    init(delegate: AccountListDelegate) {
        self.del = delegate
        super.init(frame: .zero)
        setup()
    }
    
    required init?(coder: NSCoder) { nil }

    // MARK: UI setup
    private func setup() {
        backgroundColor = .white
        tableView.register(AccountDetailsCell.self, forCellReuseIdentifier: AccountDetailsCell.identifier)
        if #available(iOS 15.0, *) {
            // Looks like iOS 15 introduced this top padding.
            // Earlier versions don't have this issue
            // https://stackoverflow.com/a/69192511/7946143
            tableView.sectionHeaderTopPadding = 0
        }
        addSubview(tableView)
        constrain()
    }

    private func constrain() {
        tableView.snp.makeConstraints {
            $0.top.equalTo(self.safeAreaLayoutGuide)
            $0.left.right.bottom.equalToSuperview()
            $0.width.equalTo(self)
        }
    }
}
