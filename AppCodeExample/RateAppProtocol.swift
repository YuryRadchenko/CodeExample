//
//  RateAppProtocol.swift
//  AppCodeExample
//
//  Created Yury Radchenko on 4/9/19.
//  Copyright © 2019 iPadchenko. All rights reserved.
//

import UIKit
import StoreKit

protocol RateAppProtocol {
    var appStoreRateLink: String { set get}
}

extension RateAppProtocol {
    
    func rateApp() {

        if #available(iOS 10.0, *) {
            if #available(iOS 10.3, *) {
                DispatchQueue.main.async {
                    SKStoreReviewController.requestReview()
                }
            } else {
                guard let url = URL(string : appStoreRateLink) else {
                    return
                }
                UIApplication.shared.open(url, options: [:], completionHandler: { _ in
                    //
                })
            }
        } else {
            guard let url = URL(string : appStoreRateLink) else {
                return
            }
            if UIApplication.shared.canOpenURL(url)  {
                UIApplication.shared.openURL(url)
            }
        }
    }
}
