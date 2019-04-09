//
//  AlertAction.swift
//  AppCodeExample
//
//  Created Yury Radchenko on 4/9/19.
//  Copyright © 2019 iPadchenko. All rights reserved.
//

import UIKit

enum AlertAction {
    case okay(String)
    case cancel(String)
    
    static let `default` = AlertAction.okay("Ок")
    
    var buttonTitle: String {
        switch self {
        case .okay(let stringValue):
            return stringValue
        case .cancel(let stringValue):
            return stringValue
        }
    }
    
    var buttonActionStyle: UIAlertAction.Style {
        switch self {
        case .okay((_)):
            return .default
        case .cancel(_):
            return .cancel
        }
    }
}
