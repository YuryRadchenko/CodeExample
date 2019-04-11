//
//  DataManager.swift
//  AppCodeExample
//
//  Created Yury Radchenko on 4/9/19.
//  Copyright © 2019 iPadchenko. All rights reserved.
//

import Foundation

typealias HTML = String

final class DataManager {
    
    class func getFeed(completion: @escaping ((Result<CEFeed, AppError>)-> Void)){
        
        APIManager.shared.getFeed { (result) in
            switch result {
            case .success(let data):
                let decoder = CEFeed.jsonDecoder
                do {
                    let output = try decoder.decode(CEFeed.self, from: data)
                    completion(.success(output))
                    
                } catch let err {
                    let parsingError = AppError(type: .parsing, error: err)
                    parsingError.location = "\(String(describing: type(of: self))), func \(#function)"
                    completion(.failure(parsingError))
                }
                
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
