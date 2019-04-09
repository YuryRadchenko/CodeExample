//
//  UIApplication.swift
//  AppCodeExample
//
//  Created Yury Radchenko on 4/9/19.
//  Copyright © 2019 iPadchenko. All rights reserved.
//

import UIKit

enum DeviceApp: String {
    case settings
    case music
    
    var urlString: String {
        switch self {
        case .settings:
            return UIApplication.openSettingsURLString
        case .music:
            return "music:"
        }
    }
}

extension UIApplication {
    
    func tryToOpen(url: URL?) {
        
        guard let someUrl = url else {
            return
        }
        
        if UIApplication.shared.canOpenURL(someUrl) {
            if #available(iOS 10.0, *) {
                UIApplication.shared.open(someUrl, options: [:], completionHandler: nil)
            } else {
                UIApplication.shared.openURL(someUrl)
            }
        }
    }
    
    func open(app: DeviceApp) {
        let appURL = URL(string: app.urlString)
        self.tryToOpen(url: appURL)
    }
    
    var topViewController: UIViewController? {
        var topVC = self.keyWindow?.rootViewController
        while((topVC!.presentedViewController) != nil) {
            topVC = topVC!.presentedViewController
        }
        return topVC
    }
}
