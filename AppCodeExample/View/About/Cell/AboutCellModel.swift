//
//  AboutCellModel.swift
//  AppCodeExample
//
//  Created Yury Radchenko on 4/10/19.
//  Copyright © 2019 iPadchenko. All rights reserved.
//
//

import Foundation

enum AboutCellModel : CaseIterable {
    case linkedin
    case support
    case description
}

extension AboutCellModel: DataCellModelProtocol {
    
    var title: String? {
        switch self {
        case .linkedin: return "LinkedIn"
        case .support: return "Support"
        case .description: return nil
        }
    }
    
    var value: String? {
        switch self {
        case .linkedin: return "Yurii Radchenko"
        case .support: return ThisApp.Support.email
        case .description: return
            """
            The app was created to demo my approach to the development of an iOS app and a style of writing code.
            
            The app does:
            1. Receives data from an RSS feed as JSON from
            https://daringfireball.net/feeds/json
            2. Parses data using a Swift protocol Codable
            3. Shows a list of news.
            4. Shows the HTML text of the news in a separate window.
            """
        }
    }
}
