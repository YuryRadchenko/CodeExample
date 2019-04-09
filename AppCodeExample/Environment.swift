//
//  Environment.swift
//  citytrucker
//
//  Created by Yury Radchenko on 1/16/19.
//  Copyright © 2019 CityTrucker, LLC. All rights reserved.
//

import Foundation

//MARK: -  Environment
final class Environment {
    
    class var workMode: WorkMode {
        
        var output = WorkMode.default
        for mode in WorkMode.allCases {
            if let argument = mode.argumentName,
                ProcessInfo.processInfo.arguments.contains(argument) {
                output = mode
                break
            }
        }
        return output
    }
    
    class var configuration: BuildConfiguration {
        #if DEBUG
        return .debug
        #elseif ADHOC
        return .adHoc
        #else
        return .release
        #endif
    }
    
    class func printState() {
        
        let state = "Configuration = .\(Environment.configuration)" + "\n" +
            "ViewMode = .\(Environment.workMode.rawValue)" + "\n"
        
        print("=== Environment ===")
        print(state)
        print("===================")
    }
}

//MARK: -  BuildConfiguration
enum BuildConfiguration : String {
    case debug
    case adHoc
    case release
}

//MARK: -  WorkMode
enum WorkMode : String, CaseIterable {
    case standard //стандартная работа
    case screenshot //prepare data for some screens for screenshots in App Store
    case purchasesOnSimulator //тестирование включения/выключения покупок на симуляторе
    
    static let `default` = WorkMode.standard
}

extension WorkMode {
    
    var argumentName: String? {
        switch self {
        case .standard: return nil
        case .screenshot: return "DemoScreenshots"
        case .purchasesOnSimulator: return "PurchasesOnSimulator"
        }
    }
}
