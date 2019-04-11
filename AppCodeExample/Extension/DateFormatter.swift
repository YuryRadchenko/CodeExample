//
//  DateFormatter.swift
//  AppCodeExample
//
//  Created by Yury Radchenko on 4/9/19.
//  Copyright © 2019 iPadchenko. All rights reserved.
//

import Foundation

extension DateFormatter {
    
    static let yyyyMMddTHHmmssZCount: Int = "yyyy-MM-ddTHH:mm:ssZ".count
    static let yyyyMMddTHHmmssZ: DateFormatter = {
        let formatter = DateFormatter()
        formatter.calendar = Calendar(identifier: .iso8601)
        formatter.locale = Locale(identifier: "en_US_POSIX")
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss'Z'" //"2019-04-06T20:23:25Z"
        return formatter
    }()
    
    static let short: DateFormatter = {
        let formatter = DateFormatter()
        formatter.calendar = Calendar(identifier: .iso8601)
        formatter.locale = Locale(identifier: "en_US_POSIX")
        formatter.dateStyle = .short
        formatter.timeStyle = .short
        return formatter
    }()
}
