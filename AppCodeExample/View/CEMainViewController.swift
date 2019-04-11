//
//  CEMainViewController.swift
//  AppCodeExample
//
//  Created Yury Radchenko on 4/9/19.
//  Copyright © 2019 iPadchenko. All rights reserved.
//
//

import UIKit

final class CEMainViewController: UIViewController {
    
    @IBOutlet weak var aboutButton: UIButton! {
        didSet {
            guard let button = aboutButton else { return }
            button.setTitle("About", for: .normal)
            button.setImage(nil, for: .normal)
            button.setTitleColor(.appWhite, for: .normal)
            button.backgroundColor = .appBlueLight
            button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 52)
        }
    }
    
    @IBOutlet weak var feedButton: UIButton! {
        didSet {
            guard let button = feedButton else { return }
            button.setTitle("Feed", for: .normal)
            button.setImage(nil, for: .normal)
            button.setTitleColor(.appWhite, for: .normal)
            button.backgroundColor = .appBlueDark
            button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 52)
        }
    }
    
    //MARK: -  View Controller
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = ThisApp.appName
        self.view.backgroundColor = .appBlueDark
    }
    
    @IBAction func didTapAboutButton(_ sender: UIButton) {
        
        if let vc = CEAboutNavigationController.storyboardInstance {
            self.navigationController?.present(vc, animated: true, completion: nil)
        }
    }
    
    @IBAction func didTapFeed(_ sender: UIButton) {
        
        if let vc = CEFeedViewController.storyboardInstance {
            self.pushWithoutDoubleToViewController(vc: vc, animated: true)
        }
    }
    
}

//MARK: -   StoryboardInstanceable -
extension CEMainViewController : StoryboardInstanceable {
    static var storyboardName: StoryboardName = .main
}
