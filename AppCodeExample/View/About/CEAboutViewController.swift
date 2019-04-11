//
//  CEAboutViewController.swift
//  AppCodeExample
//
//  Created Yury Radchenko on 4/11/19.
//  Copyright © 2019 iPadchenko. All rights reserved.
//
//

import UIKit

final class CEAboutViewController: UIViewController {

    private lazy var tableVC = getChildren(vc: CEAboutTableViewController.self)
    private lazy var messageService = AppMailService()
    
    //MARK: -  View Controller
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "About"
        self.setBarButtonItems([.close], onSide: .right)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let tableVC = segue.destination as? CEAboutTableViewController {
            tableVC.didTap = { [weak self] cell in
                guard let self = self else { return }
                self.handleTapOn(cell)
            }
        }
    }
}

extension CEAboutViewController {
    
    override func didTapBarButtonItem(_ sender: UIBarButtonItem) {
        switch sender.type {
        case .close:
            self.dismiss(animated: true, completion: nil)
        default:
            break
        }
    }
    
    private func handleTapOn(_ cell: AboutCellModel) {
        switch cell {
        case .linkedin:
            self.safariOpenLink(ThisApp.linkedin)
        case .support:
            self.sendEmail()
        case .description:
            break
        }
    }
    
    private func sendEmail() {
        let email = AppMailModel(type: .support)
        self.messageService.configure(mail: email, delegate: self)
        self.messageService.sendMail()
    }
}

//MARK: - MailServiceDelegate -
extension CEAboutViewController : MailServiceDelegate {
    
    func emailSend(result: Result<Any, AppError>) {
        switch result {
        case .success:
            break
        case .failure(let error):
            self.alert(error: error)
        }
    }
}

//MARK: -   StoryboardInstanceable -
extension CEAboutViewController : StoryboardInstanceable {
    static var storyboardName: StoryboardName = .about
}
