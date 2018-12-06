//
//  PayAndReview.swift
//  BSClientAppV1
//
//  Created by David Olarte on 31.05.18.
//  Copyright © 2018 Iselacher Digital Media Factory. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth
import FirebaseDatabase
//import FirebaseFunctions
import FirebaseStorage

//import FirebaseFunctions

class PayAndReview: UIViewController {
    var loctype = ""
    var locTitle = ""
    var specTitle = ""
    var specDesc = ""
    var specGuest = ""
    var specPrice = ""
    var ownerID = ""
    //  lazy var functions = Functions.functions()
    func checkifuserLoggedIn(){
        
        let uid = Auth.auth().currentUser?.uid
        Database.database().reference().child("users").child(uid!).observeSingleEvent(of: .value, with: {(snapshot) in
            
            
            if let dictionary = snapshot.value as? [String: AnyObject]{
                self.lblUID.text = dictionary["uid"] as? String
                self.lblUserName.text = dictionary["name"] as? String
            }
            
            
        }, withCancel:nil)
        
    }
    var onClick : Bool!
    
    @IBOutlet weak var btnCheckBox: CheckBox!
    
    @IBAction func btnCheckBox(_ sender: Any) {
       
     
      
        if(onClick == true) {
          btnProceed.isHidden = true;
            onClick = false
        } else {
             btnProceed.isHidden = false;
            onClick = true
        }
        
    
    }
    
  
    @IBOutlet weak var btnProceed: UIButton!
    
    @IBOutlet weak var lblUserName: UILabel!
    @IBOutlet weak var lblUID: UILabel!
    @IBOutlet weak var lblNotifReq: UILabel!
    @IBOutlet weak var lblLocName: UITextView!
    @IBOutlet weak var resDate: UITextView!
    @IBOutlet weak var lblSpecTitle: UITextView!
    @IBOutlet weak var lblSpecDesc: UITextView!
    @IBOutlet weak var lblSpecGuest: UITextView!
    @IBOutlet weak var lblSpecPrice: UITextView!
    @IBOutlet weak var lblPending: UILabel!
    @IBOutlet weak var lblLocTitle: UITextView!
    
    @IBOutlet weak var lblOwnerID: UILabel!
    @IBOutlet weak var lblLocType: UILabel!
    
    @IBAction func btnProceed(_ sender: Any) {
        savedata()
        
    }
    
    
    @IBOutlet weak var lblPaid: UILabel!
    @IBOutlet weak var ImageSlider: UIImageView!
    
    
    
    
    
    
    func saveDataLounge() {
        let uid = Auth.auth().currentUser?.uid
        
        //    let locName = lblLocName.text
        let post = [
            "specType" : lblSpecTitle.text,
            "specDesc" : lblSpecDesc.text,
            "locName"   : lblLocName.text,
            "specGuest"   : lblSpecGuest.text,
            "locPrice"  : lblSpecPrice.text,
            "resDate" : resDate.text,
            "status" : lblPending.text,
            "paymentStatus" : lblPaid.text,
            "locType": lblLocType.text,
            "name" : lblUserName.text,
            "requested_by" : lblUID.text,
            ]
        ref?.child("Reservation_Status").child(uid!).child(locTitle).setValue(post)
        
        
        ref?.child("Reservation_OwnerSide").child(ownerID).child("Lounge").child(locTitle).setValue(post)
      
        
        
        uploadDataLounge()
        uploadDataLoungeOwner()
        // notif()
        
    }
    
    
    func saveDataBar() {
        let uid = Auth.auth().currentUser?.uid
        
        //    let locName = lblLocName.text
        let post = [
            "specType" : lblSpecTitle.text,
            "specDesc" : lblSpecDesc.text,
            "locName"   : lblLocName.text,
            "specGuest"   : lblSpecGuest.text,
            "locPrice"  : lblSpecPrice.text,
            "resDate" : resDate.text,
            "status" : lblPending.text,
            "paymentStatus" : lblPaid.text,
            "locType": lblLocType.text,
            "name" : lblUserName.text,
            "requested_by" : lblUID.text,
            
            ]
        ref?.child("Reservation_Status").child(uid!).child(locTitle).setValue(post)
        ref?.child("Reservation_OwnerSide").child(ownerID).child("Bar").child(locTitle).setValue(post)

        uploadDataBar()
        uploadDataBarOwner()
        // notif()
        
    }
    
