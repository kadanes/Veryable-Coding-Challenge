//
//  AccountDetailsView.swift
//  Veryable Sample
//
//  Created by Parth Tamane on 18/02/23.
//  Copyright © 2023 Veryable Inc. All rights reserved.
//

import Foundation
import UIKit

@objc protocol AccountDetailsViewDelegate: AnyObject {
    func navigateBack()
}

class AccountDetailsView: UIView {
    
    private let accountInfo: AccountInfo
    
    private let containerView = UIView()
    private let icon = UIImageView()
    private let accountDescriptionLabel = UILabel()
    private let accountNameLabel = UILabel()
    private let doneButton = UIButton()
    private weak var delegate: AccountDetailsViewDelegate?
    
    init(info: AccountInfo, delegate: AccountDetailsViewDelegate) {
        self.delegate = delegate
        self.accountInfo = info
        super.init(frame: .zero)
        setup()
    }
    
    required init?(coder: NSCoder) { nil }
    
    
    func setup() {
        backgroundColor = .white
        containerView.backgroundColor = VCustomGrey.light.color
        
        addSubview(containerView)
        
        containerView.snp.makeConstraints{
            $0.left.right.bottom.equalToSuperview()
            $0.top.equalTo(self.safeAreaLayoutGuide)
        }
        
        containerView.addSubview(icon)
        containerView.addSubview(accountNameLabel)
        containerView.addSubview(accountDescriptionLabel)
        containerView.addSubview(doneButton)
        
        accountNameLabel.set(VCustomGrey.dark.color, .vryAvenirNextDemiBold(16))
        accountNameLabel.text = accountInfo.account_name
        accountNameLabel.textAlignment = .center
        accountDescriptionLabel.set(VCustomGrey.normal.color, .vryAvenirNextRegular(14))
        accountDescriptionLabel.text = accountInfo.desc
        accountDescriptionLabel.textAlignment = .center

        icon.snp.makeConstraints {
            $0.width.height.equalTo(60)
            $0.top.equalToSuperview().offset(15)
            $0.centerX.equalToSuperview()
        }
    
        let iconImage = UIImage(named: accountInfo.account_type.rawValue)?
            .withRenderingMode(.alwaysTemplate)
        icon.tintColor = VBlue.normal.color
        icon.image = iconImage
        
        accountNameLabel.snp.makeConstraints {
            $0.top.equalTo(icon.snp.bottom).offset(10)
            $0.height.equalTo(20)
            $0.left.equalToSuperview().offset(10)
            $0.right.equalToSuperview().offset(-10)
        }
        accountDescriptionLabel.snp.makeConstraints {
            $0.top.equalTo(accountNameLabel.snp.bottom).offset(0)
            $0.height.equalTo(20)
            $0.left.equalToSuperview().offset(10)
            $0.right.equalToSuperview().offset(-10)
        }
        doneButton.snp.makeConstraints {
            $0.bottom.equalToSuperview().offset(-20)
            $0.centerX.equalToSuperview()
            $0.height.equalTo(40)
            $0.left.equalToSuperview().offset(20)
            $0.right.equalToSuperview().offset(-20)
        }
        
        doneButton.setTitle("DONE", for: .normal)
        doneButton.backgroundColor = VBlue.normal.color
        doneButton.addTarget(self, action: #selector(navigateBack), for: .touchUpInside)
        
        let topBorder = UIView()
        containerView.addSubview(topBorder)
        let borderWidth = 0.5
        
        topBorder.backgroundColor = VCustomGrey.normal.color
        topBorder.snp.makeConstraints {
            $0.top.width.equalToSuperview()
            $0.height.equalTo(borderWidth)
        }
    }
    
    // Accessing delegate function as #selector(delegate?.navigateBack) was causing a crash with
    // [Veryable_Sample.AccountDetailsView navigateBack]: unrecognized selector sent to instance`
    // So accessing it this way instead.
    @objc func navigateBack() {
        delegate?.navigateBack()
    }
    
}
