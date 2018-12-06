//
//  RegisterPersonal3.swift
//  BottleServiceApp
//
//  Created by David Olarte on 11.03.18.
//  Copyright © 2018 Iselacher Digital Media Factory. All rights reserved.
//

import UIKit
//import SwiftyJSON
//import Alamofire


class RegisterPersonal3: UIViewController , UITextFieldDelegate{
    
    
    
    
    var iconClick : Bool!
    
    
    var email: String = ""
    var fname: String = ""
    var mname: String = ""
    var lname: String = ""
    var usertype: String = ""
    var add1: String = ""
    var add2: String = ""
    var city: String = ""
    var postal: String = ""
    
    @IBAction func btnPassView(_ sender: Any) {
        
        btnPassNon.isHidden = false;
        btnPassView.isHidden = true;
        if(iconClick == true) {
            txtPassword.isSecureTextEntry = false
            iconClick = false
        } else {
            txtPassword.isSecureTextEntry = false
            iconClick = false
        }
        
    }
    
    @IBAction func btnPassNon(_ sender: Any) {
        btnPassNon.isHidden = true;
        btnPassView.isHidden = false;
        if(iconClick == true) {
            txtPassword.isSecureTextEntry = true
            iconClick = true
        } else {
            txtPassword.isSecureTextEntry = true
            iconClick = true
        }

        
        
    }
    
    
    @IBOutlet weak var btnReEnterView: UIButton!
    
    @IBAction func btnReEnterView(_ sender: Any) {
        
    btnReEnterNon.isHidden = false;
        btnReEnterView.isHidden = true;
        
        if(iconClick == true) {
            txtRetypePass.isSecureTextEntry = false
            iconClick = false
        } else {
            txtRetypePass.isSecureTextEntry = false
            iconClick = false
        }
        
        
    }
    
    @IBAction func btnReEnterNon(_ sender: Any) {
        btnReEnterNon.isHidden = true;
        btnReEnterView.isHidden = false;
        
        if(iconClick == true) {
            txtRetypePass.isSecureTextEntry = true
            iconClick = true
        } else {
            txtRetypePass.isSecureTextEntry = true
            iconClick = true
        }
        
    }
    
    @IBOutlet weak var btnPassNon: UIButton!
    @IBOutlet weak var btnPassView: UIButton!
    
    
    
    
    
    
    @IBOutlet weak var lblUsertype: UILabel!
    @IBOutlet weak var labelMessage: UILabel!
    @IBOutlet weak var labelEmail: UILabel!
    @IBOutlet weak var btnNext: UIButton!
    @IBOutlet weak var txtPassword: UITextField!
    @IBOutlet weak var txtRetypePass: UITextField!
    @IBOutlet weak var lblfname: UILabel!
    @IBOutlet weak var lbllname: UILabel!
    @IBOutlet weak var lblmname: UILabel!
    
    
    @IBOutlet weak var lblMeter: UILabel!
    
    @IBOutlet weak var passWeak: UIImageView!
    
