//
//  Login.swift
//  BottleServiceApp
//
//  Created by David Olarte on 08.03.18.
//  Copyright © 2018 Iselacher Digital Media Factory. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth
import FirebaseDatabase
import FirebaseStorage
import Foundation
import SystemConfiguration
import FBSDKLoginKit
import FBSDKCoreKit
import GoogleSignIn

       private var __maxLengths = [UITextField: Int]()
extension UITextField {
    
    func botLine(){
        let border = CALayer()
        let width = CGFloat(2.0)
        border.borderColor = UIColor.white.cgColor
        border.frame = CGRect(x:0,
                              y: self.frame.size.height - width,
                              width:self.frame.size.width,
                              height: self.frame.size.height)
        border.borderWidth = width
        self.layer.addSublayer(border)
        self.layer.masksToBounds = true
      
    }
}




extension UIApplication {
    var statusBarView: UIView? {
        return value(forKey: "statusBar") as? UIView
    }
    
    
}

extension UINavigationBar {
    
    override open func sizeThatFits(_ size: CGSize) -> CGSize {
     return CGSize(width: 100, height: 100)
    }
    
    
}


extension UIViewController{
    func hideKeyboardWhenTappedAround(){
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
        
    }
    
    @objc func dismissKeyboard(){
        view.endEditing(true)
    }
    
}

extension UITextField {
 
    
    @IBInspectable var maxLength: Int {
        get {
            guard let l = __maxLengths[self] else {
                return 150 // (global default-limit. or just, Int.max)
            }
            return l
        }
        set {
            __maxLengths[self] = newValue
                addTarget(self, action: #selector(fix), for: .editingChanged)
        }
    }
    @objc func fix(textField: UITextField) {
        let t = textField.text
        textField.text = t?.safelyLimitedTo(length: maxLength)
    }
}

extension String
{
    func safelyLimitedTo(length n: Int)->String {
        if (self.count <= n) {
            return self
        }
        return String( Array(self).prefix(upTo: n) )
    }
}






extension UIViewController{
    
    
    
    

    
    public class Reachability {
        class func isConnectedToNetwork() -> Bool {
            var zeroAddress = sockaddr_in(sin_len: 0, sin_family: 0, sin_port: 0, sin_addr: in_addr(s_addr: 0), sin_zero: (0, 0, 0, 0, 0, 0, 0, 0))
            zeroAddress.sin_len = UInt8(MemoryLayout.size(ofValue: zeroAddress))
            zeroAddress.sin_family = sa_family_t(AF_INET)
            
            let defaultRouteReachability = withUnsafePointer(to: &zeroAddress) {
                $0.withMemoryRebound(to: sockaddr.self, capacity: 1) {zeroSockAddress in
                    SCNetworkReachabilityCreateWithAddress(nil, zeroSockAddress)
                }
            }
            var flags: SCNetworkReachabilityFlags = SCNetworkReachabilityFlags(rawValue: 0)
            if SCNetworkReachabilityGetFlags(defaultRouteReachability!, &flags) == false {
                return false
            }
            let isReachable = flags == .reachable
            let needsConnection = flags == .connectionRequired
            return isReachable && !needsConnection
        }
    }
    
    func showalert(){
 if Reachability.isConnectedToNetwork() == true
 {
    print("Connected")
        }
 else{
    let controller = UIAlertController(title: "Connection Problem", message: "Uh-oh, We lost you. Please reconnect again", preferredStyle: .alert)
    let ok = UIAlertAction(title: "Ok", style: .default, handler: nil)
   // let cancel = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
    
    controller.addAction(ok)
   // controller.addAction(cancel)
    present(controller, animated: true, completion: nil)
    
        }
        
    }
}




class Login: UIViewController, UITextFieldDelegate, GIDSignInUIDelegate{
    
    var usersName : String = ""
     var usersEmail : String = ""
    var usersUId : String = ""
    var messagesController: MessageController?
    var messagesControllerApp : MessageControllerApp?
    
    let defaultValues = UserDefaults.standard
    
    let URL_USER_LOGIN = "http:bottleservice.ch/BottleserviceIOSConnection/Login.php"
   
    
    @IBOutlet weak var btnLang: UIButton!
    @IBAction func btnLang(_ sender: Any) {
        
             let alert = UIAlertController(
              title: "Change Language".localized,
             message: nil,
                 preferredStyle: .actionSheet
                
        )
        
     
            func addActionLanguage(language: Language) {
                alert.addAction(
                    UIAlertAction(
                       title: language.rawValue.localized,
                          style: UIAlertActionStyle.default,
                      handler: { _ in
                         Language.language = language
                        
                        
                 
                        
                })
          )
       }
            addActionLanguage(language: Language.english)
            addActionLanguage(language: Language.german)
       
        
         alert.addAction(
            UIAlertAction(
              title: "Cancel",
            style: UIAlertActionStyle.cancel,
         handler: nil
              )
         )
        self.present(alert, animated: true, completion: nil)
  
        
        
        
    }
    
    
    
