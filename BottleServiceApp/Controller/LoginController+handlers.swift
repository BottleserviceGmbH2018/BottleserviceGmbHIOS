//
//  LoginController+handlers.swift
//  BottleServiceApp
//
//  Created by David Olarte on 28.03.18.
//  Copyright © 2018 Iselacher Digital Media Factory. All rights reserved.
//

import UIKit
import FirebaseAuth
import FirebaseDatabase
import FirebaseStorage
import FirebaseInstanceID

extension RegisterCompany6 : UIImagePickerControllerDelegate, UINavigationControllerDelegate  {
    
    func handleRegister(){
        guard let email = lblEmail.text , let password = lblpassword.text, let name = lblName.text, let type = lblUsertype.text, let token = InstanceID.instanceID().token() else {
            
            print("Form is not valid")
            return
        }
        
        self.displayActIndicator()
        print("show")
        Auth.auth().createUser( withEmail: email, password: password, completion: { (user , error) in
            print("Created Account")
            Auth.auth().currentUser?.sendEmailVerification { (error) in
                if error != nil
                {
                    print(error!)
                } else {
                    let alertVerify = UIAlertController(title: "Verification Sent", message: "You should recieve an email with a verification link at \(self.lblEmail.text!) \nVerify your account to use the Bottleservice.", preferredStyle: .alert)
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
           let imageName = UUID().uuidString
            let storageRef = Storage.storage().reference().child("profile_images").child("\(imageName).jpg")
            if let profileImage = self.Logo.image, let uploadData = UIImageJPEGRepresentation(profileImage, 0.1) {
                //            if let uploadData = UIImagePNGRepresentation(self.profileImageView.image!) {
               storageRef.putData(uploadData, metadata: nil, completion: { (metadata, error) in
                    if error != nil {
                        print(error!)
                        return
                    }
                    if let profileImageUrl = metadata?.downloadURL()?.absoluteString {
                   let values = ["name": name, "email": email, "profileImageUrl": profileImageUrl, "type": type, "uid": uid, "device_token": token]
                        self.registerUserIntoDatabaseWithUID(uid, values: values as [String : AnyObject])
                    }
                })
            }
          
        })
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
         

        //    self.dismiss(animated: true, completion: nil)
        })
    }
    
    func handleSelectProfileImageView() {
        let picker = UIImagePickerController()
        
        picker.delegate = self
        picker.allowsEditing = true
        present(picker, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        
        var selectedImageFromPicker: UIImage?
        
        if let editedImage = info["UIImagePickerControllerEditedImage"] as? UIImage {
            selectedImageFromPicker = editedImage
        } else if let originalImage = info["UIImagePickerControllerOriginalImage"] as? UIImage {
            
            selectedImageFromPicker = originalImage
        }
        
        if let selectedImage = selectedImageFromPicker {
            Logo.image = selectedImage
        }
        dismiss(animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        print("canceled picker")
        dismiss(animated: true, completion: nil)
    }
    
    
}