    @IBOutlet weak var passMed: UIImageView!
    @IBOutlet weak var passStrong: UIImageView!
    
    
    func isValidPass(passstring:String) -> Bool {
           let passwordRegex = "^[A-Za-z0-9 !\"#$%&'()*+,-./:;<=>?@\\[\\\\\\]^_`{|}~].{8,}$"
        
        let passtest = NSPredicate(format: "SELF MATCHES %@", passwordRegex)
        return passtest.evaluate(with: passstring)
        
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        let length = txtPassword.text!.count
        
        
        if txtPassword.text!.count < 4 {
            
            passWeak.isHidden = false
            
            passMed.isHidden = true
            lblMeter.backgroundColor = UIColor.red
            lblMeter.alpha = 0.5
            
            
            
        }
        
        if txtPassword.text!.count > 4{
            passMed.isHidden = false
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
        
        if txtPassword.text == txtRetypePass.text {
            a = true
            
        } else {
            
            let alerController = UIAlertController(title: "Password do not match", message: " Please re-enter your password", preferredStyle: .alert)
            let defaultAction = UIAlertAction (title:  "OK", style: .cancel, handler: nil)
            alerController.addAction(defaultAction)
            present (alerController, animated: true, completion:  nil)
            
        }
        
        if txtPassword.text == "" || txtRetypePass.text == ""{
            let alerController = UIAlertController(title: "", message: "Please input all required fields", preferredStyle: .alert)
            let defaultAction = UIAlertAction (title:  "OK", style: .cancel, handler: nil)
            alerController.addAction(defaultAction)
            present (alerController, animated: true, completion:  nil)
        }else{
            
            b = true
            
        }
        if a == true && b == true {
        
        }
        
        
        if isValidPass(passstring: txtPassword.text!)
        {
        
        } else {
            let passAlert = UIAlertController(title: "Weak Password.", message: "Password must include: \r\n-         8-20 Characters        \r\n- At least one character \r\n-     At least one number", preferredStyle: .alert)
            let defaultAction = UIAlertAction (title:  "OK", style: .cancel, handler: nil)
            passAlert.addAction(defaultAction)
            present (passAlert, animated: true, completion:  nil)
            
            
        }
        
        if isValidPass(passstring: txtRetypePass.text!)
        {
   
        } else {
            let passAlert =  UIAlertController(title: "Weak Password.", message: "Password must include: \r\n-         8-20 Characters        \r\n- At least one character \r\n-     At least one number", preferredStyle: .alert)
            let defaultAction = UIAlertAction (title:  "OK", style: .cancel, handler: nil)
            passAlert.addAction(defaultAction)
            present (passAlert, animated: true, completion:  nil)
            
            
        }
        
        
        
        
    }
    

    
    @IBOutlet weak var lblAdd2: UILabel!
    @IBOutlet weak var lblPostal: UILabel!
    @IBOutlet weak var lblCity: UILabel!
   
    @IBOutlet weak var lblAdd1: UILabel!
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        if segue.destination is RegisterPersonal4
        {
            let vs = segue.destination as? RegisterPersonal4
            vs?.email = (labelEmail?.text!)!
            vs?.pass = (txtPassword?.text!)!
            vs?.fname = (lblfname?.text!)!
            vs?.lname = (lbllname?.text!)!
            vs?.mname = (lblmname?.text!)!
            vs?.usertype = lblUsertype.text!
            vs?.add2 = lblAdd2.text!
            vs?.add1 = lblAdd1.text!
            vs?.city = lblCity.text!
            vs?.postal = lblPostal.text!
        
        } else if segue.destination is RegisterPersonalAddress
        {
            let vs = segue.destination as? RegisterPersonalAddress
        vs?.add1 = lblAdd1.text!
            vs?.add2 = lblAdd2.text!
            vs?.city = lblCity.text!
            vs?.postal = lblPostal.text!
            vs?.email = labelEmail.text!
            vs?.fname = lblfname.text!
            vs?.lname = lbllname.text!
            vs?.mname = lblmname.text!
            vs?.usertype = lblUsertype.text!
            
        }
    }
    
    
    @IBOutlet weak var btnReEnterNon: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
      txtPassword.botLine()
        txtRetypePass.botLine()
              btnNext.layer.cornerRadius = 29.5
        btnNext.layer.borderWidth = 1
        
        lblAdd1?.text = add1
        lblAdd2?.text = add2
        lblCity?.text = city
        lblPostal?.text = postal
        btnPassNon.isHidden = true;
        btnReEnterNon.isHidden = true;
         iconClick = false
        labelEmail?.text = email
        lblfname?.text = fname
        lbllname?.text = lname
        lblmname?.text = mname
        lblUsertype?.text = usertype
         self.hideKeyboardWhenTappedAround()
        
        txtPassword.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
       
    }
    

   

}
