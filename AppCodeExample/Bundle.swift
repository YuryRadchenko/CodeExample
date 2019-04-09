//
//  Bundle.swift
//  AppCodeExample
//
//  Created Yury Radchenko on 4/9/19.
//  Copyright © 2019 iPadchenko. All rights reserved.
//

import Foundation

extension Bundle {
    
    private enum Key {
        static let shortVersion = "CFBundleShortVersionString"
        static let bundleVersion = kCFBundleVersionKey as String
        static let bundleName = kCFBundleNameKey as String
    }
    
    private enum Default {
        static let appName = ""
        static let version = "n/a"
        static let buildDate = "unknown"
    }
    
    //MARK: -
    
    var nameApp: String {
        
        guard let someInfoDictionary = self.infoDictionary else {
            return Default.appName
        }
        
        guard let bundleName = someInfoDictionary[Key.bundleName] as? String else {
            return Default.appName
        }
        
        return bundleName.capitalized
    }
    
    var nameAppVersion: String {
        return self.nameApp + " " + self.versionFull
    }
    
    var versionShort: String {
        
        guard let someInfoDictionary = self.infoDictionary else {
            return Default.version
        }
        
        guard let releaseVersion = someInfoDictionary[Key.shortVersion] as? String else {
            return Default.version
        }
        return releaseVersion
    }
    
    var versionFull: String {
        
        guard let someInfoDictionary = self.infoDictionary else {
            return Default.version
        }
        
        guard let releaseVersion = someInfoDictionary[Key.shortVersion] as? String,
            let buildVersion = someInfoDictionary[Key.bundleVersion] as? String else {
            return Default.version
        }
        
        let version = releaseVersion + "." + buildVersion
        return version
    }
    
    var versionBuild: String {
        
        guard let someInfoDictionary = self.infoDictionary else {
            return Default.version
        }
        
        guard let buildVersion = someInfoDictionary[Key.bundleVersion] as? String else {
            return Default.version
        }
        return buildVersion
    }
    
    var buildDate: String {
        
        guard let infoPath = Bundle.main.path(forResource: "Info.plist", ofType: nil) else {
            return Default.buildDate
        }
        
        guard let infoAttr = try? FileManager.default.attributesOfItem(atPath: infoPath) else {
            return Default.buildDate
        }
        
        let key = FileAttributeKey(rawValue: "NSFileCreationDate")
        guard let infoDate = infoAttr[key] as? Date else {
            return Default.buildDate
        }
        
        let formatter = DateFormatter()
        formatter.calendar = Calendar(identifier: .iso8601)
        formatter.locale = Locale.current
        formatter.timeStyle = .medium
        formatter.dateStyle = .short        
        return formatter.string(from: infoDate)
    }
}
