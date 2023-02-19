//
//  AccountRepo.swift
//  Veryable Sample
//
//  Created by Isaac Sheets on 5/27/21.
//  Copyright © 2021 Veryable Inc. All rights reserved.
//

import Foundation
import Alamofire

class AccountRepo {
    
    private let detailsLink = "https://veryable-public-assets.s3.us-east-2.amazonaws.com/veryable.json"
    private let decoder = JSONDecoder()
    
    public func getAccountList(completion: @escaping (Result<[AccountInfo], Error>) -> ()) {
        
        guard let url = URL(string: detailsLink) else {
            completion(.failure(AccountFetchErrors.URLEncodingFailed))
            return
        }
        
        AF.request(url).response { [weak self] response in
            guard let `self` = self else { return }
                        
            guard let data = response.data else {
                completion(.failure(AccountFetchErrors.MissingData))
                return
            }
            
            do {
                let accountInfo = try self.decoder.decode([AccountInfo].self, from: data)
                completion(.success(accountInfo))
            } catch {
                completion(.failure(error))
            }
        }
    }
}

enum AccountFetchErrors: Error {
    case URLEncodingFailed
    case MissingData
}
