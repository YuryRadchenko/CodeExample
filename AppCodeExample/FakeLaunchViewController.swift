//
//  FakeLaunchViewController.swift
//  AppCodeExample
//
//  Created Yury Radchenko on 4/9/19.
//  Copyright © 2019 iPadchenko. All rights reserved.
//

import UIKit

final class FakeLaunchViewController: UIViewController {

    @IBOutlet weak var activity: UIActivityIndicatorView! {
        didSet {
            activity.style = .whiteLarge
            activity.hidesWhenStopped = true
        }
    }
    
    //MARK: -  View Controller
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
    }
    
}

extension FakeLaunchViewController {
    
}

//MARK: -   StoryboardInstanceable -
extension FakeLaunchViewController : StoryboardInstanceable {
    static var storyboardName: StoryboardName = .fakeLaunch
}
