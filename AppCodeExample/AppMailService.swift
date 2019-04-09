//
//  AppMailService.swift
//  AppCodeExample
//
//  Created Yury Radchenko on 4/9/19.
//  Copyright © 2019 iPadchenko. All rights reserved.
//

import MessageUI //Add MessageUI.framework in Linked Frameworks and Libraries

protocol MailServiceDelegate: class {
    //func emailSend(result: ManagerResult, isSettingsMove: Bool)
}

class AppMailService: NSObject {
    
    private weak var delegate: MailServiceDelegate?
    private var mailModel = AppMailModel()
    
    func configure(mail: AppMailModel, delegate: MailServiceDelegate?) {
        self.mailModel = mail
        self.delegate = delegate
    }
    
    func sendMail() {
        
        if MFMailComposeViewController.canSendMail() {
            let mailComposeVC = self.configuredMailComposeVC()
            if let fromVC = delegate as? UIViewController {
                fromVC.present(mailComposeVC, animated: true, completion: nil)
            }
            
        } else {
            #if DEBUG
            print("Text for email:\n" + self.mailModel.messageBody)
            #endif
            //let error = PError(message: "The device can't send mail")
            //self.delegate?.emailSend(result: .failure(error), isSettingsMove: true)
        }
    }
    
    private func configuredMailComposeVC() -> MFMailComposeViewController {
        let mailComposerVC = MFMailComposeViewController()
        mailComposerVC.mailComposeDelegate = self
        
        mailComposerVC.setToRecipients(self.mailModel.recipients)
        mailComposerVC.setSubject(self.mailModel.subject)
        mailComposerVC.setMessageBody(self.mailModel.messageBody, isHTML: self.mailModel.isHTML)
        return mailComposerVC
    }
}

//MARK: - MFMailComposeViewControllerDelegate -
extension AppMailService: MFMailComposeViewControllerDelegate {
    
    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        
        switch result {
        case .failed:
            //let returnError = PError(message: "Failed to send email")
            //self.delegate?.emailSend(result: .failure(returnError), isSettingsMove: false)
            break
            
        case .cancelled, .saved, .sent:
            break
            
        @unknown default:
            break
        }
        controller.dismiss(animated: true, completion: nil)
    }
}
