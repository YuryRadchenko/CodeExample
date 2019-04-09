//
//  UIViewController+Alert.swift
//  AppCodeExample
//
//  Created Yury Radchenko on 4/9/19.
//  Copyright © 2019 iPadchenko. All rights reserved.
//

import UIKit

struct AlertOption {
    var title: String?
    var message: String!
    var actions: [AlertAction] = [.default]
    
    init(message: String) {
        self.message = message
    }

    init(title: String?, message: String, actions: [AlertAction] = [.default]) {
        self.title = title
        self.message = message
        self.actions = actions
    }
}

//MARK: -  Alert. Simple
extension UIViewController {
    
    internal func alert(message: String) {
        let options = AlertOption(message: message)
        self.alert(with: options) { (_) in
            //nothing
        }
    }

    internal func alertTitle(_ alertTitle: String, message: String) {

        var options = AlertOption(message: message)
        if !alertTitle.isEmpty {
            options.title = alertTitle
        }
        
        self.alert(with: options) { (_) in
            //nothing
        }
    }

//    internal func alert(error: PError) {
//        self.alertError(error) { (_) in
//            //nothing
//        }
//    }
}

//MARK: -  Alert. Simple
extension UIViewController {
    
    internal func alert(with options: AlertOption, completion:@escaping (_ action: AlertAction) -> Void) {
        
        var processingAlertTitle: String?
        
        if let alertTitle = options.title, alertTitle.isEmpty {
            //nothing
        } else {
            processingAlertTitle = options.title
        }
        
        let alertController = UIAlertController(title: processingAlertTitle, message: options.message, preferredStyle: .alert)
        
        for actionItem in options.actions {
            let buttonTitle = actionItem.buttonTitle
            let alertAction = UIAlertAction(title: buttonTitle, style: actionItem.buttonActionStyle) { (action) in
                completion(actionItem)
            }
            alertController.addAction(alertAction)
        }
        
        DispatchQueue.main.async {
            self.present(alertController, animated: true, completion: nil)
        }
        
    }
    
//    internal func alertError(_ error: PError, withActions actions: [AlertAction] = [.default], completion:@escaping (_ action: AlertAction) -> Void) {
//
//        let options = AlertOption(title: error.title, message: error.message, actions: actions)
//        self.alert(with: options) { (alertAction) in
//            completion(alertAction)
//        }
//    }
}
