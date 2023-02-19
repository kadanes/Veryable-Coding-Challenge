//
//  AccountDetailsViewController.swift
//  Veryable Sample
//
//  Created by Parth Tamane on 18/02/23.
//  Copyright © 2023 Veryable Inc. All rights reserved.
//

import Foundation
import UIKit

class AccountDetailsViewController: UIViewController {
    
    private let accountInfo: AccountInfo
    
    init(info: AccountInfo) {
        self.accountInfo = info
        super.init(nibName: nil, bundle: nil)
        self.title = "Details".uppercased()
        customizeBackButton()
    }
    
    required init?(coder: NSCoder) { nil }
    
    //MARK: Overrides
    override func loadView() {
        view = customView
    }
    
    //MARK: Lazy Loads
    private lazy var customView: AccountDetailsView = {
        AccountDetailsView(info: accountInfo, delegate: self)
    }()
    
}

extension AccountDetailsViewController: AccountDetailsViewDelegate {
    
    func navigateBack() { navigationController?.popViewController(animated: true) }
    
    func customizeBackButton() {
        let view = UIView()
        let button = UIButton(type: .system)
        
        button.setImage(UIImage(named: "arrow"), for: .normal)
        button.imageView?.transform = CGAffineTransform(scaleX: -1, y: 1)
        button.sizeToFit()
        button.frame = CGRect(x: -10, y: 0, width: 35, height: 35)

        button.addTarget(self, action: #selector(navigateBack), for: .touchUpInside)
        
        view.addSubview(button)
        view.frame = button.bounds
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: view)
    }
}
