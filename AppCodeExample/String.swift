//
//  String.swift
//  AppCodeExample
//
//  Created Yury Radchenko on 4/9/19.
//  Copyright © 2019 iPadchenko. All rights reserved.
//

import Foundation

extension String {
    
    var isNotEmpty: Bool {
        return !self.isEmpty
    }
    
    func replace(_ string:String, replacement:String) -> String {
        let replaceString = self.replacingOccurrences(of: string, with: replacement)
        return replaceString
    }
    
    func remove(_ string: String) -> String {
        return self.replace(string, replacement: "")
    }
    
    var isEmail: Bool {
        let emailRegEx = "([A-Za-z0-9!#$%&'*+-/=?^_`{|}~]){1,64}@([A-Za-z0-9!#$%&'*+-/=?^_`{|}~]){1,64}\\.([A-Za-z0-9]){2,64}"
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        let isEmail = emailTest.evaluate(with: self)
        return isEmail
    }
}
