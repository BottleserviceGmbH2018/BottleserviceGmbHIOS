//
//  RegisterPersonal1.swift
//  BottleServiceApp
//
//  Created by David Olarte on 09.03.18.
//  Copyright © 2018 Iselacher Digital Media Factory. All rights reserved.
//

import UIKit
//import SwiftyJSON
//import Alamofire

class RegisterPersonal1: UIViewController, UITextFieldDelegate {
    
    var fname: String = ""
    var mname: String = ""
    var lname: String = ""
    var usertype: String = ""
    

    @IBOutlet weak var lblUsertype: UILabel!
    @IBOutlet weak var btnNext: UIButton!
    @IBOutlet weak var txtLastName: UITextField!
    @IBOutlet weak var txtMiddleName: UITextField!
    @IBOutlet weak var txtFirstName: UITextField!
    @IBOutlet weak var labelMessage: UILabel!
    @IBOutlet weak var txtSampleEmail: UITextField!
    
    
    
    @IBAction func btnNext(_ sender: UIButton) {
       if txtLastName.text == "" || txtFirstName.text == "" {
            let alerController = UIAlertController(title: "", message: "Please input all required fields", preferredStyle: .alert)
            let defaultAction = UIAlertAction (title:  "OK", style: .cancel, handler: nil)
            alerController.addAction(defaultAction)
            present (alerController, animated: true, completion:  nil)
        }
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        if segue.destination is RegisterPersonal2
        {
            let vs = segue.destination as? RegisterPersonal2
            vs?.fname = txtFirstName.text!
            vs?.lname = txtLastName.text!
            vs?.mname = txtMiddleName.text!
            vs?.email = txtSampleEmail.text!
            vs?.usertype = lblUsertype.text!
        } else if segue.destination is SelectAccount {
            
            let vs = segue.destination as? SelectAccount
            vs?.usertype = lblUsertype.text!
        }
        
    }
    
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let allowedCharacters = CharacterSet.letters
        let characterSet = CharacterSet(charactersIn: string)
        return allowedCharacters.isSuperset(of: characterSet)
        
        
        
    }
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.txtLastName.delegate = self
        self.txtFirstName.delegate = self
        self.txtMiddleName.delegate = self
        
        txtLastName.botLine()
        txtFirstName.botLine()
        txtMiddleName.botLine()
        txtFirstName.text = fname
        txtMiddleName.text = mname
        txtLastName.text = lname
        btnNext.layer.cornerRadius = 29.5
        btnNext.layer.borderWidth  = 1
        lblUsertype.text = usertype
        
        self.hideKeyboardWhenTappedAround()
    }
    
 
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
