//
//  AppMailModel.swift
//  AppCodeExample
//
//  Created Yury Radchenko on 4/9/19.
//  Copyright © 2019 iPadchenko. All rights reserved.
//

import UIKit

enum AppMailModelType {
    case support
}

class AppMailModel {
    
    var recipients: [String] = []
    var subject = ""
    var message = ""
    var isHTML = true
    var addTechInfo = true
    
    init() { }
    
    init(type: AppMailModelType) {
        switch type {
        case .support:
            self.recipients = [ThisApp.Support.email]
            self.subject = ""
            self.isHTML = true
            self.addTechInfo = true
        }
    }
}

extension AppMailModel {
    
    private var endOfLine: String {
        return self.isHTML ? "<br>" : "\n"
    }
    
    var isResipientsCorrect: Bool {
        return !self.recipients.isEmpty
    }
    
    var messageBody: String {
        
        if self.addTechInfo {
            var topSpace = ""
            (1...7).forEach { _ in topSpace += self.endOfLine }
            if self.isHTML {
                return self.message + topSpace + "<hr>" + "<p style=\"color:#959595\";>" + self.techInfo + "</p><hr>"
            } else {
                return self.message + topSpace + self.techInfo
            }
        }
        return self.message
    }
    
    private var techInfo: String {
        
        let locale = Locale.current
        let device = UIDevice.current
        
        let country = locale.regionCode ?? "n/a"
        let appName = "AppName"
        
        return appName + " ver." + Bundle.main.versionFull +
            self.endOfLine + UIDevice.modelName + " \(device.inch.text)" + ", iOS " + device.systemVersion +
            self.endOfLine + "Country: " + country +
            self.endOfLine + "Device language: " + locale.preferredLanguage.fullCode
    }
}
