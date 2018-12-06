//
//  Setvenue4.swift
//  BottleServiceApp
//
//  Created by David Olarte on 27.04.18.
//  Copyright © 2018 Iselacher Digital Media Factory. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth
import FirebaseStorage
import FirebaseDatabase

class Setvenue4: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    
    var locTitle : String = ""
    var locType : String = ""
    var spTitle : String = ""
    var spArea : String = ""
    var spGuest : String = ""
    var spPrice : String = ""
    
    var ref: DatabaseReference?
    
    
    @IBOutlet weak var lblPrice: UILabel!
    @IBOutlet weak var lblGuest: UILabel!
    @IBOutlet weak var locSDescribe: UILabel!
    @IBOutlet weak var lblSTitle: UILabel!
    @IBOutlet weak var lblLocType: UILabel!
    @IBOutlet weak var lblLocTitle: UILabel!
    @IBOutlet weak var btnSave: UIButton!
    @IBOutlet weak var imageView1: UIImageView!
    
    let imagepicker = UIImagePickerController()
    
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
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        if segue.destination is Setvenue2
        {
            let vs = segue.destination as? Setvenue2
            vs?.locTitle = lblLocTitle.text!
            vs?.locType = lblLocType.text!
  
        }
    }
    
  
    
    
    @IBAction func btnSave(_ sender: Any) {
     let type = lblLocType.text
        
        if type == "Lounge" {
            loadSpecOnLounge()
            
        } else if type == "Bar" {
            
            loadSpecOnBar()
        }
    
    }
    
    
    func loadSpecOnLounge() {
        let user = Auth.auth().currentUser?.uid
        let title = lblLocTitle.text
        let specTitle = lblSTitle.text
        
        uploadMedia() { url in
            if url != nil {
                let post = [
                    "specficationTitle" : self.lblSTitle.text,
                    "specficationDescription" : self.locSDescribe.text,
                    "specficationGuests" : self.lblGuest.text,
                    "specficationPrice" : self.lblPrice.text,
                    "specficationSlider" : url!,
                    "locationTitle": self.lblLocTitle.text,  
                ]
                self.ref?.child("Location_Specific").child("Lounge").child(user!).child(title!).child(specTitle!).setValue(post)
            }
        }
     }
    
    func loadSpecOnBar(){
           let user = Auth.auth().currentUser?.uid
            let title = lblLocTitle.text
        let specTitle = lblSTitle.text
            uploadMedia() { url in
                if url != nil {
                    let post = [
                        "specficationTitle" : self.lblSTitle.text,
                        "specficationDescription" : self.locSDescribe.text,
                        "specficationGuests" : self.lblGuest.text,
                        "specficationPrice" : self.lblPrice.text,
                        "specficationSlider" : url!,
                        "locationTitle": self.lblLocTitle.text,
                        
                    ]
                    self.ref?.child("Location_Specific").child("Bar").child(user!).child(title!).child(specTitle!).setValue(post)
                    
                }
            }
    }
    
    

    
    
    
    
    
    
    
    
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        if let pickedImage = info[UIImagePickerControllerOriginalImage] as? UIImage{
            imageView1.contentMode = .scaleToFill
            imageView1.image = pickedImage
            
            
        }
    btnSave.isHidden = false
         dismiss(animated: true, completion: nil)
        
    }
    
    
    @IBAction func loadImage(_ sender: UIButton) {
        imagepicker.allowsEditing = false
        imagepicker.sourceType = .photoLibrary
        present(imagepicker, animated: true, completion: nil)
        
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ref = Database.database().reference()
        
        
        imagepicker.delegate = self
        
        
       lblLocType.text = locType
        lblLocTitle.text = locTitle
        lblSTitle.text = spTitle
        locSDescribe.text = spArea
        lblGuest.text = spGuest
        lblPrice.text = spPrice

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
