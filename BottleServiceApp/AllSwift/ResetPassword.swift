//
//  ResetPassword.swift
//  BottleServiceApp
//
//  Created by David Olarte on 24/07/2018.
//  Copyright © 2018 Iselacher Digital Media Factory. All rights reserved.
//

import UIKit
import Firebase

class ResetPassword: UIViewController {

    @IBOutlet weak var btnLogin: UIButton!
    
    
    
    
    
    
    @IBAction func btnLogin(_ sender: Any) {
       
        
        let email = txtEmail.text
        
        
        Auth.auth().sendPasswordReset(withEmail: email!, completion: {(error) in
            
            
            
            if error != nil
            {
                
                let alertController = UIAlertController(title: "Forgot Password?", message: "The email address \(self.txtEmail.text!) is not registered on Bottleservice. Please try again.", preferredStyle: .alert)
                
                let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                alertController.addAction(defaultAction)
                
                self.present(alertController, animated: true, completion: nil)
                
               
                
                
            } else {
           
                let alertVerify = UIAlertController(title: "Reset Password", message: "We sent you a link for resetting your password.", preferredStyle: .alert)
                alertVerify.addAction(UIAlertAction(title: "Ok", style: .default, handler: { (action) in
                    
                    
                    
                    let vc = self.storyboard?.instantiateViewController(withIdentifier: "AfterReset")
                    self.present(vc!, animated: true, completion: nil)
                    
                    
                } ))
                
                
                self.present (alertVerify, animated: true, completion:  nil)
                
                return
          
            }
            
        })
        
        
        
    }
    @IBOutlet weak var txtEmail: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        
    txtEmail.botLine()

        btnLogin.layer.cornerRadius = 1
        btnLogin.layer.borderWidth = 1
        btnLogin.layer.borderColor = UIColor.gray.cgColor
        
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
