//
//  RegisterCompany5.swift
//  BottleServiceApp
//
//  Created by David Olarte on 11.03.18.
//  Copyright © 2018 Iselacher Digital Media Factory. All rights reserved.
//

import UIKit
//import SwiftyJSON
//import Alamofire


class RegisterCompany5: UIViewController {
    
    var email: String = ""
    var ComName: String = ""
    var ComOwner: String = ""
    var pass: String = ""
    var add1: String = ""
    var add2: String = ""
    var city: String = ""
    var postal: String = ""
    var usertype: String = ""
    

   

    
    @IBOutlet weak var lblPostal: UILabel!
    @IBOutlet weak var lblCity: UILabel!
    @IBOutlet weak var lbladd2: UILabel!
    @IBOutlet weak var lbladd1: UILabel!
    @IBOutlet weak var lblPass: UILabel!
    @IBOutlet weak var lblComOwner: UILabel!
    @IBOutlet weak var lblComName: UILabel!
    @IBOutlet weak var labelMessage: UILabel!
    @IBOutlet weak var labelText: UILabel!
    @IBOutlet weak var txtOwnersPhone: UITextField!
    @IBOutlet weak var txtMobileNumber: UITextField!
    @IBOutlet weak var txtCompanyPhoneNum: UITextField!
    @IBOutlet weak var lblUserType: UILabel!
    
    @IBAction func btnNext(_ sender: UIButton) {
   //     let parameters: Parameters=[
    //        "Postal": lblPostal.text!,
    //        "City": lblCity.text!,
   //         "Address1": lbladd1.text!,
   //         "Address2": lbladd2.text!,
   //         "ComOwner": lblComOwner.text!,
  //          "ComName": lblComName.text!,
   //         "Email": labelText.text!,
  //          "OwnersPhone": txtOwnersPhone.text!,
   //         "MobileNumber": txtMobileNumber.text!,
  //          "CompanyPhone": txtCompanyPhoneNum.text!,
  //          "Password": lblPass.text!,
 //           "UserType": txtUserType.text!,
 //           ]
        if txtCompanyPhoneNum.text == "" || txtMobileNumber.text == "" {
            let alerController = UIAlertController(title: "", message: "Please input all required fields", preferredStyle: .alert)
            let defaultAction = UIAlertAction (title:  "OK", style: .cancel, handler: nil)
            alerController.addAction(defaultAction)
            present (alerController, animated: true, completion:  nil)
        }//else{
            
        //}
        
    }
    
    
    
    @IBOutlet weak var txtUserType: UITextField!
    @IBOutlet weak var btnNext: UIButton!
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        if segue.destination is RegisterCompany6
        {
            let vs = segue.destination as? RegisterCompany6
            vs?.email = (labelText?.text!)!
            vs?.name = (lblComName?.text!)!
            vs?.password = (lblPass?.text!)!
            vs?.usertype = lblUserType.text!
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        txtOwnersPhone.botLine()
        txtMobileNumber.botLine()
        txtCompanyPhoneNum.botLine()
        // Do any additional setup after loading the view.
        btnNext.layer.cornerRadius = 29.5
        btnNext.layer.borderWidth = 1
        labelText?.text = email
        lblComOwner?.text = ComOwner
        lblComName?.text = ComName
        lbladd1?.text = add1
        lbladd2?.text = add2
        lblCity?.text = city
        lblPostal?.text = postal
        lblPass?.text = pass
        lblUserType?.text = usertype
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
