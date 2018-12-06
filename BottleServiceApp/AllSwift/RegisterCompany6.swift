//
//  RegisterCompany6.swift
//  BottleServiceApp
//
//  Created by David Olarte on 11.03.18.
//  Copyright © 2018 Iselacher Digital Media Factory. All rights reserved.
//

import UIKit
import Firebase
import FirebaseStorage
import FirebaseAuth
import FirebaseDatabase

class RegisterCompany6: UIViewController{
    var email: String = ""
    var name: String = ""
    var password: String = ""
    var usertype: String = ""
    var userUID: String!
    @IBOutlet weak var lblpassword: UILabel!
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblEmail: UILabel!
    @IBOutlet weak var btnUpload: UIButton!
    @IBOutlet weak var lblUsertype: UILabel!
    var messagesController: MessageController?
    
    var imagePicker = UIImagePickerController()
    
    @IBAction func btnUpload(_ sender: Any) {
        
        if UIImagePickerController.isSourceTypeAvailable(.savedPhotosAlbum) {
            
            imagePicker.delegate = self
            imagePicker.sourceType = .savedPhotosAlbum;
            imagePicker.allowsEditing = false
            self.present(imagePicker, animated: true, completion: nil)
      }
    }
    
  func imagePickerController(picker: UIImagePickerController!, didFinishPickingImage image: UIImage!, editingInfo: NSDictionary!) {
        self.dismiss(animated: true, completion: {() -> Void in
         })
        Logo.image = image
    }
   
    @IBAction func btnSkip(_ sender: UIButton) {
            //handleRegister()
        

        handleRegister()
        
   }
    
    
  
    
     var loadingView: UIView = UIView()
    
    var actIndicator : UIActivityIndicatorView!
     @IBOutlet weak var Logo: UIImageView!
    

     override func viewDidLoad() {
        super.viewDidLoad()
        Logo.layer.borderWidth = 1
        Logo.layer.masksToBounds = false
        Logo.layer.borderColor = UIColor.gray.cgColor
        Logo.layer.cornerRadius = Logo.frame.height/2
        Logo.clipsToBounds = true
        btnUpload.layer.cornerRadius = 29.5
        btnUpload.layer.borderWidth = 1
        lblName?.text = name
        lblEmail?.text = email
        lblpassword?.text = password
        lblUsertype.text = usertype
        
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

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    
    }
}
