//
//  CEMainNavigationController.swift
//  AppCodeExample
//
//  Created Yury Radchenko on 4/9/19.
//  Copyright © 2019 iPadchenko. All rights reserved.
//
//

import UIKit

final class CEMainNavigationController: UINavigationController {
    
    //MARK: -  Navigation Controller
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.configUI()
    }
    
    private func configUI() {
        let navigationBarAppearace = UINavigationBar.appearance()
        navigationBarAppearace.isTranslucent = false
        navigationBarAppearace.tintColor = .appWhite
        navigationBarAppearace.barTintColor = .appBlueLight
        navigationBarAppearace.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.appWhite]
        
        self.removeShadowLine()
    }
}

//MARK: -   StoryboardInstanceable -
extension CEMainNavigationController: StoryboardInstanceable {
    static var storyboardName: StoryboardName = .main
}
