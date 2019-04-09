//
//  Bool.swift
//  AppCodeExample
//
//  Created Yury Radchenko on 4/9/19.
//  Copyright © 2019 iPadchenko. All rights reserved.
//

import Foundation

extension Bool {

    var isFalse: Bool {
        return self == false
    }
    
    var stringTrueFalse: String {
        switch self {
        case true: return "true"
        case false: return "false"
        }
    }
    
    var stringYesNo: String {
        switch self {
        case true: return "Yes"
        case false: return "No"
        }
    }
    
    var numberValue: Int {
        switch self {
        case true: return 1
        case false: return 0
        }
    }
    
    var numberValueAsString: String {
        switch self {
        case true: return "1"
        case false: return "0"
        }
    }
}
