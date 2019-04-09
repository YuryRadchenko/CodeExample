//
//  BarButtonItemType.swift
//  AppCodeExample
//
//  Created Yury Radchenko on 4/9/19.
//  Copyright © 2019 iPadchenko. All rights reserved.
//

import Foundation

enum SideOnBar {
    case left
    case right
    
    static let `default` = SideOnBar.left
}

enum BarButtonItemType {
    case close
    case back
    case settings
    case burger
    
    static let `default` = BarButtonItemType.close
    
    var imageName: String {
        switch self {
        case .close: return "close"
        case .back: return "back"
        case .burger: return "burger"
        case .settings: return "settings"
        }
    }
    
    var title: String? {
        switch self {
        case .back, .settings, .close, .burger:
            return nil
        }
    }
}
