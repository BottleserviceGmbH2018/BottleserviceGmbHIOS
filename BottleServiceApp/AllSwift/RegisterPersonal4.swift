//
//  RegisterPersonal4.swift
//  BottleServiceApp
//
//  Created by David Olarte on 11.03.18.
//  Copyright © 2018 Iselacher Digital Media Factory. All rights reserved.
//

import UIKit

import Firebase
import FirebaseAuth
import FirebaseInstanceID

class RegisterPersonal4: UIViewController {
    
    var messagesController: MessageController?
    
    
 
    
    var email: String = ""
    var pass: String = ""
    var fname: String = ""
    var lname: String = ""
    var mname: String = ""
    var usertype: String = ""
    var add1: String = ""
    var add2: String = ""
    var city: String = ""
    var postal: String = ""
    
    
    @IBAction func textFieldEditing(_ sender: UITextField) {
        let dateBday: UIDatePicker = UIDatePicker()
        dateBday.datePickerMode = UIDatePickerMode.date
        sender.inputView = dtBday
        dtBday.addTarget(self, action: #selector(RegisterPersonal4.datePickerValueChanged), for: UIControlEvents.valueChanged)
    }
    @objc func datePickerValueChanged(sender:UIDatePicker){
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = DateFormatter.Style.medium
        dateFormatter.timeStyle = DateFormatter.Style.none
        dataTextField.text = dateFormatter.string(from: sender.date)
    }
    @IBOutlet weak var dataTextField: UITextField!
    @IBOutlet weak var labelEmail: UILabel!
    @IBOutlet weak var dtBday: UIDatePicker!
    @IBOutlet weak var btnNext: UIButton!
    @IBOutlet weak var labelMessage: UILabel!
    @IBOutlet weak var txtfname: UITextField!
    @IBOutlet weak var txtmname: UITextField!
    @IBOutlet weak var txtlname: UITextField!
    @IBOutlet weak var txtpass: UITextField!
    @IBOutlet weak var txtUser: UITextField!
    @IBOutlet weak var txtEmail: UITextField!
    @IBOutlet weak var lblAdd1: UILabel!
    @IBOutlet weak var lblAdd2: UILabel!
    @IBOutlet weak var lblCity: UILabel!
    @IBOutlet weak var lblPostal: UILabel!
    
    
    @IBAction func btnNext(_ sender: UIButton) {
  
     
        let dateofbirth = dtBday.date
        let today = NSDate()
        let gregorian = NSCalendar(calendarIdentifier: NSCalendar.Identifier.gregorian)!
        let age = gregorian.components([.year], from: dateofbirth, to: today as Date, options: [])
        if age.year! < 18 {
            let alerController = UIAlertController(title: "", message: "Your are below under 18, You cannot use the application", preferredStyle: .alert)
            let defaultAction = UIAlertAction (title:  "OK", style: .cancel, handler: nil)
            alerController.addAction(defaultAction)
            present (alerController, animated: true, completion:  nil)
        }else{
            
            guard let email = txtEmail.text , let password = txtpass.text, let name = txtfname.text, let type = txtUser.text, let token = InstanceID.instanceID().token() , let add1 = lblAdd1.text, let add2 = lblAdd2.text, let city = lblCity.text, let postal = lblPostal.text else {
                print("Form is not valid")
                return
            }
            
           self.displayActIndicator()
            Auth.auth().createUser(withEmail: email, password: password, completion: {(user, error) in
           
                print("Send Email")
                Auth.auth().currentUser?.sendEmailVerification { (error) in
                    
                    if error != nil
                    {
                        print(error!)
                    } else {
                        
                        let alertVerify = UIAlertController(title: "Verification Sent", message: "You should recieve an email with a verification link at \(self.txtEmail.text!) \nVerify your account to use the Bottleservice.", preferredStyle: .alert)
                        alertVerify.addAction(UIAlertAction(title: "Ok", style: .default, handler: { (action) in
                            
                            let vc = self.storyboard?.instantiateViewController(withIdentifier: "Login")
                            self.present(vc!, animated: true, completion: nil)
                        } ))
                        self.present (alertVerify, animated: true, completion:  nil)
                        self.hideActIndicator()
                    }
                    
                }
                
     if error != nil {
            print(error!)
          return
    }
            
                guard let uid = user?.uid else {
                    return
                }
                
                let values = ["name": name, "email": email, "type": type, "uid": uid, "device_token": token, "userAdd1" : add1, "userAdd2" : add2, "userCity": city, "userPostal" : postal]
                self.registerUserIntoDatabaseWithUID(uid, values: values as [String : AnyObject])
           
            })
          
            
        }
    }
    
    
 
    
    
    fileprivate func registerUserIntoDatabaseWithUID(_ uid: String, values: [String: AnyObject]) {
        let ref = Database.database().reference()
        let usersReference = ref.child("users").child(uid)
        usersReference.updateChildValues(values, withCompletionBlock: { (err, ref) in
            if err != nil {
                print(err!)
                return
            }
        //            self.messagesController?.fetchUserAndSetupNavBarTitle()
            //            self.messagesController?.navigationItem.title = values["name"] as? String
            _ = User(dictionary: values)

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
    
    override func viewDidLoad() {
        super.viewDidLoad()
           self.dtBday.setValue(UIColor.white, forKey: "textColor")
        btnNext.layer.cornerRadius = 29.5
        btnNext.layer.borderWidth = 1
        labelEmail?.text = email
        txtpass?.text = pass
        txtEmail?.text = email
        txtfname?.text = fname
        txtlname?.text = lname
        txtmname?.text = mname
        txtUser?.text = usertype
        lblPostal?.text = postal
        lblCity?.text = city
        lblAdd1?.text = add1
        lblAdd2?.text = add2
        
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

        // Do any additional setup after loading the view.
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
