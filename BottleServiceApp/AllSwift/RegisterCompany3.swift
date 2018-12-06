//
//  RegisterCompany3.swift
//  BottleServiceApp
//
//  Created by David Olarte on 11.03.18.
//  Copyright © 2018 Iselacher Digital Media Factory. All rights reserved.
//

import UIKit
//import SwiftyJSON
//import Alamofire

class RegisterCompany3: UIViewController , UITextFieldDelegate{
    
    var email: String = ""
    var ComOwner: String = ""
    var ComName: String = ""
    var usertype: String = ""
    
    
     var iconClick : Bool!
  //  let URL_USER_BS = "http://bottleservice.ch/BottleserviceIOSConnection/EncryptPass.php"
    
    func isValidPass(passstring:String) -> Bool {
        let passwordRegex = "^[A-Za-z0-9 !\"#$%&'()*+,-./:;<=>?@\\[\\\\\\]^_`{|}~].{8,}$"
        
        let passtest = NSPredicate(format: "SELF MATCHES %@", passwordRegex)
        return passtest.evaluate(with: passstring)
        
    }
    
    
    @IBOutlet weak var lblMeter: UILabel!
    @IBOutlet weak var passWeak: UIImageView!
    @IBOutlet weak var passMedium: UIImageView!
    @IBOutlet weak var passStrong: UIImageView!
    
    @IBOutlet weak var btnPassView: UIButton!
    
    @IBOutlet weak var labelComOwner: UILabel!
    @IBOutlet weak var labelComName: UILabel!
    @IBOutlet weak var labelText: UILabel!
    @IBOutlet weak var txtReEnterPass: UITextField!
    @IBOutlet weak var txtPassword: UITextField!
    @IBOutlet weak var btnNext: UIButton!
    @IBOutlet weak var labelMessage: UILabel!
    @IBOutlet weak var btnReTypeNon: UIButton!
    @IBOutlet weak var btnRetypeView: UIButton!
    
    @IBOutlet weak var btnPassNonView: UIButton!
    
    
    @IBAction func btnPassView(_ sender: Any) {
        
        btnPassNonView.isHidden = false;
        btnPassView.isHidden = true;
        if(iconClick == true) {
            txtPassword.isSecureTextEntry = false
            iconClick = false
        } else {
            txtPassword.isSecureTextEntry = false
            iconClick = false
        }
        
        
    }
    
    @IBAction func btnPassNonView(_ sender: Any) {
        
        btnPassNonView.isHidden = true;
        btnPassView.isHidden = false;
        if(iconClick == true) {
            txtPassword.isSecureTextEntry = true
            iconClick = true
        } else {
            txtPassword.isSecureTextEntry = true
            iconClick = true
        }

        
    }
    
    
    
    
    @IBAction func btnRetypeView(_ sender: Any) {
        
        btnReTypeNon.isHidden = false;
        btnRetypeView.isHidden = true;
        if(iconClick == true) {
            txtReEnterPass.isSecureTextEntry = false
            iconClick = false
        } else {
            txtReEnterPass.isSecureTextEntry = false
            iconClick = false
        }
        
        
        
    }
    
    @IBAction func btnRetypeNon(_ sender: Any) {
        btnReTypeNon.isHidden = true;
        btnRetypeView.isHidden = false;
        if(iconClick == true) {
            txtReEnterPass.isSecureTextEntry = true
            iconClick = true
        } else {
            txtReEnterPass.isSecureTextEntry = true
            iconClick = true
        }
        
        
        
        
    }
    
    
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        let length = txtPassword.text!.count
        
        
        if txtPassword.text!.count < 4 {
            
            passWeak.isHidden = false
            
            passMedium.isHidden = true
            lblMeter.backgroundColor = UIColor.red
            lblMeter.alpha = 0.5
  
        }
        
        if txtPassword.text!.count > 4{
            passMedium.isHidden = false
            lblMeter.backgroundColor = UIColor.yellow
            lblMeter.alpha = 0.5
            
        }
        if txtPassword.text!.count > 7 {
            
            passStrong.isHidden = false
        } else if txtPassword.text!.count < 7 {
            
            passStrong.isHidden = true
        }
        if txtPassword.text!.isEmpty {
            
            passWeak.isHidden = true
        }
        
        
        print(length)
        
        return true
        
    }
    
    
    
    
    
    @IBAction func btnNext(_ sender: UIButton) {
        
     
        
        var a = false
        var b = false
        
        if txtPassword.text == txtReEnterPass.text {
            a = true
            
        } else {
            
            let alerController = UIAlertController(title: "Password do not match", message: " Please re-enter your password", preferredStyle: .alert)
            let defaultAction = UIAlertAction (title:  "OK", style: .cancel, handler: nil)
            alerController.addAction(defaultAction)
            present (alerController, animated: true, completion:  nil)

        }
        
        if txtPassword.text == "" || txtReEnterPass.text == ""{
            let alerController = UIAlertController(title: "", message: "Please input all required fields", preferredStyle: .alert)
            let defaultAction = UIAlertAction (title:  "OK", style: .cancel, handler: nil)
            alerController.addAction(defaultAction)
            present (alerController, animated: true, completion:  nil)
        }else{
            
            b = true
            
        }
        if a == true && b == true {
    
            if isValidPass(passstring: txtPassword.text!)
            {
                print("yes")
            } else {
                let passAlert = UIAlertController(title: "Password weak.", message: "Password must include: \n✓ 8-20 Characters \n✓ At least one character \n✓ At least one number", preferredStyle: .alert)
                let defaultAction = UIAlertAction (title:  "OK", style: .cancel, handler: nil)
                passAlert.addAction(defaultAction)
                present (passAlert, animated: true, completion:  nil)
                
                
            }
            
            if isValidPass(passstring: txtReEnterPass.text!)
            {
                print("yes")
            } else {
                let passAlert = UIAlertController(title: "Password weak.", message: "Password must include: \n✓ 8-20 Characters \n✓ At least one character \n✓ At least one number", preferredStyle: .alert)
                let defaultAction = UIAlertAction (title:  "OK", style: .cancel, handler: nil)
                passAlert.addAction(defaultAction)
                present (passAlert, animated: true, completion:  nil)
                
                
            }

    }
        
    }
    @IBOutlet weak var lblUserType: UILabel!
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        if segue.destination is RegisterCompany4
        {
            let vs = segue.destination as? RegisterCompany4
            vs?.name = (labelText?.text!)!
            vs?.ComOwner = (labelComOwner?.text!)!
            vs?.ComName = (labelComName?.text!)!
            vs?.pass = txtPassword.text!
            vs?.usertype = lblUserType.text!
        }
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()

        
        txtPassword.botLine()
        txtReEnterPass.botLine()
        
        btnNext.layer.cornerRadius = 29.5
        btnNext.layer.borderWidth = 1
          iconClick = false
        labelText?.text = email
        labelComName?.text = ComName
        labelComOwner?.text = ComOwner
        lblUserType.text = usertype
         self.hideKeyboardWhenTappedAround()
          btnPassNonView.isHidden = true;
        btnReTypeNon.isHidden = true;
     txtPassword.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        
        
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
