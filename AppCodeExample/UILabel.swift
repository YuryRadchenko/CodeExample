//
//  UILabel.swift
//  AppCodeExample
//
//  Created Yury Radchenko on 4/9/19.
//  Copyright © 2019 iPadchenko. All rights reserved.
//

import UIKit

extension UILabel {

    enum LabelUIStyle {
        
        case standard
        
        static let `default` = LabelUIStyle.standard
    }
    
    private struct AssociatedKeys {
        static fileprivate var uiStyle: UInt8 = 0
    }
    
    var uiStyle: LabelUIStyle {
        get {
            if let returnValue = objc_getAssociatedObject(self, &AssociatedKeys.uiStyle) as? LabelUIStyle {
                return returnValue
            }
            return LabelUIStyle.default
        }
        set {
            objc_setAssociatedObject(self, &AssociatedKeys.uiStyle, newValue as LabelUIStyle, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN_NONATOMIC)
            
            switch uiStyle {
                
            case .standard:
                self.font = UIFont.systemFont(ofSize: 17)
                self.textColor = UIColor.black
                self.textAlignment = .left
                self.numberOfLines = 0
            }
        }
    }
}

extension UILabel {
    
    static func height(text: String?, font: UIFont, width: CGFloat) -> CGFloat {
        
        guard let text = text else {
            return 0.0
        }
        
        let size = CGSize(width: width, height: CGFloat.greatestFiniteMagnitude)
        let options = NSStringDrawingOptions.usesFontLeading.union([.usesLineFragmentOrigin])
        let attributes = [NSAttributedString.Key.font: font]
        let rectangle = String(describing: text).boundingRect(with: size, options: options, attributes: attributes, context: nil)
        return rectangle.height.rounded()
    }
    
    static func height(attrText: NSAttributedString?, width: CGFloat) -> CGFloat {
        
        guard let attrText = attrText else {
            return 0.0
        }
        
        let size = CGSize(width: width, height: CGFloat.greatestFiniteMagnitude)
        let options = NSStringDrawingOptions.usesFontLeading.union([.usesLineFragmentOrigin])
        let rect = attrText.boundingRect(with: size, options: options, context: nil)
        return rect.size.height.rounded()
        
    }
    
    static func height(label: UILabel, width: CGFloat) -> CGFloat {
        return UILabel.height(text: label.text, font: label.font, width: width)
    }
    
    static func widthFor(text: String?, font: UIFont) -> CGFloat {
        
        let label = UILabel()
        label.font = font
        label.textAlignment = .left
        label.text = text
        label.numberOfLines = 1
        label.sizeToFit()
        
        let rect = label.frame
        return rect.width.rounded()
    }
}

extension UILabel {
    
    func heightForWidth(_ width: CGFloat) -> CGFloat {
        return UILabel.height(text: self.text, font: self.font, width: width)
    }
}

extension UILabel {
    
    public func set(text _text: String?, duration: TimeInterval = 0.25) {
        UIView.transition(with: self, duration: duration, options: .transitionCrossDissolve, animations: { () -> Void in
            self.text = _text
        }, completion: nil)
    }
}
