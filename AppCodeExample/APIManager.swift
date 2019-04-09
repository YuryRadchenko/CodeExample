//
//  APIManager.swift
//  AppCodeExample
//
//  Created Yury Radchenko on 4/9/19.
//  Copyright © 2019 iPadchenko. All rights reserved.
//

import Foundation
//import Alamofire

final class APIManager {
    
    static let shared = APIManager()
    
    /*
    private var sessionManager: SessionManager?
    
    private init() {
        let configuration = URLSessionConfiguration.default
        configuration.timeoutIntervalForRequest = 60
        self.sessionManager = Alamofire.SessionManager(configuration: configuration)
    }
    
    private func headers: HTTPHeaders {
        return ["Authorization": "Bearer \("token")",
                "Accept": "application/json"]
    }
    
    internal func request(_ urlRequest: String, method: HTTPMethod, parameters: Parameters = [:], completion:@escaping ServerResponse){
        
        let fullRequestURL = ThisApp.API.fullPath(urlRequest)
        
        print("=========================")
        print("Request [\(method.rawValue)] \(fullRequestURL)")
        print("HEADERS:\n\(self.headers)")
        print("PARAMETERS:\n\(parameters)")
        print("=========================")
        
        switch method {
        case .get:
            self.sessionManager?.request(fullRequestURL, method: method, headers: headers)
                .responseData(completionHandler: { (response) in
                    
                    self.handler(response: response, completion: { (result) in
                        completion(result)
                    })
                })
            
        case .post, .delete, .patch:
            self.sessionManager?.request(fullRequestURL, method: method, parameters: parameters, encoding: JSONEncoding.default, headers: headers)
                .responseData(completionHandler: { (response) in
                    
                    self.handler(response: response, completion: { (result) in
                        completion(result)
                    })
                })
        default:
            break
        }
    }
    
    private func handler(response: DataResponse<Data>, completion:@escaping ServerResponse) {
        
        switch response.result {
        case .success(let dataOk):
            
            let statusCode = response.response!.statusCode
            switch statusCode {
            case 200..<300:
                DispatchQueue.main.async() {
                    completion(.success(dataOk))
                }
            default:
                let errorObject = PError(statusCode: statusCode, data: response.data)
                DispatchQueue.main.async() {
                    completion(.failure(errorObject))
                }
            }
            
        case .failure(let error):
            DispatchQueue.main.async {
                completion(.failure(PError(from: error)))
            }
        }
    }
    */
}