    @IBOutlet weak var btnGoogleSignIn: UIButton!
    
    
    @IBAction func btnGoogleSignIn(_ sender: Any) {
        
        
        GIDSignIn.sharedInstance().signIn()
        
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "MainPage")
        self.hideActIndicator()
        self.present(vc!, animated: true, completion: nil)
    
    }
    
    



    

    
    
    
    
    
    
    @IBAction func btnChangeLanguage(_ sender: Any) {
       

  self.dismiss(animated: false, completion: nil)
            self.presentingViewController?.dismiss(animated: false, completion: nil)
      
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "Login") as! Login
        UIApplication.shared.keyWindow?.rootViewController = vc
        
        
        
        //     let alert = UIAlertController(
        //        title: "Change Language",
        //        message: nil,
        //         preferredStyle: .actionSheet
        //      func addActionLanguage(language: Language) {
        ///         alert.addAction(
        //              UIAlertAction(
        //                  title: language.rawValue.localized,
        ///                  style: UIAlertActionStyle.default,
        //                  handler: { _ in
        //                    Language.language = language
        ///          })
        //   )
        //}
        //       addActionLanguage(language: Language.english)
        //    addActionLanguage(language: Language.german)
        //
        
        //  alert.addAction(
        //    UIAlertAction(
        //      title: "alert_cancel".localized,
        //    style: UIAlertActionStyle.cancel,
        //  handler: nil
        //      )
        //    )
        //present(alert, animated: true, completion: nil)
        
    }
    
    
    @IBOutlet weak var btnViewPass: UIButton!
    
    @IBAction func btnViewPass(_ sender: Any) {
        btnViewPass.isHidden = true;
        btnNonView.isHidden = false;
        if(iconClick == true) {
            txtPassword.isSecureTextEntry = false
            iconClick = false
        } else {
            txtPassword.isSecureTextEntry = true
            iconClick = true
        }
        
        
    }
    
    
    
    @IBOutlet weak var btnNonView: UIButton!
    
    @IBAction func btnNonView(_ sender: Any) {
   
        btnNonView.isHidden = true;
        btnViewPass.isHidden = false;
        if(iconClick == true) {
            txtPassword.isSecureTextEntry = true
            iconClick = true
        } else {
            txtPassword.isSecureTextEntry = true
            iconClick = true
        }

    }
   
    
    
    
    
    @IBOutlet weak var btnLoginWithFB: UIButton!
    
    
    
    @IBAction func loginWithFB(_ sender: Any) {
        
        let fbLoginManager = FBSDKLoginManager()
       fbLoginManager.logIn(withReadPermissions: ["public_profile","email"], from: self ) { (result, error ) in
        
            
            if error != nil {
                print("wala na finish na ")
            }
            
            
            guard let accessToken = FBSDKAccessToken.current() else {
                print("di nakuha ung token")
                
                
                return
            }

            
            
            let credential = FacebookAuthProvider.credential(withAccessToken: accessToken.tokenString)
            
            self.displayActIndicator()
            Auth.auth().signIn(with: credential, completion: { (user, error) in
                
                if let error = error {
               print("Login Error: \(error.localizedDescription)")
                    let alertFB = UIAlertController(title: "Login Error", message: error.localizedDescription, preferredStyle: .alert)
                    let action = UIAlertAction(title: "Ok", style: .cancel , handler: nil)
                    
                    alertFB.addAction(action)
                    self.present(alertFB, animated: true, completion: nil)
                    return
                    
                    
                } else if (result?.isCancelled)! {
                    print("Kinancel")
                    
                self.hideActIndicator()
                } else
                    
                    
              if let vc = self.storyboard?.instantiateViewController(withIdentifier: "MainPage"){
                    self.hideActIndicator()
                    self.present(vc, animated: true, completion: nil)
                    
 
                self.fetchUserProfile()
                }
         })
            
            
            }
   }
    
    func fetchUserProfile()
        
    {
        
        let uid = Auth.auth().currentUser?.uid
                let userReference = Database.database().reference().child("users").child(uid!)
      
        let graphRequest : FBSDKGraphRequest = FBSDKGraphRequest(graphPath: "me", parameters: ["fields":"id, email, name, picture.width(480).height(480)"])
        
        graphRequest.start(completionHandler: { (connection, result, error) -> Void in
            
            if ((error) != nil)
            {
                print("Error took place: \(error)")
            }
            else
            {
               // print("Print entire fetched result: \(result)")
                
                
                let userName : NSString = ((result! as AnyObject).value(forKey: "name") as? NSString)!
                self.usersName = userName as String
                print("Username is: \(userName)")
                print("self.usersName is \(self.usersName)")
                

                let userEmail:NSString = ((result! as AnyObject).value(forKey: "email") as? NSString)!
                self.usersEmail = userEmail as String
                
                print("User email is: \(userEmail)")
                print("self.usersEmail is \(self.usersEmail)")
                
                
                let userUId:NSString = ((result! as AnyObject).value(forKey: "id") as? NSString)!
                self.usersUId = userEmail as String
                
                print("UserID is: \(userUId)")
                print("self.usersUId is \(self.usersUId)")
                
                
//if let profilePictureObj = ((result! as AnyObject).value(forKey: "picture") as? NSDictionary)
         //       {
        //            let data = profilePictureObj.value(forKey: "data") as! NSDictionary
         //           let pictureUrlString  = data.value(forKey: "url") as! String
         //           let pictureUrl = NSURL(string: pictureUrlString)
         //
                 
             //   }
                
                
                
                
                
                let values = ["name": userName, "email": userEmail, "facebookid" : userUId]
                
                
                
                userReference.updateChildValues(values, withCompletionBlock: { (error, ref ) in
                    if error != nil {
                        print(error!)
                        return
                    }
                    
                    print("asdsadsadghfsagfhgidkjlsabk;nl/")
                    
                    
                })
                
                
                }
            }
       ) }
 
    
    
    
    
    
    
    
    
    
    func displayLoginIndicator() -> UIAlertController {
        
    
        
        let pendings = UIAlertController(title: "Logging in...", message: "Please wait while we check your credentials.", preferredStyle: .alert)
        
        let indicator = UIActivityIndicatorView(frame: pendings.view.bounds)
        indicator.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        
        pendings.view.addSubview(indicator)
        indicator.isUserInteractionEnabled = true
        indicator.startAnimating()
        
            self.present(pendings, animated: true, completion: nil)
   
        
        
        let when = DispatchTime.now() + 3
        DispatchQueue.main.asyncAfter(deadline: when){
            // your code with delay
            self.dismiss(animated: true, completion: nil)
        }
        
        
        
        return pendings
        
    }
    
    
    var actIndicator : UIActivityIndicatorView!
    
    
    
    

    @IBOutlet weak var btnSignUp: UIButton!
    @IBOutlet weak var btnChangeLanguage: UIButton!
    @IBOutlet weak var indLogin: UIActivityIndicatorView!
    @IBOutlet weak var txtPassword: UITextField!
    @IBOutlet weak var txtEmail: UITextField!
    @IBAction func btnLogin(_ sender: AnyObject) {
        
   
        if txtEmail.text == "" || txtPassword.text == "" {
            let alerController = UIAlertController(title: "Missing fields.", message: "Please enter your email and password", preferredStyle: .alert)
            
            let defaultAction = UIAlertAction (title:  "OK", style: .cancel, handler: nil)
            alerController.addAction(defaultAction)
            
            present (alerController, animated: true, completion:  nil)
            
        } else {
            
            guard let email = txtEmail.text, let password = txtPassword.text else {
                print("Form is not valid")
                return
            }
            
            
      
            
            self.displayActIndicator()
            
            Auth.auth().signIn(withEmail: email, password: password, completion: {
                (user, error) in
            
                print("Loggin In")
                if let user = Auth.auth().currentUser {
                    if !user.isEmailVerified{
                        let alertVC = UIAlertController(title: "Error", message: "Sorry. Your email address has not yet verified. Do you want to send another verification email to \(self.txtEmail.text!)?", preferredStyle: .alert)
                        let alertActionOkay = UIAlertAction(title: "Send verification", style: .default) {
                            (_) in
                            
                            user.sendEmailVerification(completion: nil)
                        }
                        
                        let alertActionCancel = UIAlertAction(title: "Don't send", style: .default , handler: nil)
                        
                        alertVC.addAction(alertActionOkay)
                        alertVC.addAction(alertActionCancel)
                        self.present(alertVC, animated: true, completion: nil)
                        self.hideActIndicator()
                        
                    }
               }
                
                if error != nil {
                    
          
                    
                    
                    let alertController = UIAlertController(title: "Error", message: error?.localizedDescription, preferredStyle: .alert)
                    
                    let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                    alertController.addAction(defaultAction)
                    
                    self.present(alertController, animated: true, completion: nil)
                    
                    self.hideActIndicator()
                    
                    
                    
                } else {
                    
          
               // If there's no errors
             
               if error == nil {
                    // Get the type from the database. It's path is users/<userId>/type.
                    // Notice "observeSingleEvent", so we don't register for getting an update every time it changes.
                   Database.database().reference().child("users/\(user!.uid)/type").observeSingleEvent(of: .value, with: {
                        (snapshot) in
      
                    
                    self.hideActIndicator()
                     switch snapshot.value as! String {
                        
                        
                        // If our user is admin...
                       case "0":
                           // ...redirect to the admin page
                           let vc = self.storyboard?.instantiateViewController(withIdentifier: "DashboardApp")
                           self.present(vc!, animated: true, completion: nil)
                           
                           self.hideActIndicator()
                            self.messagesController?.fetchUserAndSetupNavBarTitle()
                            
                            
                            
                        case "1":
                            // ...redirect to the admin page
                            let vc = self.storyboard?.instantiateViewController(withIdentifier: "Lounge")
                            self.present(vc!, animated: true, completion: nil)
                       //      self.hideActIndicator()
                            self.messagesController?.fetchUserAndSetupNavBarTitle()

                        // If out user is a regular user...
                        case "2":
                            // ...redirect to the user page
                            let vc = self.storyboard?.instantiateViewController(withIdentifier: "MainPage")
                             self.hideActIndicator()
                            self.present(vc!, animated: true, completion: nil)
                        // If the type wasn't found...
                        default:
                            // ...print an error
                            print("Error: Couldn't find type for user \(user!.uid)")
                        }
                    })
                }         }
                
            })
        
    }
    
    }
    
    
    var loadingView: UIView = UIView()
    
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
    
    

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return(true)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        showalert()
        

    }
    
    override func viewDidAppear(_ animated: Bool) {
        showalert()
        
        
       
        //if (FBSDKAccessToken.current() != nil) {
            
            
            
     //       let vc = self.storyboard?.instantiateViewController(withIdentifier: "MainPage") as! UIViewController
      //      self.present(vc, animated: true, completion: nil)
            
     //   }

        
    }
    
    
    var iconClick : Bool!

    @IBOutlet weak var btnLogin: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
                definesPresentationContext = true
        UIApplication.shared.statusBarView?.backgroundColor = UIColor(red: 0.06, green: 0.08, blue: 0.15, alpha: 1)
 UIApplication.shared.statusBarStyle = .lightContent
        
        txtEmail.botLine()
        txtPassword.botLine()
        
        self.txtEmail.delegate = self
        self.txtPassword.delegate = self
        iconClick = true


        GIDSignIn.sharedInstance().uiDelegate = self


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
        
        
        btnLogin.layer.cornerRadius = 5.0
        btnLogin.layer.borderWidth = 1.0
        btnLogin.layer.borderColor = UIColor.gray.cgColor
    
        btnLoginWithFB.layer.cornerRadius = 5.0
        btnLoginWithFB.layer.borderWidth = 1.0
        btnLoginWithFB.layer.borderColor = UIColor.gray.cgColor
        
        btnGoogleSignIn.layer.cornerRadius = 5.0
        btnGoogleSignIn.layer.borderWidth = 1.0
        btnGoogleSignIn.layer.borderColor = UIColor.gray.cgColor
        
        btnSignUp.layer.cornerRadius = 5.0
        btnSignUp.layer.borderWidth = 1.0
        btnSignUp.layer.borderColor = UIColor.gray.cgColor
        
        
        
        btnNonView.isHidden = true
        
        
        
        
 // let loginButton = FBSDKLoginButton()
   // view.addSubview(loginButton)
        
    //    loginButton.frame = CGRect(x: 16, y:450, width: view.frame.width - 32, height: 50)
        

  //  loginGG()
  
    }
    
    
    func loginButton(_ loginButton: FBSDKLoginButton!, didCompleteWithResult result: FBSDKLoginManagerLoginResult!, error: NSError! ){
        
        if error != nil {
            
            print(error)
            return
        }
    }

    func loginGG() {
        
        let googleButton = GIDSignInButton()
        googleButton.frame = CGRect(x: 16, y: 500 , width: view.frame.width - 70, height: 55)
        view.addSubview(googleButton)
        
    }
  override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
       
    }
}
