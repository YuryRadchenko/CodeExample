//
//  CEFeedItem.swift
//  AppCodeExample
//
//  Created Yury Radchenko on 4/9/19.
//  Copyright © 2019 iPadchenko. All rights reserved.
//
//

import Foundation

final class CEFeedItem : Codable {
    
    var id: String?
    var title: String?
    var datePublished: Date?
    var dateModified: Date?
    var url: String?
    var externalUrl: String?
    var author: CEAuthor?
    var content: HTML?
    
    enum CodingKeys: String, CodingKey {
        case id
        case title
        case datePublished = "date_published"
        case dateModified = "date_modified"
        case url
        case externalUrl = "external_url"
        case author
        case content = "content_html"
    }
    
    static var jsonDecoder: JSONDecoder {
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .custom({ (decoder) -> Date in
            let container = try decoder.singleValueContainer()
            var dateStr = try container.decode(String.self)
            
            let textLenth = DateFormatter.yyyyMMddTHHmmssZCount
            if dateStr.count > textLenth {
                dateStr = dateStr.firstChars((textLenth - 1)) + "Z"
            }
            
            guard let date = DateFormatter.yyyyMMddTHHmmssZ.date(from: dateStr) else {
                throw DecodingError.dataCorruptedError(
                    in: container,
                    debugDescription: "\(String(describing: type(of: self))). Cannot decode date string \(dateStr)"
                )
            }
            return date
        })
        return decoder
    }
}

extension CEFeedItem {
    
    var datePublishedFormatted: String? {
        guard let date = self.datePublished else { return nil }
        return DateFormatter.short.string(from: date)
    }
}
