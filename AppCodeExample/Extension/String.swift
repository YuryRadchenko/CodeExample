//
//  String.swift
//  AppCodeExample
//
//  Created Yury Radchenko on 4/9/19.
//  Copyright © 2019 iPadchenko. All rights reserved.
//

import Foundation

extension String {
    
    func replace(_ string:String, replacement:String) -> String {
        let replaceString = self.replacingOccurrences(of: string, with: replacement)
        return replaceString
    }
    
    func remove(_ string: String) -> String {
        return self.replace(string, replacement: "")
    }
    
    func firstChars(_ number: Int) -> String {
        
        guard number <= self.count else { return self}
        
        let indexEnd = self.index(self.startIndex, offsetBy: number)
        return String(self[..<indexEnd])
    }
    
    var urlRequest : URLRequest? {
        guard let someUrl = URL(string: self) else {
            return nil
        }
        return URLRequest(url: someUrl)
    }
    
    var url: URL? {
        return URL(string: self)
    }
}
