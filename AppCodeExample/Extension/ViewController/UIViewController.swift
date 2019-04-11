//
//  UIViewController.swift
//  AppCodeExample
//
//  Created Yury Radchenko on 4/9/19.
//  Copyright © 2019 iPadchenko. All rights reserved.
//

import UIKit

//MARK: -  Common
extension UIViewController {
    
    var className: String {
        return String(describing: type(of: self))
    }
    
    public func getChildren<T: UIViewController>(vc: T.Type)->T? {
        
        if let lastVC = self.children.last as? T {
            return lastVC
        }
        
        for vc in self.children {
            if let childrenVC = vc as? T {
                return childrenVC
            }
        }
        return nil
    }
    
    func backgrounImage(name: String) {
        if let backgroundImage = UIImage(named: name) {
            self.view.backgroundColor = UIColor(patternImage: backgroundImage)
        }
    }
}

//MARK: -  Navigation
extension UIViewController {
    
    func pushWithoutDoubleToViewController<T: UIViewController>(vc: T, animated: Bool)  {
        if self.navigationController?.topViewController?.isKind(of: T.self) == false {
            self.navigationController?.pushViewController(vc, animated: animated)
        }
    }
}

//MARK: -  Navigation Bar 
extension UIViewController {
    
    func setBarButtonItems(_ types: [BarButtonItemType], onSide side: SideOnBar) {
        
        var items: [UIBarButtonItem] = []
        
        for type in types {
            
            if let itemImage = UIImage(named: type.imageName) {
                let barButtonItem = UIBarButtonItem(image: itemImage, style: UIBarButtonItem.Style.plain, target: self, action: #selector(self.didTapBarButtonItem(_:)))
                barButtonItem.type = type
                items.append(barButtonItem)
                
            } else if let title = type.title {
                let barButtonItem = UIBarButtonItem(title: title, style: .plain, target: self, action: #selector(self.didTapBarButtonItem(_:)))
                barButtonItem.type = type
                items.append(barButtonItem)
                
            } else  {
                let barButtonItem = UIBarButtonItem.init(barButtonSystemItem: .action, target: self, action:  #selector(self.didTapBarButtonItem(_:)))
                barButtonItem.type = type
                items.append(barButtonItem)
            }
        }
        
        switch side {
        case .left:
            self.navigationItem.leftBarButtonItems = nil
            self.navigationItem.leftBarButtonItems = items
        case .right:
            self.navigationItem.rightBarButtonItems = nil
            self.navigationItem.rightBarButtonItems = items
        }
    }
    
    @objc internal func didTapBarButtonItem(_ sender: UIBarButtonItem) {
        //print("func \(#function) \(sender.type.imageName)")
    }
}

//MARK: -  Share
extension UIViewController {
    
    func share(images:[UIImage]) {
        let activityViewController = UIActivityViewController(activityItems: images , applicationActivities: nil)
        activityViewController.popoverPresentationController?.sourceView = self.view
        DispatchQueue.main.async {
            self.present(activityViewController, animated: true, completion: nil)
        }
    }
}

//MARK: -  Safari
extension UIViewController {
    
    func safariOpenLink(_ link: String) {
        if let someURL = URL(string: link),
            UIApplication.shared.canOpenURL(someURL) {
            UIApplication.shared.open(someURL, options: [:]) { (completed) in
                //
            }
        }
    }
}
