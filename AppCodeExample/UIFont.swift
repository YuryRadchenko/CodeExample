//
//  UIFont.swift
//  AppCodeExample
//
//  Created Yury Radchenko on 4/9/19.
//  Copyright © 2019 iPadchenko. All rights reserved.
//

import UIKit

extension UIFont {
    
    enum Font {
        case helveticaLight
        case helveticaRegular
        case helveticaBold
        
        var name: String {
            switch self {
            case .helveticaLight: return "HelveticaNeue-Light"
            case .helveticaRegular: return "HelveticaNeue"
            case .helveticaBold: return "HelveticaNeue-Bold"
            }
        }
    }
    
    static func appFont(_ font: Font, size: CGFloat = 17) -> UIFont {
        let output = UIFont(name: font.name, size: size)
        return output ?? UIFont.defaultFont()
    }
    
    static func appAttributeFont(_ font: Font, size: CGFloat = 17) -> [AnyHashable : Any] {
        let font = UIFont.appFont(font, size: size)
        let output: [AnyHashable : Any] = [NSAttributedString.Key.font : font]
        return output
    }
    
    static func defaultFont() -> UIFont {
        return UIFont.systemFont(ofSize: 17)
    }
}
