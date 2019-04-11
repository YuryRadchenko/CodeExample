//
//  UIBarButtonItem.swift
//  AppCodeExample
//
//  Created Yury Radchenko on 4/9/19.
//  Copyright © 2019 iPadchenko. All rights reserved.
//

import UIKit

extension UIBarButtonItem {
    
    private struct AssociatedKeys {
        static fileprivate var type: UInt8 = 0
    }
    
    var type: BarButtonItemType {
        get {
            if let returnValue = objc_getAssociatedObject(self, &AssociatedKeys.type) as? BarButtonItemType {
                return returnValue
            }
            return BarButtonItemType.default
        }
        set {
            objc_setAssociatedObject(self, &AssociatedKeys.type, newValue as BarButtonItemType, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    }
}
