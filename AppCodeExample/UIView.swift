//
//  UIView.swift
//  AppCodeExample
//
//  Created Yury Radchenko on 4/9/19.
//  Copyright © 2019 iPadchenko. All rights reserved.
//

import UIKit

//MARK: -  Identificator -
public extension UIView {

    var id: String? {
        get {
            return self.accessibilityIdentifier
        }
        set {
            self.accessibilityIdentifier = newValue
        }
    }
}

//MARK: -  Border & Corner Radius -
public extension UIView {
    
    var borderColor: UIColor? {
        get {
            guard let color = layer.borderColor else {
                return nil
            }
            return UIColor(cgColor: color)
        }
        set {
            guard let color = newValue else {
                layer.borderColor = nil
                return
            }
            self.layer.borderColor = color.cgColor
        }
    }
    
    var borderWidth: CGFloat {
        get {
            return layer.borderWidth
        }
        set {
            self.layer.borderWidth = newValue
        }
    }
    
    var cornerRadius: CGFloat {
        get {
            return layer.cornerRadius
        }
        set {
            self.layer.masksToBounds = true
            self.layer.cornerRadius = abs(CGFloat(Int(newValue * 100)) / 100)
        }
    }
    
    func makeCircle() {
        self.layer.masksToBounds = true
        self.layer.cornerRadius = abs(CGFloat(Int(layer.frame.height/2 * 100)) / 100)
    }
    
    func makeCircle(side: CGFloat) {
        self.layer.masksToBounds = true
        self.layer.cornerRadius = side
    }
    
    func border(width: CGFloat, color: UIColor?) {
        self.layer.borderWidth = width
        
        if let boderColor = color {
            self.layer.borderColor = boderColor.cgColor
        } else {
            self.layer.borderColor = nil
        }
    }
    
    func borderShow() {
        self.layer.borderWidth = 2.0
        self.layer.borderColor = UIColor.red.cgColor
    }
    
    func borderShow(color: UIColor) {
        self.layer.borderColor = color.cgColor
        self.layer.borderWidth = 1.0
    }
}

//MARK: -  Constraints -
extension UIView {
    
    func constraint(_ identifier: String) -> NSLayoutConstraint? {
        let filteredConstraints = self.constraints.filter { $0.identifier == identifier }
        return filteredConstraints.first
    }
}
