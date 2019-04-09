//
//  UIDevice.swift
//  trueprice
//
//  Created by Yury Radchenko on 11/8/18.
//  Copyright © 2018 iPadchenko. All rights reserved.
//

import UIKit

enum DeviceInch {
    case inch35 //iPhone4S
    case inch4  //iPhone5, iPhone 5, iPhone 5S, iPhone 5C, iPod touch 5G, iPhone SE
    case inch47 //iPhone 6, iPhone 6s, iPhone 7, iPhone 8
    case inch55 //iPhone 6 Plus, iPhone 6s Plus, iPhone 7Plus, iPhone 8Plus
    case inch58 //iPhone X //5,8 дюйма, разрешением 2436×1125 точек (458 ppi)
    case inch61 //iPhone XR
    case inch65 //iPhone XSMax
    
    case inch79 //iPad mini 4
    case inch97 //iPad, iPad2, iPad 3 Retina, iPad 4 Retina
    case inch105 //iPad Air, iPad Air 2
    case inch11  //iPad Pro
    case inch129 //iPad Pro
    
    var text: String {
        switch self {
        case .inch35: return "3.5\""
        case .inch4: return "4\""
        case .inch47: return "4.7\""
        case .inch55: return "5.5\""
        case .inch58: return "5.8\""
        case .inch61: return "6.1\""
        case .inch65: return "6.5\""
        case .inch79: return "7.9\""
        case .inch97: return "9.7\""
        case .inch105: return "10.5\""
        case .inch11: return "11\""
        case .inch129: return "12.9\""
        }
    }
}

enum DeviceType {
    case iPhone
    case iPhoneSomeX
    case iPad
}

extension UIDevice {
    
    // model identifiers can be found at https://www.theiphonewiki.com/wiki/Models
    static let modelIdentifier: String = {
        if let simulatorModelIdentifier = ProcessInfo().environment["SIMULATOR_MODEL_IDENTIFIER"] {
            return simulatorModelIdentifier
        }
        
        var sysinfo = utsname()
        uname(&sysinfo) // ignore return value
        return String(bytes: Data(bytes: &sysinfo.machine, count: Int(_SYS_NAMELEN)), encoding: .ascii)!.trimmingCharacters(in: .controlCharacters)
    }()
    
}

public extension UIDevice {
    
