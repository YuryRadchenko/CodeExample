//
//  AppErrorType.swift
//  AppCodeExample
//
//  Created by Yury Radchenko on 4/9/19.
//  Copyright © 2019 iPadchenko. All rights reserved.
//

import Foundation

enum AppErrorType {
    case custom
    case api(Int)
    case parsing
    
    static let `default` = AppErrorType.custom
}

extension AppErrorType {
    
    var title: String? {
        switch self {
        case .custom: return nil
        case .api(_): return "Server error"
        case .parsing: return "Parsing error"
        }
    }
    
    var message: String? {
        switch self {
        case .custom, .parsing:
            return nil
            
        case .api(let httpStatusCode):
            switch httpStatusCode {
                case 100: return "Continue (100)"
                case 101: return "Switching Protocols (101)"
                case 102: return "Processing (102)"
                
                case 300: return "Multiple Choices (300)"
                case 301: return "Moved Permanently (301)"
                case 302: return "Moved Temporarily (302)"
                case 303: return "See Other (303)"
                case 304: return "Not Modified (304)"
                case 305: return "Use Proxy (305)"
                case 307: return "Temporary Redirect (307)"
                
                case 400: return "Bad Request (400)"
                case 401: return "Unauthorized (401)"
                case 403: return "Forbidden (403)"
                case 404: return "Not Found (404)"
                case 405: return "Method Not Allowed (405)"
                case 406: return "Not Acceptable (406)"
                case 407: return "Proxy Authentication Required (407)"
                case 408: return "Request Timeout (408)"
                case 409: return "Conflict (409)"
                case 410: return "Gone (410)"
                case 411: return "Length Required (411)"
                case 412: return "Precondition Failed (412)"
                case 413: return "Request Entity Too Large (413)"
                case 414: return "Request-URI Too Large (414)"
                case 415: return "Unsupported Media Type(415)"
                case 416: return "Requested Range Not Satisfiable (416)"
                case 417: return "Expectation Failed (417)"
                case 422: return "Unprocessable Entity (422)"
                case 423: return "Locked (423)"
                case 424: return "Failed Dependency (424)"
                case 425: return "Unordered Collection (425)"
                case 426: return "Upgrade Required (426)"
                case 428: return "Precondition Required (428)"
                case 429: return "Too Many Requests (429)"
                case 431: return "Request Header Fields Too Large (431)"
                case 434: return "Requested host unavailable (434)"
                case 444: return "Server error (444)"
                case 449: return "Retry With (449)"
                case 451: return "Unavailable For Legal Reasons (451)"
                
                case 500: return "Internal Server Error (500)"
                case 501: return "Not Implemented (501)"
                case 502: return "Bad Gateway (502)"
                case 503: return "Service Unavailable (503)"
                case 504: return "Gateway Timeout (504)"
                case 505: return "HTTP Version Not Supported (505)"
                case 506: return "Variant Also Negotiates (506)"
                case 507: return "Insufficient Storage (507)"
                case 508: return "Loop Detected (508)"
                case 509: return "Bandwidth Limit Exceeded (509)"
                case 510: return "Not Extended (510)"
                case 511: return "Network Authentication Required (511)"
                
                default: return "HTTP status code \(httpStatusCode)"
            }
        }
    }
}
