//
//  AccountListViewController.swift
//  Veryable Sample
//
//  Created by Isaac Sheets on 5/27/21.
//  Copyright © 2021 Veryable Inc. All rights reserved.
//

import Foundation
import UIKit

class AccountListViewController: UIViewController {
    //MARK: Public API
    private let dataLoader = AccountRepo()

    private var accountInfo = [[AccountInfo]]() {
        didSet {
            DispatchQueue.main.async(execute: {
                self.customView.tableView.reloadData()
            })
        }
    }
    
    //MARK: Inits
    init() {
        super.init(nibName: nil, bundle: nil)
        self.title = "Accounts".uppercased()
        customView.tableView.delegate = self
        customView.tableView.dataSource = self
        
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

    //MARK: Overrides
    override func loadView() {
        view = customView
    }

    //MARK: Private members

    //MARK: Lazy Loads
    private lazy var customView: AccountListView = {
        AccountListView(delegate: self)
    }()
}

extension AccountListViewController: AccountListDelegate {

}

// MARK: TableView setup
extension AccountListViewController: UITableViewDataSource, UITableViewDelegate {

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
