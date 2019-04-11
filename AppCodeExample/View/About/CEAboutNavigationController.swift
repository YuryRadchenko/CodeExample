//
//  CEAboutNavigationController.swift
//  AppCodeExample
//
//  Created Yury Radchenko on 4/11/19.
//  Copyright © 2019 iPadchenko. All rights reserved.
//
//

import UIKit

final class CEAboutNavigationController: UINavigationController {
    
    //MARK: -  Navigation Controller
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
}

//MARK: -   StoryboardInstanceable -
extension CEAboutNavigationController: StoryboardInstanceable {
    static var storyboardName: StoryboardName = .about
}
