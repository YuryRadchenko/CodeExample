//
//  CEFeedViewController.swift
//  AppCodeExample
//
//  Created Yury Radchenko on 4/9/19.
//  Copyright © 2019 iPadchenko. All rights reserved.
//
//

import UIKit

final class CEFeedViewController: UIViewController {
    
    @IBOutlet weak var activity: UIActivityIndicatorView! {
        didSet {
            activity.style = .gray
            activity.hidesWhenStopped = true
        }
    }
    
    private lazy var tableVC = getChildren(vc: CEFeedTableViewController.self)
    
    //MARK: -  View Controller
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = nil
        self.setBarButtonItems([.back], onSide: SideOnBar.left)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.loadFeed()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let tableVC = segue.destination as? CEFeedTableViewController {
            tableVC.didTap = { [weak self] item in
                guard let self = self else { return }
                self.tapOnFeedItem(item)
            }
        }
    }
    
    private func loadFeed() {
        self.activity.startAnimating()
        
        DataManager.getFeed { [weak self] (result) in
            guard let self = self else { return }
            self.activity.stopAnimating()
        
            switch result {
            case .success(let feed):
                self.loadedFeed(feed)
                
            case .failure(let error):
                print(error.fullDebugInfo)
                self.alert(error: error)
            }
        }
    }
    
    private func loadedFeed(_ feed: CEFeed) {
        self.title = feed.title
        self.tableVC?.items = feed.items
    }
}

extension CEFeedViewController {
    
    override func didTapBarButtonItem(_ sender: UIBarButtonItem) {
        switch sender.type {
        case .back:
            self.navigationController?.popViewController(animated: true)
        default:
            break
        }
    }
    
    private func tapOnFeedItem(_ item: CEFeedItem) {
        if let vc = CEWebViewController.storyboardInstance {
            vc.title = item.title
            vc.content = item.content
            self.pushWithoutDoubleToViewController(vc: vc, animated: true)
        }
    }
}

//MARK: -   StoryboardInstanceable -
extension CEFeedViewController : StoryboardInstanceable {
    static var storyboardName: StoryboardName = .main
}
