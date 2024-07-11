//
//  ViewController.swift
//  WireWheelClient
//
//  Created by Simpalm iOS on 09/08/23.
//

import UIKit
import WireWheelSDK

class ViewController: UIViewController {
    
    @IBOutlet weak var btnOpenSDK: UIButton!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        btnOpenSDK.layer.borderColor = UIColor.systemBackground.cgColor
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func btnOpenSDKPressedAction(_ sender:UIButton) {
        let wireWheelSDKSwift =  WireWheelSDKSwift.shared
        wireWheelSDKSwift.initWith(view: self, clientId: Constant.clientId, clientSecret: Constant.clientSecret, issuerURL: Constant.issuerURL, channelId: Constant.channelId)
       
        //Delegate
        wireWheelSDKSwift.delegate = self
        
        wireWheelSDKSwift.navigationTab = .consent
       
        /*wireWheelSDKSwift.verifiedEmailAddress = "wasim@simpalm.com"
        
        //Fonts
        wireWheelSDKSwift.headingFont = "Times New Roman"
        wireWheelSDKSwift.paragraphFont = "Open Sans"
        wireWheelSDKSwift.buttonsFont = "Verdana"
        
        //Color
        wireWheelSDKSwift.headingColor = .cyan
        wireWheelSDKSwift.paragraphColor = .darkGray
        wireWheelSDKSwift.buttonsColor = .red
        wireWheelSDKSwift.pageBackgroundColor = .magenta
        wireWheelSDKSwift.cellBackgroundColor = .lightGray
        
        // Navigate to Tab Selection
        wireWheelSDKSwift.navigationTab = .consent
        
        
        //Change Text
        // --------------------- Dashboard ---------------------
        //Tab
        wireWheelSDKSwift.tabConsentText = "Tab1"
        wireWheelSDKSwift.tabCommunicationsText = "Tab2"
        
        //Submit Button
        wireWheelSDKSwift.dashboardButtonText = "Upload"
        
        //Table Cell
        wireWheelSDKSwift.cellMoreInfoText = "Show"
        wireWheelSDKSwift.cellOptInText = "Yes"
        wireWheelSDKSwift.cellOptOutText = "No"
        
        //Privacy Policy
        wireWheelSDKSwift.menuPrivacyPolicyText = "Need Help"
        
        // --------------------- Thank you ---------------------
        //Dialog Thank you
        wireWheelSDKSwift.dialogThankYouTitleText = "Hurry!!"
        wireWheelSDKSwift.dialogThankYouMessageText = "Data Saved"
        wireWheelSDKSwift.dialogThankYouButtonText = "Record"
        
        // --------------------- Verified ---------------------
        //Dialog Verified
        wireWheelSDKSwift.dialogVerifyTitleText = "Verified User"
        wireWheelSDKSwift.dialogVerifyMessageText = "You are Verified"
        wireWheelSDKSwift.dialogVerifyButtonText = "Verified"
        
        // --------------------- Save changes ---------------------
        //Dialog Save changes
        wireWheelSDKSwift.dialogSaveTitleText = "Unsaved Changes"
        wireWheelSDKSwift.dialogSaveMessageText = "You Choices Not Saved Yet"
        wireWheelSDKSwift.dialogSaveButtonText = "Yes"
        wireWheelSDKSwift.dialogCancelButtonText = "No"
        
        // --------------------- Verification ---------------------
        //Dialog Verification
        wireWheelSDKSwift.dialogVerificationTitleText = "Record Data"
        wireWheelSDKSwift.dialogVerificationMessageText = "Verify your Identity"
        wireWheelSDKSwift.dialogEmailPlacerholder = "Email"
        wireWheelSDKSwift.dialogVerificationCodePlacerholder = "Verify"
        wireWheelSDKSwift.dialogVerificationSubmitButtonText = "Send Email"
        wireWheelSDKSwift.dialogVerificationVerifyButtonText = "Email Verify"*/
        
        if sender.tag == 2 {
            wireWheelSDKSwift.navigationTab = .communication
        }
    }
}

extension ViewController : WireWheelSDKSwiftDelegate {
    
    func didSubmitWireWheelSDK(selectedItemAt index: Int, action: [[String:Any]]) {
        print("didSubmitWireWheelSDK :", index, action)
    }
    
    
    func didCancelWireWheelSDK() {
        print("didCancelWireWheelSDK")
    }
    
    
    func didWireWheelSDKPrivacyPolicy() {
        print("didWireWheelSDKPrivacyPolicy")
        self.dismiss(animated: true) {
            let vc = self.storyboard?.instantiateViewController(withIdentifier: "PrivacyPolicyViewController") as! PrivacyPolicyViewController
            self.navigationController?.pushViewController(vc, animated: true)
        }
        
        /*let urlSting = "https://www.google.co.in"
         if let url = URL(string: urlSting), UIApplication.shared.canOpenURL(url) {
         UIApplication.shared.open(url)
         }*/
        
    }
}

