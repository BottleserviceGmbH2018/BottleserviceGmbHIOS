//
//  RegisterPersonal2.swift
//  BottleServiceApp
//
//  Created by David Olarte on 11.03.18.
//  Copyright © 2018 Iselacher Digital Media Factory. All rights reserved.
//

import UIKit
import Firebase


class RegisterPersonal2: UIViewController {
   
   
    var fname: String = ""
    var mname: String = ""
    var lname: String = ""
    var email: String = ""
    var usertype: String = ""
    
func isValidEmail(emailinput:String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        
        
        let emailTest = NSPredicate(format: "SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with: emailinput)
   }
    
    @IBOutlet weak var lblUsertype: UILabel!
    @IBOutlet weak var labelMessage: UILabel!
    @IBOutlet weak var lblEmail: UILabel!
    @IBOutlet weak var labelLnam: UILabel!
    @IBOutlet weak var labelMnam: UILabel!
    @IBOutlet weak var labelFnam: UILabel!
    @IBOutlet weak var btnNext: UIButton!
    @IBOutlet weak var txtEmail: UITextField!
    
    

    @IBAction func btnNext(_ sender: UIButton) {
        
             self.displayActIndicator()
 
        
     if txtEmail.text == ""  {
            let alerController = UIAlertController(title: "", message: "Please input all required fields", preferredStyle: .alert)
            let defaultAction = UIAlertAction (title:  "OK", style: .cancel, handler: nil)
            alerController.addAction(defaultAction)
            present (alerController, animated: true, completion:  nil)
        }
        
        self.hideActIndicator()
     if isValidEmail(emailinput:  txtEmail.text!)
        {
            print("Yes")
   //   checkexist()
        }
        else
        {
            let emailAlert = UIAlertController(title: "", message: "The email you entered is not valid. Please try again.", preferredStyle: .alert)
            let defaultAction = UIAlertAction (title:  "OK", style: .cancel, handler: nil)
            emailAlert.addAction(defaultAction)
            present (emailAlert, animated: true, completion:  nil)
        }

   }


    
    
    func checkexist(){
        
      
        let databaseReff = Database.database().reference().child("users")
        databaseReff.queryOrdered(byChild: "email").queryEqual(toValue: self.txtEmail.text!).observe(.value, with: { snapshot in
            if snapshot.exists(){
                let emailAlert1 = UIAlertController(title: "Email is already used.", message: "Please try new email.", preferredStyle: .alert)
               let defaultAction = UIAlertAction (title:  "OK", style: .cancel, handler: nil)
            emailAlert1.addAction(defaultAction)
                
self.present(emailAlert1, animated: true, completion: nil)
                
            self.hideActIndicator()
            }else {
                
                
                
                
                let vc = self.storyboard?.instantiateViewController(withIdentifier: "RegisterPersonalAddress")
                self.present(vc!, animated: true, completion: nil)
                
            }
            
        })
    }
 
   
    func displayActIndicator () -> () {
        UIApplication.shared.beginIgnoringInteractionEvents()
        self.view.bringSubview(toFront: self.actIndicator)
        self.loadingView.isHidden = false
        self.actIndicator.isHidden = false
        self.actIndicator.startAnimating()
    }
    func hideActIndicator () -> () {
        if !self.actIndicator.isHidden {
            DispatchQueue.main.async {
                UIApplication.shared.endIgnoringInteractionEvents()
                self.actIndicator.stopAnimating()
                self.loadingView.isHidden = true
                self.actIndicator.isHidden =  true
            }
        }
    }
    var actIndicator : UIActivityIndicatorView!
    var loadingView: UIView = UIView()
     override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        if segue.destination is RegisterPersonalAddress
        {
            let vs = segue.destination as? RegisterPersonalAddress
            vs?.email = txtEmail.text!
            vs?.mname = labelMnam.text!
            vs?.lname = labelLnam.text!
            vs?.fname = labelFnam.text!
            vs?.usertype = lblUsertype.text!
        } else if segue.destination is RegisterPersonal1 {
         let vs = segue.destination as? RegisterPersonal1
            vs?.lname = labelLnam.text!
            vs?.mname = labelMnam.text!
            vs?.fname = labelFnam.text!
            vs?.usertype = lblUsertype.text!
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        txtEmail.botLine()
        btnNext.layer.cornerRadius = 29.5
        btnNext.layer.borderWidth = 1
        
        labelFnam?.text = fname
        labelLnam?.text = lname
        labelMnam?.text = mname
        lblEmail?.text = email
        lblUsertype?.text = usertype
        
        txtEmail?.text = email
  self.hideKeyboardWhenTappedAround()
        
        loadingView.frame = CGRect(origin: CGPoint(x:0,y:0), size: CGSize(width: 80, height: 80))
        loadingView.center = view.center
        loadingView.backgroundColor = UIColor(red: 0.06, green: 0.08, blue: 0.15, alpha: 0.90)
        loadingView.clipsToBounds = true
        loadingView.layer.cornerRadius = 10
        loadingView.isHidden = true
        
        actIndicator = UIActivityIndicatorView(activityIndicatorStyle: .whiteLarge)
        
        actIndicator.center = view.center
        actIndicator.isHidden = true
        self.view.addSubview(loadingView)
        self.view.addSubview(actIndicator)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
       
    }
    

 
}
