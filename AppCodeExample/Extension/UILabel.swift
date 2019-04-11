//
//  UILabel.swift
//  AppCodeExample
//
//  Created Yury Radchenko on 4/9/19.
//  Copyright © 2019 iPadchenko. All rights reserved.
//

import UIKit

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