    func uploadDataLounge() {
        
        let uid = Auth.auth().currentUser?.uid
        let title = lblLocName.text
        uploadMedia() { url in
            if url != nil {
                let ref = Database.database().reference().child("Reservation_Status").child(uid!).child(title!)
                ref.updateChildValues ([
                    "locationSlider" : url!
                    ])
            }
        }
        
    }
    
    
    func uploadDataLoungeOwner() {
        
      //  let uid = Auth.auth().currentUser?.uid
        let title = lblLocName.text
        uploadMedia() { url in
            if url != nil {
                let ref = Database.database().reference().child("Reservation_OwnerSide").child(self.ownerID).child("Lounge").child(title!)
                ref.updateChildValues ([
                    "locationSlider" : url!
                    ])
            }
        }
        
    }
    
    
    func uploadDataBar() {
        
        let uid = Auth.auth().currentUser?.uid
        let title = lblLocName.text
        uploadMedia1() { url in
            if url != nil {
                let ref = Database.database().reference().child("Reservation_Status").child(uid!).child(title!)
                ref.updateChildValues ([
                    "locationSlider" : url!
                    ])
            }
        }
        
    }
    
    func uploadDataBarOwner() {
        
      //  let uid = Auth.auth().currentUser?.uid
        let title = lblLocName.text
        uploadMedia1() { url in
            if url != nil {
                 let ref = Database.database().reference().child("Reservation_OwnerSide").child(self.ownerID).child("Bar").child(title!)
                ref.updateChildValues ([
                    "locationSlider" : url!
                    ])
            }
        }
        
    }
    
    
    
    func uploadMedia(completion: @escaping (_ url: String?) -> Void ) {
        let imageName = UUID().uuidString
        let storageRef = Storage.storage().reference().child("reservationimg").child("\(imageName).jpg")
        
        if let uploadData = UIImageJPEGRepresentation(self.ImageSlider.image!, 0.1){
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
        let storageRef = Storage.storage().reference().child("reservationimg").child("\(imageName).jpg")
        
        if let uploadData = UIImageJPEGRepresentation(self.ImageSlider.image!, 0.1){
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
    
    
    
    
    
    ////Loader
    
    func loadImageLounge(){
        let loctitle = lblLocTitle.text
        let ref = Database.database().reference()
        let usersRef = ref.child("OwnerToApp").child("Lounge").child(loctitle!)
        usersRef.observeSingleEvent(of: .value, with: { snapshot in
            if !snapshot.exists() {
                return
            }
            
            let userInfo = snapshot.value as! NSDictionary
            print(userInfo)
            print(userInfo["locationTitle"]!)
            let imgSld = userInfo["locationSlider"] as! String
            print(imgSld)
            let storageRef = Storage.storage().reference(forURL: imgSld)
            storageRef.downloadURL(completion: {(url, error) in
                let data = try? Data(contentsOf: url!)
                let image = UIImage(data: data! as Data)
                self.ImageSlider.image = image
            })
        })
        
    }
    
    
    
    func loadImageBar(){
        let loctitle = lblLocTitle.text
        let ref = Database.database().reference()
        let usersRef = ref.child("OwnerToApp").child("Bar").child(loctitle!)
        usersRef.observeSingleEvent(of: .value, with: { snapshot in
            if !snapshot.exists() {
                return
            }
            
            let userInfo = snapshot.value as! NSDictionary
            print(userInfo)
            print(userInfo["locationTitle"]!)
            let imgSld = userInfo["locationSlider"] as! String
            print(imgSld)
            let storageRef = Storage.storage().reference(forURL: imgSld)
            storageRef.downloadURL(completion: {(url, error) in
                let data = try? Data(contentsOf: url!)
                let image = UIImage(data: data! as Data)
                self.ImageSlider.image = image
            })
        })
        
    }
    
    
    
    
    
    
    //////// Lounge part above
    
    
    ////// Bar Part below
    
    
    
    
    ///Saving data
    
    func savedata() {
        if lblLocType.text == "Bar" {
            
            saveDataBar()
            
        } else if lblLocType.text == "Lounge" {
            
            
            saveDataLounge()
            
            
            
        } else if lblLocType.text == "Event" {
            
            
            
            
        }
        
        
    }
    
    
    
    /////loader
    
    func loadAll () {
        
        if lblLocType.text == "Bar" {
            loadImageBar()
            
        } else if lblLocType.text == "Lounge" {
            loadImageLounge()
            
            
        }else if lblLocType.text == "Event" {
            loadImageLounge()
        }
        
    }
    
 
    func getDate() {
        
        let date = Date()
        let formatter = DateFormatter()
        
        formatter.dateFormat = "MM/dd/yyyy"
        
        let result = formatter.string(from: date)
        resDate.text = result
    }
    
    
    
    var ref: DatabaseReference?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(locTitle)
        print(specPrice)
        print(specTitle)
        ref = Database.database().reference()
        checkifuserLoggedIn()
        lblLocName.text = locTitle
        lblSpecTitle.text = specTitle
        lblSpecDesc.text = specDesc
        lblSpecGuest.text = specGuest
        lblSpecPrice.text = specPrice
        lblLocTitle.text = locTitle
        lblLocType.text = loctype
        lblOwnerID.text = ownerID
        getDate()
        loadAll()
        //btnProceed.isHidden = true
        btnProceed.isHidden = true
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    
    
}
