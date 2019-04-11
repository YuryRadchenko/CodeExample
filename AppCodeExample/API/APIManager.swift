//
//  APIManager.swift
//  AppCodeExample
//
//  Created Yury Radchenko on 4/9/19.
//  Copyright © 2019 iPadchenko. All rights reserved.
//

import Foundation
import Alamofire

final class APIManager {
    
    static let shared = APIManager()
    
    private var session: Session!
    
    private init() {
        let configuration = URLSessionConfiguration.default
        configuration.timeoutIntervalForRequest = 60
        self.session = Alamofire.Session(configuration: configuration)
    }
    
    private var headers: HTTPHeaders {
        return ["Cache-control": "no-cache",
                "Accept": "application/json"]
    }
    
    internal func request(_ urlRequest: String, method: HTTPMethod, parameters: Parameters = [:], completion: @escaping (Result<Data, AppError>) -> Void) {
        
        let fullRequestURL = ThisApp.API.fullPath(urlRequest)
        
        switch method {
        case .get:
            self.session.request(fullRequestURL, method: method, headers: self.headers)
                .responseData(completionHandler: { (response) in
                    
                    self.handler(response: response, completion: { (result) in
                        completion(result)
                    })
                })
            
        case .post, .delete, .patch:
            self.session.request(fullRequestURL, method: method, parameters: parameters, encoding: JSONEncoding.default, headers: self.headers)
                .responseData(completionHandler: { (response) in
                    
                    self.handler(response: response, completion: { (result) in
                        completion(result)
                    })
                })
        default:
            break
        }
    }
    
    private func handler(response: DataResponse<Data>, completion: @escaping (Result<Data, AppError>) -> Void) {

        guard let httpStatusCode = response.response?.statusCode else {
            let apiError = AppError("Error getting an HTTP status code")
            apiError.location = "\(String(describing: type(of: self))), func \(#function)"
            apiError.debugInfo = "\(String(describing: response.request?.urlRequest))"
            DispatchQueue.main.async {
                completion(.failure(apiError))
            }
            return
        }
        
        switch response.result {
        case .success(let successData):
    
            switch httpStatusCode {
            case 200..<300:
                DispatchQueue.main.async() {
                    completion(.success(successData))
                }
            default:
                let errorType = AppErrorType.api(httpStatusCode)
                var apiError: AppError
                if let responseError = response.error {
                    apiError = AppError(type: errorType, error: responseError)
                } else {
                    apiError = AppError(type: errorType)
                    apiError.debugInfo = "\(String(describing: response.request?.urlRequest))"
                }
                apiError.location = "\(String(describing: type(of: self))), func \(#function)"
                
                DispatchQueue.main.async() {
                    completion(.failure(apiError))
                }
            }

        case .failure(let error):
            let apiError = AppError(type: .api(httpStatusCode), error: error)
            apiError.location = "\(String(describing: type(of: self))), func \(#function)"
            DispatchQueue.main.async {
                completion(.failure(apiError))
            }
        }
    }
}

