//
//  DispatchQueue.swift
//  AppCodeExample
//
//  Created Yury Radchenko on 4/9/19.
//  Copyright © 2019 iPadchenko. All rights reserved.
//

import Foundation

extension DispatchQueue {
    
    /**
     Executes a code block after asynchronously a time of delay
     
     - parameter seconds: The delay in seconds
     - parameter execute block: The code to execute
     */
    public func delaySeconds(_ seconds: TimeInterval, execute block: @escaping () -> Void) {
        self.asyncAfter(deadline: DispatchTime.now() + seconds, execute: block)
    }
}
