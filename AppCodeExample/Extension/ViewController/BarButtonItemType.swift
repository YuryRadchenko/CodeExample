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
    
    static let `default` = BarButtonItemType.close
    
    var imageName: String {
        switch self {
        case .close: return "close"
        case .back: return "back"
        }
    }
    
    var title: String? {
        switch self {
        case .back, .close:
            return nil
        }
    }
}
