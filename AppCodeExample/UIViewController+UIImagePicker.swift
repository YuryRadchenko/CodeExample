//
//  UIViewController+UIImagePicker.swift
//  AppCodeExample
//
//  Created Yury Radchenko on 4/9/19.
//  Copyright © 2019 iPadchenko. All rights reserved.
//

import UIKit
import AVFoundation
import MobileCoreServices

extension UIViewController  {
    
    func chooseImagePickerSource(completion:@escaping (_ type: UIImagePickerController.SourceType) -> Void) {
        
        let actionSheetController = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        let selectFromGallery = UIAlertAction(title: "Choose photo", style: .default) { (action) in
            completion(.photoLibrary)
        }
        actionSheetController.addAction(selectFromGallery)
        
        if UIDevice.current.isSimulator.isFalse {
            let takePhoto = UIAlertAction(title: "Take photo", style: .default) { (action) in
                completion(.camera)
            }
            actionSheetController.addAction(takePhoto)
        }
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        actionSheetController.addAction(cancelAction)
        
        DispatchQueue.main.async {
            self.present(actionSheetController, animated: true, completion: nil)
        }
    }
    
    func presentImagePickerWithType(_ type : UIImagePickerController.SourceType, delegate: UIImagePickerControllerDelegate & UINavigationControllerDelegate)  {
        
        let imagePicker = UIImagePickerController()
        imagePicker.delegate = delegate
        imagePicker.sourceType = type
        imagePicker.modalPresentationStyle = .fullScreen
        imagePicker.allowsEditing = false
        
        switch type {
        case .photoLibrary:
            imagePicker.allowsEditing = true
            imagePicker.sourceType = .photoLibrary
            imagePicker.mediaTypes = [kUTTypeImage as String]
            DispatchQueue.main.async{
                self.present(imagePicker, animated: true, completion: nil)
            }
            
        case .camera:
            imagePicker.allowsEditing = true
            imagePicker.sourceType = .camera
            imagePicker.cameraCaptureMode = .photo
            imagePicker.isNavigationBarHidden = true
            imagePicker.showsCameraControls = true
            imagePicker.videoQuality = .typeHigh
            
            
            let cameraAuthStatus = AVCaptureDevice.authorizationStatus(for: .video)
            switch cameraAuthStatus {
            case .authorized:
                DispatchQueue.main.async{
                    self.present(imagePicker, animated: true, completion: nil)
                }
            case .notDetermined:
                AVCaptureDevice.requestAccess(for: AVMediaType.video, completionHandler: { (success) in
                    if success {
                        DispatchQueue.main.async{
                            self.present(imagePicker, animated: true, completion: nil)
                        }
                    } else {
                        DispatchQueue.main.async{
                            self.cameraError()
                        }
                    }
                })
            case .denied:
                DispatchQueue.main.async{
                    self.cameraError()
                }
            case .restricted:
                DispatchQueue.main.async{
                    self.cameraError()
                }
            @unknown default:
                print("Camera unknow error")
                DispatchQueue.main.async{
                    self.cameraError()
                }
            }
        default:
            break
        }
    }
    
    private func cameraError() {
        
        let alertMessage = "To access allow:\n1.Open 'Settings'.\n2.Open the item 'AppName'.\n3.Set access to a camera to allow.\n4.Try again to take a photo."
        let alertController = UIAlertController(title: "Camera access denied", message: alertMessage, preferredStyle: .alert)
        
        let cancelAction = UIAlertAction(title: "Cancel", style: UIAlertAction.Style.default, handler: nil)
        alertController.addAction(cancelAction)
        
        /*
         let settingsAction = UIAlertAction(title: "Settings", style: UIAlertActionStyle.default) { (action: UIAlertAction!) -> Void in
         UIApplication.shared.openSettings(app: UISettingsApp.generalSettings)
         }
         alertController.addAction(settingsAction)
         */
        DispatchQueue.main.async {
            self.present(alertController, animated: true, completion:nil)
        }
    }
    
}
