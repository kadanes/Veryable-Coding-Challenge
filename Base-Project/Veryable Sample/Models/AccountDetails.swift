//
//  AccountDetails.swift
//  Veryable Sample
//
//  Created by Parth Tamane on 17/02/23.
//  Copyright © 2023 Veryable Inc. All rights reserved.
//

import Foundation


enum AccountType: String, Codable {
    
    var description: String {
        switch self {
        case .bank:
            return "Bank Account: ACH - Same Day"
        case .card:
            return "Card: Instant"
        }
    }
    
    case bank = "bank"
    case card = "card"
}

struct AccountInfo: Codable {
    let id: Int
    let account_type: AccountType
    let account_name: String
    let desc: String
}
