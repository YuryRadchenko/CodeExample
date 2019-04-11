//
//  ThisApp.swift
//  AppCodeExample
//
//  Created Yury Radchenko on 4/9/19.
//  Copyright © 2019 iPadchenko. All rights reserved.
//

import UIKit


enum ThisApp {
    
    static let appId = "123456789"
    static let appName = "Code Example"
    static let linkedin = "https://www.linkedin.com/in/yurii-radchenko-9216a61a/"
    
    enum API {
        static var baseAPIHost: String {
            return "https://daringfireball.net/"
        }
        
        static func fullPath(_ path: String) -> String {
            return API.baseAPIHost + path
        }
    }
    
    enum Support {
        static let email = "yury.radchenko@gmail.com"
    }
}
