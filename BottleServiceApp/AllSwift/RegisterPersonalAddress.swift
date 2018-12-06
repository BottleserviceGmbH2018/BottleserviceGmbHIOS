//
//  RegisterPersonalAddress.swift
//  BottleServiceApp
//
//  Created by David Olarte on 28/06/2018.
//  Copyright © 2018 Iselacher Digital Media Factory. All rights reserved.
//

import UIKit

class RegisterPersonalAddress: UIViewController {
    
    
    var email: String = ""
    var fname: String = ""
    var mname: String = ""
    var lname: String = ""
    var usertype: String = ""
    
    var add1: String = ""
    var add2: String = ""
    var city: String = ""
    var postal: String = ""
    
    

    @IBOutlet weak var btnNext: UIButton!
    @IBOutlet weak var lblUsertype: UILabel!
    @IBOutlet weak var lblfname: UILabel!
    @IBOutlet weak var labelEmail: UILabel!
    @IBOutlet weak var txtPostal: UITextField!
    @IBOutlet weak var txtCity: UITextField!
    @IBOutlet weak var txtAddress2: UITextField!
    @IBOutlet weak var lbllname: UILabel!
    @IBOutlet weak var lblmname: UILabel!
    @IBOutlet weak var txtAddress1: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    
        
        labelEmail?.text = email
        
        txtCity?.text = city
        txtPostal?.text = postal
        txtAddress1?.text = add1
        txtAddress2?.text = add2
        
        
        lblfname?.text = fname
        lbllname?.text = lname
        lblmname?.text = mname
        lblUsertype?.text = usertype
        self.hideKeyboardWhenTappedAround()
        
        btnNext.layer.cornerRadius = 29.5
        btnNext.layer.borderWidth = 1
        txtCity.botLine()
        txtPostal.botLine()
        txtAddress1.botLine()
        txtAddress2.botLine()
    }
    
    @IBAction func btnNext(_ sender: Any) {
        
        if txtPostal.text == "" || txtCity.text == "" || txtAddress1.text == "" {
            
            let alerController = UIAlertController(title: "", message: "Please input all required fields", preferredStyle: .alert)
            let defaultAction = UIAlertAction (title:  "OK", style: .cancel, handler: nil)
            alerController.addAction(defaultAction)
            present (alerController, animated: true, completion:  nil)
        }
        
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        if segue.destination is RegisterPersonal3
        {
            let vs = segue.destination as? RegisterPersonal3
            vs?.email = labelEmail.text!
            vs?.fname = lblfname.text!
            vs?.lname = lbllname.text!
            vs?.mname = lblmname.text!
            
            vs?.usertype = lblUsertype.text!
            vs?.add1 = txtAddress1.text!
            vs?.add2 = txtAddress2.text!
            vs?.city = txtCity.text!
            vs?.postal = txtPostal.text!
        } else if segue.destination is RegisterPersonal2 {
        
        let vs =  segue.destination as? RegisterPersonal2
        vs?.email = labelEmail.text!
        vs?.fname = lblfname.text!
        vs?.lname = lbllname.text!
        vs?.mname = lblmname.text!
        vs?.usertype = lblUsertype.text!
        
            
        }}
    
    
    


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
 

}
