//
//  Locale.swift
//  AppCodeExample
//
//  Created Yury Radchenko on 4/9/19.
//  Copyright © 2019 iPadchenko. All rights reserved.
//

import Foundation

extension Locale {
    
    var preferredLanguage: (code: String, fullCode: String) {
        let preferredLanguages = Locale.preferredLanguages
        if !preferredLanguages.isEmpty {
            let preferredLanguage = preferredLanguages[0]
            let languageArray = preferredLanguage.components(separatedBy: "-")
            if !languageArray.isEmpty,  let preferredLanguageCode = languageArray.first {
                let preferredLanguageCodeString = String(preferredLanguageCode)
                return (code: preferredLanguageCodeString, fullCode: preferredLanguage)
            }
        }
        return (code: "en", fullCode: "en-US")
    }
}
