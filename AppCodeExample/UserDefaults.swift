//
//  UserDefaults.swift
//  AppCodeExample
//
//  Created Yury Radchenko on 4/9/19.
//  Copyright © 2019 iPadchenko. All rights reserved.
//

import Foundation

// MARK: - Misc
extension UserDefaults {
    
    public static func has(key: String) -> Bool {
        return self.standard.has(key: key)
    }
    
    public func has(key: String) -> Bool {
        return self.dictionaryRepresentation().keys.contains(key)
    }
}
