//
//  CEAuthor.swift
//  AppCodeExample
//
//  Created Yury Radchenko on 4/9/19.
//  Copyright © 2019 iPadchenko. All rights reserved.
//
//

import Foundation

final class CEAuthor : Codable {
    var name: String?
    var url: String?
    
    enum CodingKeys: String, CodingKey {
        case name
        case url
    }
}
