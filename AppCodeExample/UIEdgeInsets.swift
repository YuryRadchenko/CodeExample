//
//  UIEdgeInsets.swift
//  AppCodeExample
//
//  Created Yury Radchenko on 4/9/19.
//  Copyright © 2019 iPadchenko. All rights reserved.
//

import UIKit

extension UIEdgeInsets {
    
    init(top: CGFloat = 0.0, bottom: CGFloat = 0.0) {
        self.init(top: top, left: 0.0, bottom: bottom, right: 0.0)
    }
    
    init(left: CGFloat = 0.0, right: CGFloat = 0.0) {
        self.init(top: 0.0, left: left, bottom: 0.0, right: right)
    }
}

