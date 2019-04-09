//
//  UIButton.swift
//  AppCodeExample
//
//  Created Yury Radchenko on 4/9/19.
//  Copyright © 2019 iPadchenko. All rights reserved.
//

import UIKit

extension UIButton {
    
    enum UIButtonUIStyle {
        case standard
        
        static let `default` = UIButtonUIStyle.standard
    }
    
    private struct AssociatedKeys {
        static fileprivate var uiStyle: UInt8 = 0
    }
    
    var uiStyle: UIButtonUIStyle {
        get {
            if let returnValue = objc_getAssociatedObject(self, &AssociatedKeys.uiStyle) as? UIButtonUIStyle {
                return returnValue
            }
            return UIButtonUIStyle.default
        }
        set {
            objc_setAssociatedObject(self, &AssociatedKeys.uiStyle, newValue as UIButtonUIStyle, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN_NONATOMIC)
            
            switch uiStyle {
                
            case .standard:
                self.backgroundColor = .white
                self.titleLabel?.textColor = .blue
                self.tintColor = .blue
                self.titleLabel?.font = UIFont.systemFont(ofSize: 17)
                self.setImage(nil, for: .normal)
            }
        }
    }
}

