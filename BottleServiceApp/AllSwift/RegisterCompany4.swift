//
//  RegisterCompany4.swift
//  BottleServiceApp
//
//  Created by David Olarte on 11.03.18.
//  Copyright © 2018 Iselacher Digital Media Factory. All rights reserved.
//

import UIKit
//import SwiftyJSON
//import Alamofire

class RegisterCompany4: UIViewController {
    
    var name : String =  ""
    var ComName: String = ""
    var ComOwner: String = ""
    var pass: String = ""
    var usertype: String = ""
    
    
    let URL_USER_BS = "http://bottleservice.ch/BottleserviceIOSConnection/RegisterCompany4.php"
    
    @IBOutlet weak var lblPassword: UILabel!
    @IBOutlet weak var lblComName: UILabel!
    @IBOutlet weak var lblComOwner: UILabel!
    @IBOutlet weak var labelMessage: UILabel!
    @IBOutlet weak var labelText: UILabel!
    @IBOutlet weak var btnNext: UIButton!
    @IBOutlet weak var txtPoastal: UITextField!
    @IBOutlet weak var txtCity: UITextField!
    @IBOutlet weak var txtAddress2: UITextField!
    @IBOutlet weak var txtAddress1: UITextField!
    @IBAction func btnNext(_ sender: UIButton) {
        
       
        if txtAddress1.text == "" || txtCity.text == "" || txtPoastal.text == "" {
            let alerController = UIAlertController(title: "", message: "Please input all required fields", preferredStyle: .alert)
            let defaultAction = UIAlertAction (title:  "OK", style: .cancel, handler: nil)
            alerController.addAction(defaultAction)
            present (alerController, animated: true, completion:  nil)
        }
    }
    @IBOutlet weak var lblUserType: UILabel!
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        if segue.destination is RegisterCompany5
        {
            let vs = segue.destination as? RegisterCompany5
            vs?.email = (labelText?.text!)!
            vs?.ComOwner = (lblComOwner?.text!)!
            vs?.ComName = (lblComName?.text!)!
            vs?.pass = (lblPassword?.text!)!
            vs?.add1 = (txtAddress1?.text!)!
            vs?.add2 = (txtAddress2?.text!)!
            vs?.city = (txtCity?.text!)!
            vs?.postal = (txtPoastal?.text!)!
            vs?.usertype = lblUserType.text!

        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    txtCity.botLine()
        txtPoastal.botLine()
        txtAddress1.botLine()
        txtAddress2.botLine()
        
        
        btnNext.layer.borderWidth = 1
        btnNext.layer.cornerRadius = 29.5
        
        labelText?.text = name
        lblComName?.text = ComName
        lblComOwner?.text = ComOwner
        lblPassword?.text = pass
        lblUserType.text = usertype
         self.hideKeyboardWhenTappedAround()
        
        // Do any additional setup after loading the view.
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
