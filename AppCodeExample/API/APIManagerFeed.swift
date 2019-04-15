//
//  APIManagerFeed.swift
//  AppCodeExample
//
//  Created by Yury Radchenko on 4/9/19.
//  Copyright © 2019 iPadchenko. All rights reserved.
//

import Foundation

extension APIManager {
    
    func getFeed(completion: @escaping (Result<Data, AppError>) -> Void) {
        
        let url = "feeds/json"
        
        self.request(url, method: .get) { result in
            completion(result)
        }
    }
}
