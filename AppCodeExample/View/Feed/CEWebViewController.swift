//
//  CEWebViewController.swift
//  AppCodeExample
//
//  Created Yury Radchenko on 4/10/19.
//  Copyright © 2019 iPadchenko. All rights reserved.
//
//

import UIKit
import WebKit

final class CEWebViewController: UIViewController {

    private lazy var activityView: UIActivityIndicatorView = {
        let acitivity = UIActivityIndicatorView()
        acitivity.style = .gray
        acitivity.hidesWhenStopped = true
        return acitivity
    } ()
    
    private lazy var webView: WKWebView = {
        let configuration = WKWebViewConfiguration()
        let webView = WKWebView.init(frame: .zero, configuration: configuration)
        webView.navigationDelegate = self
        return webView
    } ()
    
    var content: HTML?
    
    //MARK:  View Controller
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setBarButtonItems([.back], onSide: SideOnBar.left)
        
        if let content = self.content {
            self.addWebviewToSelf()
            self.activityView.startAnimating()
            self.webView.loadHTMLString(content, baseURL: nil)
        }
    }
    
    private func addWebviewToSelf() {
        self.view = self.webView
        
        let frameOnCenter = CGRect.init(x: ceil(UIScreen.main.bounds.width / 2.0),
                                        y: ceil(UIScreen.main.bounds.height / 2.0),
                                        width: 10.0, height: 10.0)
        
        self.activityView.frame = frameOnCenter
        self.view.addSubview(self.activityView)
    }
    
    // MARK: - Actions
    @IBAction func didTapBackButton(_ sender: UIBarButtonItem) {
        DispatchQueue.main.async {
            self.navigationController?.popViewController(animated: true)
        }
    }
    
    override func didTapBarButtonItem(_ sender: UIBarButtonItem) {
        switch sender.type {
        case .back:
            self.navigationController?.popViewController(animated: true)
        default:
            break
        }
    }
}

//MARK: - WKNavigationDelegate -
extension CEWebViewController : WKNavigationDelegate {
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        self.activityView.stopAnimating()
    }
    
    func webView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: Error) {
        self.activityView.stopAnimating()
        self.alert(message: "Opps... error")
    }
}


//MARK: -   StoryboardInstanceable -
extension CEWebViewController : StoryboardInstanceable {
    static var storyboardName: StoryboardName = .main
}
