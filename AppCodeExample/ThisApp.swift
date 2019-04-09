//
//  ThisApp.swift
//  AppCodeExample
//
//  Created Yury Radchenko on 4/9/19.
//  Copyright © 2019 iPadchenko. All rights reserved.
//

import UIKit
import StoreKit

enum ThisApp {
    
    static let appId = "123456789"
    
    enum API {
        static var baseAPIHost: String {
            return "https://server.com/api/"
        }
        static var version: String {
            return "v1"
        }
        
        static func fullPath(_ path: String) -> String {
            return API.baseAPIHost + API.version + "/" + path
        }
    }
    
    enum Support {
        static let email = "yury.radchenko@gmail.com"
    }
    
    enum AppStore {
        static let rateLink = "itms-apps://itunes.apple.com/app/id\(ThisApp.appId)"
        static let webLink = "https://itunes.apple.com/app/id\(ThisApp.appId)"
        
        static func requestReview() {
            guard let url = URL(string : ThisApp.AppStore.rateLink) else {
                return
            }
            
            if #available(iOS 10, *) {
                if #available(iOS 10.3, *) {
                    SKStoreReviewController.requestReview()
                } else {
                    UIApplication.shared.open(url, options: [:], completionHandler: { (success) in
                        //
                    })
                }
            } else {
                if UIApplication.shared.canOpenURL(url)  {
                    UIApplication.shared.openURL(url)
                }
            }
        }
    }

    
    
}
