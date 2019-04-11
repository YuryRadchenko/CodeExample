//
//  FakeLaunchViewController.swift
//  AppCodeExample
//
//  Created Yury Radchenko on 4/9/19.
//  Copyright © 2019 iPadchenko. All rights reserved.
//

import UIKit

final class FakeLaunchViewController: UIViewController {
    
    //MARK: -  View Controller
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        self.presentMainVC()
    }
    
    private func presentMainVC() {
        guard let mainNC = CEMainNavigationController.storyboardInstance else {
            return
        }
        
        DispatchQueue.main.async {
            UIApplication.shared.keyWindow?.rootViewController = mainNC
        }
    }
}

//MARK: -   StoryboardInstanceable -
extension FakeLaunchViewController : StoryboardInstanceable {
    static var storyboardName: StoryboardName = .fakeLaunch
}
