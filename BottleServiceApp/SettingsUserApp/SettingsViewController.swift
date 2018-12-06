//
//  SettingsViewController.swift
//  BottleServiceApp
//
//  Created by David Olarte on 10/10/2018.
//  Copyright © 2018 Iselacher Digital Media Factory. All rights reserved.
//

import UIKit
import Firebase

class SettingsViewController: UIViewController, UITextFieldDelegate {
    @IBOutlet weak var txtCurrentPassword: UITextField!
    @IBOutlet weak var btnCurrentView: UIButton!
    @IBOutlet weak var btnCurrentNon: UIButton!
    
    @IBOutlet weak var txtNewPass: UITextField!
    @IBOutlet weak var btnNewView: UIButton!
    @IBOutlet weak var btnNewNon: UIButton!
    
    @IBOutlet weak var txtRepeatNewPass: UITextField!
    @IBOutlet weak var btnRetypeNon: UIButton!
    @IBOutlet weak var btnRetypeView: UIButton!
    
    
    @IBOutlet weak var lblmeter: UILabel!
    @IBOutlet weak var PassStrong: UIImageView!
    @IBOutlet weak var PassWeak: UIImageView!
    @IBOutlet weak var PassMedium: UIImageView!
    
    //declare
    
    var iconClick : Bool!
    
    
    
    //function of Button
    
    
    @IBAction func btnCurrentView(_ sender: Any) {
        btnCurrentNon.isHidden = false;
        btnCurrentView.isHidden = true;
        
        
        if (iconClick == true) {
            
            
            txtCurrentPassword.isSecureTextEntry = false
            iconClick = false
        } else {
            
            txtCurrentPassword.isSecureTextEntry = true
          iconClick = true
        }
        
        
    }
    
    @IBAction func btnCurrentNonView(_ sender: Any) {
        
        btnCurrentNon.isHidden = true;
        btnCurrentView.isHidden = false;
        
        
        if (iconClick == true) {
            
            
            txtCurrentPassword.isSecureTextEntry = true
            iconClick = true
        } else {
            
            txtCurrentPassword.isSecureTextEntry = true
            iconClick = true
        }
        

        
        
        
        
        
        
    }
    
    @IBAction func btnNewView(_ sender: Any) {
        
       btnNewNon.isHidden = false;
        btnNewView.isHidden = true;
        
        
        if (iconClick == true) {
            
            
            txtNewPass.isSecureTextEntry = false
            iconClick = false
        } else {
            
            txtNewPass.isSecureTextEntry = true
            iconClick = true
        }
        
    }
    
    
    @IBAction func btnNewNonView(_ sender: Any) {
        
        btnNewNon.isHidden = true;
        btnNewView.isHidden = false;
        
        
        if (iconClick == true) {
            
            
            txtNewPass.isSecureTextEntry = true
            iconClick = true
        } else {
            
            txtNewPass.isSecureTextEntry = true
            iconClick = true
        }
        
        
    }
    
    @IBAction func btnRetypeView(_ sender: Any) {
        
        btnNewNon.isHidden = false;
        btnNewView.isHidden = true;
        
        
        if (iconClick == true) {
            
            
            txtRepeatNewPass.isSecureTextEntry = false
            iconClick = false
        } else {
            
            txtRepeatNewPass.isSecureTextEntry = true
            iconClick = true
        }
        
        
        
        
        
        
    }
    
    @IBAction func btnRetypeNon(_ sender: Any) {
        
        btnNewNon.isHidden = true;
        btnNewView.isHidden = false;
        
        
        if (iconClick == true) {
            
            
            txtNewPass.isSecureTextEntry = true
            iconClick = true
        } else {
            
            txtNewPass.isSecureTextEntry = true
            iconClick = true
        }
        
    }
    
    func keyboardWillShow(sender: NSNotification) {
    self.view.frame.origin.y = -150 // Move view 150 points upward
    }
    
    func keyboardWillHide(sender: NSNotification) {
        self.view.frame.origin.y = 0 // Move view to original position
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        NotificationCenter.default.addObserver(self, selector: Selector(("keyboardWillShow:")), name:NSNotification.Name.UIKeyboardWillShow, object: nil);
        NotificationCenter.default.addObserver(self, selector: Selector(("keyboardWillHide:")), name:NSNotification.Name.UIKeyboardWillHide, object: nil);

        
      txtNewPass.botLine()
        txtRepeatNewPass.botLine()
        txtCurrentPassword.botLine()
        

        
        btnNewNon.isHidden = true;
        btnCurrentNon.isHidden = true;
        btnRetypeNon.isHidden = true;
        iconClick = false
        
        self.hideKeyboardWhenTappedAround()
        txtCurrentPassword.delegate = self
        txtRepeatNewPass.delegate = self
        txtNewPass.delegate = self
        
        

        // Do any additional setup after loading the view.
    }
    


}
