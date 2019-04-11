//
//  AppError.swift
//  AppCodeExample
//
//  Created by Yury Radchenko on 4/9/19.
//  Copyright © 2019 iPadchenko. All rights reserved.
//

import Foundation

final class AppError: Error {
    
    var code: Int = 0
    var type: AppErrorType = .default
    
    private var _title: String?
    private var _message: String?
    
    var debugInfo: String?
    var location: String?
    
    init(_ message: String, title: String? = nil) {
        self._message = message
        self._title = title
    }
    
    init(type: AppErrorType, error: Error) {
        self.type = type
        self.code = error._code
        self._message = error.localizedDescription
        self.debugInfo = "\(error)"
    }
    
    init(type: AppErrorType, message: String? = nil, title: String? = nil) {
        self.type = type
        self._message = message
        self._title = title
    }
}

extension AppError {
    
    var title: String? {
        
        guard let someTitle = self._title else {
            return self.type.title
        }
        return someTitle
    }
    
    var message: String {
        
        if let message = self._message {
            return message
        }
        
        if let typeMessage = self.type.message {
            return typeMessage
        }
        return ""
    }
    
    var titleMassage: String {
        var output =  self.message
        if let title = self.title {
            output = title.uppercased() + "\n" + output
        }
        return output
    }
    
    var fullDebugInfo: String {
        
        var output: String = "⚠️ " + self.titleMassage + "\nCode: \(self.code)"
        
        if let location = self.location {
            output += ("\nLocation: " + location)
        }
        
        if let debug = self.debugInfo {
            output += ("\nDebug: " + debug)
        }
        
        return output
    }
}
