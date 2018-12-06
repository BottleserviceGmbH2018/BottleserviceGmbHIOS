//
//  Setvenue1.swift
//  BottleServiceApp
//
//  Created by David Olarte on 11.04.18.
//  Copyright © 2018 Iselacher Digital Media Factory. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth
import FirebaseStorage
import FirebaseDatabase

class Setvenue1: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate

{
    
    
    
    var locTitle : String = ""
    var locType :  String = ""
    
    @IBOutlet weak var btnnext: UIButton!
    @IBOutlet weak var lblTitle: UILabel!
    
    @IBOutlet weak var lblLocType: UILabel!

    
        var ref: DatabaseReference?
   
      var refAppB: DatabaseReference?
    
    
    
    override func  prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        if segue.destination is Setvenue2
        {
            let vs = segue.destination as? Setvenue2
            vs?.locTitle = lblTitle.text!
            vs?.locType = lblLocType.text!
            
        }
    }
    
 
  
    @IBAction func loadImage(_ sender: UIButton) {
        imagePicker.allowsEditing = false
        imagePicker.sourceType = .photoLibrary
        present(imagePicker, animated: true, completion: nil)
        
        btnnext.isHidden = false
    }
    
    @IBAction func loadImage2(_ sender: UIButton) {
        imagePicker1.allowsEditing = false
        imagePicker1.sourceType = .photoLibrary
        present(imagePicker1, animated: true, completion: nil)
    }
    

    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
       
        if let pickedImage = info[UIImagePickerControllerOriginalImage] as? UIImage{
            imageView1.contentMode = .scaleToFill
            imageView1.image = pickedImage
            
        }

        if let pickedImage1 = info[UIImagePickerControllerOriginalImage] as? UIImage{
            imageview2.contentMode = .scaleToFill
            imageview2.image = pickedImage1
        }
        dismiss(animated: true, completion: nil)
          btnnext.isHidden = false
    }

    
    @IBAction func btnnext(_ sender: Any) {
     
        if lblLocType.text == "Bar" {
          uploadDataBar()
            
            
        } else if lblLocType.text == "Lounge" {
          uploadDataLounge()
        }
    }

    func uploadDataLounge() {
        
        let user = Auth.auth().currentUser
        let title = lblTitle.text
          uploadMedia() { url in
            if url != nil {
                let ref = Database.database().reference().child("Location_Information").child("Lounge").child((user?.uid)!).child(title!)
               ref.updateChildValues ([
                    "locationSlider" : url!
                ])
                let refAppL = Database.database().reference().child("OwnerToApp").child("Lounge").child(title!)
                refAppL.updateChildValues ([
                    "locationSlider" : url!
                    ])}}
        
        
       uploadMedia1() { url in
           if url != nil {
            let ref = Database.database().reference().child("Location_Information").child("Lounge").child((user?.uid)!).child(title!)
            
          ref.updateChildValues([
                  "locationMap" : url!
             ])}}}
    
    
   func uploadDataBar() {
    
    let user = Auth.auth().currentUser
    let title = lblTitle.text
    uploadMedia() { url in
        if url != nil {
            
            print("App to firebase")
        
            let ref = Database.database().reference().child("Location_Information").child("Bar").child((user?.uid)!).child(title!)
            ref.updateChildValues ([
                "locationSlider" : url!
                ])
            
            let refAppB = Database.database().reference().child("OwnerToApp").child("Bar").child(title!)
            let childUpdates = ["locationSlider": url! ]
            refAppB.updateChildValues(childUpdates)
            
            
        }
    }
 
   
    
    uploadMedia1() { url in
        if url != nil {
            let ref = Database.database().reference().child("Location_Information").child("Bar").child((user?.uid)!).child(title!)
            ref.updateChildValues([
                "locationMap" : url!
                ])}}}
    
    

    
    
    
    
   func uploadMedia(completion: @escaping (_ url: String?) -> Void ) {
     let imageName = UUID().uuidString
        let storageRef = Storage.storage().reference().child("locationImages").child("\(imageName).jpg")

    if let uploadData = UIImageJPEGRepresentation(self.imageView1.image!, 0.1){
            storageRef.putData(uploadData, metadata: nil) { (metadata, error) in
      
                if error != nil{
                    print ("error")
                    completion(nil)
                } else {
                completion((metadata?.downloadURL()?.absoluteString))
            
            }
        }
    }
    }
    
    
    
    
   func uploadMedia1(completion: @escaping (_ url: String?) -> Void ) {
     let imageName = UUID().uuidString
        let storageRef = Storage.storage().reference().child("locationImages").child("\(imageName).jpg")
        if let uploadData = UIImageJPEGRepresentation(self.imageview2.image!, 0.1){
            storageRef.putData(uploadData, metadata: nil) { (metadata, error) in
                if error != nil{
                    print ("error")
                    completion(nil)
                } else {
            completion((metadata?.downloadURL()?.absoluteString))

        }
   }
    }
    }
    
    
    
    
   @IBOutlet weak var imageView1: UIImageView!
    @IBOutlet weak var imageview2: UIImageView!

    let imagePicker = UIImagePickerController()
    let imagePicker1 = UIImagePickerController()
  
    override func viewDidLoad() {
        super.viewDidLoad()
        
        ref = Database.database().reference()
        refAppB = Database.database().reference()
        lblTitle.text = locTitle
        lblLocType.text = locType
        
     
        imagePicker.delegate = self
        imagePicker1.delegate = self
     
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