    static let modelName: String = {
        var systemInfo = utsname()
        uname(&systemInfo)
        let machineMirror = Mirror(reflecting: systemInfo.machine)
        let identifier = machineMirror.children.reduce("") { identifier, element in
            guard let value = element.value as? Int8, value != 0 else { return identifier }
            return identifier + String(UnicodeScalar(UInt8(value)))
        }
        
        func mapToDevice(identifier: String) -> String { // swiftlint:disable:this cyclomatic_complexity
            #if os(iOS)
            switch identifier {
            case "iPod5,1":                                 return "iPod Touch 5"
            case "iPod7,1":                                 return "iPod Touch 6"
            case "iPhone3,1", "iPhone3,2", "iPhone3,3":     return "iPhone 4"
            case "iPhone4,1":                               return "iPhone 4s"
            case "iPhone5,1", "iPhone5,2":                  return "iPhone 5"
            case "iPhone5,3", "iPhone5,4":                  return "iPhone 5c"
            case "iPhone6,1", "iPhone6,2":                  return "iPhone 5s"
            case "iPhone7,2":                               return "iPhone 6"
            case "iPhone7,1":                               return "iPhone 6 Plus"
            case "iPhone8,1":                               return "iPhone 6s"
            case "iPhone8,2":                               return "iPhone 6s Plus"
            case "iPhone9,1", "iPhone9,3":                  return "iPhone 7"
            case "iPhone9,2", "iPhone9,4":                  return "iPhone 7 Plus"
            case "iPhone8,4":                               return "iPhone SE"
            case "iPhone10,1", "iPhone10,4":                return "iPhone 8"
            case "iPhone10,2", "iPhone10,5":                return "iPhone 8 Plus"
            case "iPhone10,3", "iPhone10,6":                return "iPhone X"
            case "iPhone11,2":                              return "iPhone XS"
            case "iPhone11,4", "iPhone11,6":                return "iPhone XS Max"
            case "iPhone11,8":                              return "iPhone XR"
            case "iPad2,1", "iPad2,2", "iPad2,3", "iPad2,4":return "iPad 2"
            case "iPad3,1", "iPad3,2", "iPad3,3":           return "iPad 3"
            case "iPad3,4", "iPad3,5", "iPad3,6":           return "iPad 4"
            case "iPad4,1", "iPad4,2", "iPad4,3":           return "iPad Air"
            case "iPad5,3", "iPad5,4":                      return "iPad Air 2"
            case "iPad6,11", "iPad6,12":                    return "iPad 5"
            case "iPad7,5", "iPad7,6":                      return "iPad 6"
            case "iPad2,5", "iPad2,6", "iPad2,7":           return "iPad Mini"
            case "iPad4,4", "iPad4,5", "iPad4,6":           return "iPad Mini 2"
            case "iPad4,7", "iPad4,8", "iPad4,9":           return "iPad Mini 3"
            case "iPad5,1", "iPad5,2":                      return "iPad Mini 4"
            case "iPad6,3", "iPad6,4":                      return "iPad Pro (9.7-inch)"
            case "iPad6,7", "iPad6,8":                      return "iPad Pro (12.9-inch)"
            case "iPad7,1", "iPad7,2":                      return "iPad Pro (12.9-inch) (2nd generation)"
            case "iPad7,3", "iPad7,4":                      return "iPad Pro (10.5-inch)"
            case "iPad8,1", "iPad8,2", "iPad8,3", "iPad8,4":return "iPad Pro (11-inch)"
            case "iPad8,5", "iPad8,6", "iPad8,7", "iPad8,8":return "iPad Pro (12.9-inch) (3rd generation)"
            case "AppleTV5,3":                              return "Apple TV"
            case "AppleTV6,2":                              return "Apple TV 4K"
            case "AudioAccessory1,1":                       return "HomePod"
            case "i386", "x86_64":                          return "Simulator \(mapToDevice(identifier: ProcessInfo().environment["SIMULATOR_MODEL_IDENTIFIER"] ?? "iOS"))"
            default:                                        return identifier
            }
            #elseif os(tvOS)
            switch identifier {
            case "AppleTV5,3": return "Apple TV 4"
            case "AppleTV6,2": return "Apple TV 4K"
            case "i386", "x86_64": return "Simulator \(mapToDevice(identifier: ProcessInfo().environment["SIMULATOR_MODEL_IDENTIFIER"] ?? "tvOS"))"
            default: return identifier
            }
            #endif
        }
        
        return mapToDevice(identifier: identifier)
    }()
}

extension UIDevice {
    
    var type: DeviceType {
        switch self.inch {
        case .inch35, .inch4, .inch47, .inch55:
            return DeviceType.iPhone
        case .inch58, .inch61, .inch65:
            return DeviceType.iPhoneSomeX
        case .inch79, .inch97, .inch105, .inch11, .inch129:
            return DeviceType.iPad
        }
    }
    
    var isLandscape: Bool {
        return self.orientation.isLandscape || UIApplication.shared.statusBarOrientation.isLandscape
    }
    
    var isPortrait: Bool {
        return self.orientation.isPortrait || UIApplication.shared.statusBarOrientation.isPortrait
    }
    
    var isIphone: Bool {
        return self.userInterfaceIdiom == .phone
    }
    
    var isIpad: Bool {
        return self.userInterfaceIdiom == .pad
    }
    
    var isIphoneSomeX: Bool {
        return self.type == .iPhoneSomeX
    }
    
    var isSimulator: Bool {
        return TARGET_OS_SIMULATOR != 0
    }
    
    var inch: DeviceInch {
        
        //https://i.stack.imgur.com/Vqsic.png
        switch UIScreen.main.nativeBounds.height {
        case 1136: return DeviceInch.inch4 //iPhone 5, 5S, 5C, SE
        case 1334: return DeviceInch.inch47 //iPhone 6, 6S, 7, 8
        case 2208: return DeviceInch.inch55 //iPhone 6S Plus, 7Plus, 8Plus
            
        case 2436: return DeviceInch.inch58 //iPhoneX, iPhone XS
        case 1792: return DeviceInch.inch61 //iPhone XR
        case 2688: return DeviceInch.inch65 //iPhone XSMax
            
        //iPad
        case 2048:
            let model = UIDevice.modelIdentifier
            if model == "iPad5,1" || model == "iPad5,2" {
                return DeviceInch.inch79 //iPad mini 4
            } else {
                return DeviceInch.inch97 //iPad 9.7
            }
            
        case 2224: return DeviceInch.inch105 //iPad Pro
        case 2388: return DeviceInch.inch11 //iPad Pro
        case 2732: return DeviceInch.inch129 //iPad Pro
        default:
            return DeviceInch.inch35 //iPhone4S
        }
    }
}
