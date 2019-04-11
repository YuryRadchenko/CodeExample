//
//  CEFeed.swift
//  AppCodeExample
//
//  Created Yury Radchenko on 4/9/19.
//  Copyright © 2019 iPadchenko. All rights reserved.
//
//

import Foundation

final class CEFeed : Codable {
    var version: String?
    var title: String?
    var homePageURL: String?
    var feedURL: String?
    var author: CEAuthor?
    var iconURL: String?
    var faviconURL: String?
    var items: [CEFeedItem] = []
    
    enum CodingKeys: String, CodingKey {
        case version
        case title
        case homePageURL = "home_page_url"
        case feedURL = "feed_url"
        case author
        case iconURL = "icon"
        case faviconURL = "favicon"
        case items
    }
}

extension CEFeed {
    
    static var jsonDecoder: JSONDecoder {
        let decoder = CEFeedItem.jsonDecoder
        return decoder
    }
}

////MARK: -  CustomStringConvertible
extension CEFeed: CustomStringConvertible {
    var description: String {
        return "Feed: " + (self.title ?? "") + "\n" + (self.feedURL ?? "")
    }
}
