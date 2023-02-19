//
//  AccountDetailsCell.swift
//  Veryable Sample
//
//  Created by Parth Tamane on 18/02/23.
//  Copyright © 2023 Veryable Inc. All rights reserved.
//

import Foundation
import UIKit
import SnapKit

class AccountDetailsCell: UITableViewCell {
    
    static let identifier: String = "AccountDetailsCell"
    
    private let accountDescriptionLabel = UILabel()
    private let accountNameLabel = UILabel()
    private let accountTypeLabel = UILabel()
    private let icon = UIImageView()
    private let arrow = UIImageView()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.configure()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    /// Add UI elements and configure constraints and properties for them.
    private func configure() {
        separatorInset = UIEdgeInsets.zero
        contentView.addSubview(accountDescriptionLabel)
        contentView.addSubview(accountNameLabel)
        contentView.addSubview(accountTypeLabel)
        contentView.addSubview(icon)
        contentView.addSubview(arrow)
        
        icon.tintColor = VBlue.normal.color
        icon.snp.makeConstraints {
            $0.top.equalToSuperview().offset(10)
            $0.left.equalToSuperview().offset(10)
            $0.width.height.equalTo(25)
        }
        
        arrow.image = UIImage(named: "arrow")?.withRenderingMode(.alwaysTemplate)
        arrow.tintColor = VCustomGrey.normal.color
        arrow.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.right.equalToSuperview().offset(-10)
            $0.height.width.equalTo(20)
        }
        
        accountNameLabel.set(VCustomGrey.dark.color, .vryAvenirNextDemiBold(14))
        accountTypeLabel.set(VCustomGrey.dark.color, .vryAvenirNextRegular(12))
        accountDescriptionLabel.set(VCustomGrey.normal.color, .vryAvenirNextRegular(12))
        
        let setLabelConstraints: (ConstraintMaker) -> () = {
            $0.left.equalTo(self.icon.snp.right).offset(10)
            $0.right.equalToSuperview().offset(10)
            $0.width.equalTo(100)
            $0.height.equalTo(20)
        }
        
        accountNameLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(10)
            setLabelConstraints($0)
        }
        
        accountDescriptionLabel.snp.makeConstraints {
            $0.top.equalTo(accountNameLabel.snp.bottom)
            setLabelConstraints($0)
        }
        
        accountTypeLabel.snp.makeConstraints {
            $0.top.equalTo(accountDescriptionLabel.snp.bottom)
            setLabelConstraints($0)
        }
    }
    
    /// Update the cell with new account's info
    func update(with info: AccountInfo) {
        accountDescriptionLabel.text = info.desc
        accountNameLabel.text = info.account_name
        accountTypeLabel.text = info.account_type.description
        let iconImage = UIImage(named: info.account_type.rawValue)?
            .withRenderingMode(.alwaysTemplate)
        icon.image = iconImage
    }

}
