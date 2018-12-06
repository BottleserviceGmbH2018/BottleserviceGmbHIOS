//
//  RegisterCompany1.swift
//  BottleServiceApp
//
//  Created by David Olarte on 11.03.18.
//  Copyright © 2018 Iselacher Digital Media Factory. All rights reserved.
//

import UIKit
//import SwiftyJSON
//import Alamofire

class RegisterCompany1: UIViewController, UITextFieldDelegate {
    
    
    
    var name:String = ""
    var usertype:String = ""
    
    
    
 let URL_USER_REGISTER = "http://bottleservice.ch/BottleserviceIOSConnection/RegisterCompany1.php"
    
    

    @IBOutlet weak var lblUserType: UILabel!
    @IBOutlet weak var labelMessage: UILabel!
    @IBOutlet weak var txtCompanyOwnersName: UITextField!
    @IBOutlet weak var btnNext: UIButton!
    @IBOutlet weak var txtCompanyName: UITextField!
    @IBAction func btnNext(_ sender: UIButton) {
        
        
        if txtCompanyOwnersName.text == "" || txtCompanyName.text == "" {
            
            let alerController = UIAlertController(title: "", message: "Please input all required fields", preferredStyle: .alert)
            
            let defaultAction = UIAlertAction (title:  "OK", style: .cancel, handler: nil)
            alerController.addAction(defaultAction)
            
            present (alerController, animated: true, completion:  nil)
        }
        
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        if segue.destination is RegisterCompany2
        {
            let vs = segue.destination as? RegisterCompany2
            vs?.name = txtCompanyName.text!
            vs?.companyOwner = txtCompanyOwnersName.text!
        vs?.usertype = lblUserType.text!
        
        }else if segue.destination is SelectAccount
        {
            let vs = segue.destination as? SelectAccount
            vs?.usertype = lblUserType.text!
        }
            
            
    }
    
    
    let acceptable_characters = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz 1234567890"
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
   
        
        
        let cs = NSCharacterSet(charactersIn: acceptable_characters).inverted
        let filtered = string.components(separatedBy: cs).joined(separator: "")
        
        return (string == filtered)
        
        
    }
    
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.txtCompanyName.delegate = self
        self.txtCompanyOwnersName.delegate = self


        txtCompanyName.botLine()
        txtCompanyOwnersName.botLine()
        
        btnNext.layer.cornerRadius = 29.5
        btnNext.layer.borderWidth =  1
        lblUserType.text = usertype
         self.hideKeyboardWhenTappedAround()
        
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
