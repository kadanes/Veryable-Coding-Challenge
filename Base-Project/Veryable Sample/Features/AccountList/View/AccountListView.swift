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
    private let dataLoader = AccountRepo()

    private let tableView = UITableView()

    private var accountInfo = [[AccountInfo]]() {
        didSet {
            DispatchQueue.main.async(execute: {
                self.tableView.reloadData()
            })
        }
    }
    
    //MARK: Inits
    init(delegate: AccountListDelegate) {
        self.del = delegate
        super.init(frame: .zero)
        setup()
        
        dataLoader.getAccountList {[weak self] downloadDetails in
            switch downloadDetails {
            case .success(let accInfo):
                let bankDetails = accInfo.filter { $0.account_type == .bank }
                let cardDetails = accInfo.filter { $0.account_type == .card }
                self?.accountInfo = [bankDetails, cardDetails]
                
            case .failure(let error):
                NSLog("Failed to download data \(error)")
            }
        }
    }
    
    required init?(coder: NSCoder) { nil }

    // MARK: UI setup
    private func setup() {
        tableView.delegate = self
        tableView.dataSource = self
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
            $0.left.right.bottom.equalToSuperview()
            $0.width.height.equalTo(self)
        }
    }
}

// MARK: TableView setup
extension AccountListView: UITableViewDataSource, UITableViewDelegate {

    func numberOfSections(in tableView: UITableView) -> Int { accountInfo.count }
   
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        accountInfo[section].count
    }

    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if let cell = cell as? AccountDetailsCell {
            let details = accountInfo[indexPath.section][indexPath.row]
            cell.update(with: details)
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        tableView.dequeueReusableCell(
            withIdentifier: AccountDetailsCell.identifier,
            for: indexPath
        ) as? AccountDetailsCell ?? AccountDetailsCell()
    
    }

    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        AccountDetailsHeaderView(for: section)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat { 80 }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat { 30 }

}
