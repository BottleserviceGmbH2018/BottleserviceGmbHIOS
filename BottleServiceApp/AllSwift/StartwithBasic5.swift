//
//  StartwithBasic5.swift
//  BottleServiceApp
//
//  Created by David Olarte on 11.04.18.
//  Copyright © 2018 Iselacher Digital Media Factory. All rights reserved.
//

import UIKit
import FirebaseDatabase
import FirebaseStorage
import FirebaseAuth
import Firebase


class StartwithBasic5: UIViewController, UITextFieldDelegate {
    
    
    var desc : String = ""
    var location : String = ""
    var guests : String = ""
    var add1 : String = ""
    var add2 : String = ""
    var city : String = ""
    var postal : String = ""
    var fullbar : String = ""
    var outdoor : String = ""
    var craft : String = ""
    var night : String = ""
    var wifi : String = ""
    var ac : String = ""
    var cash : String = ""
    var card : String = ""
    var locTitle: String = ""

    @IBOutlet weak var lblcard: UILabel!
    @IBOutlet weak var lblcash: UILabel!
    @IBOutlet weak var lblac: UILabel!
    @IBOutlet weak var lblwifi: UILabel!
    @IBOutlet weak var lblnight: UILabel!
    @IBOutlet weak var lblcraft: UILabel!
    @IBOutlet weak var lbloutdoor: UILabel!
    @IBOutlet weak var lblfullbar: UILabel!
    @IBOutlet weak var lblGuests: UILabel!
    @IBOutlet weak var lblLoc: UILabel!
    @IBOutlet weak var lblPostal: UILabel!
    @IBOutlet weak var lblCity: UILabel!
    @IBOutlet weak var lblAdd2: UILabel!
    @IBOutlet weak var lblAdd1: UILabel!
    @IBOutlet weak var lblDesc: UILabel!
    @IBOutlet weak var lblUser: UILabel!
    @IBOutlet weak var txtTitle: UITextField!
    @IBOutlet weak var lblPending: UILabel!
    @IBOutlet weak var lblProgress: UILabel!
    
    var ref: DatabaseReference?

   override func  prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        if segue.destination is SettheVenue
        {
            let vs = segue.destination as? SettheVenue
            vs?.locTitle = txtTitle.text!
            vs?.locType = lblLoc.text!
            
        }
    }
 
    @IBAction func btnNext(_ sender: Any) {
       let user = Auth.auth().currentUser?.uid
        
        
        let title = txtTitle.text
        
        if lblLoc.text! == "Lounge"{
            
            
            let post = [
                "locationType" : lblLoc.text,
                "locationTitle" : txtTitle.text,
                "locationAdd1" : lblAdd1.text,
                "locationAdd2" : lblAdd2.text,
                "locationCity" : lblCity.text,
                "locationPostal" : lblPostal.text,
                "locationFeature" : lblfullbar.text,
                "locationDesc" : lblDesc.text,
                "locationGuests": lblGuests.text,
                "locationStatus": lblPending.text,
                "locationOwner" : lblOwnerName.text,
                "locationDateApplied" : lblDateToday.text,
                "locationProgress" : lblProgress.text,
                "ownerUserID" : lblUser.text,
                ]
            
            let postApp = [
                "locationType" : lblLoc.text,
                "locationTitle" : txtTitle.text,
                "locationAdd1" : lblAdd1.text,
                "locationAdd2" : lblAdd2.text,
                "locationCity" : lblCity.text,
                "locationPostal" : lblPostal.text,
                "locationFeature" : lblfullbar.text,
                "locationDesc" : lblDesc.text,
                "locationGuests": lblGuests.text,
                "locationStatus": lblPending.text,
                "ownerUserID" : lblUser.text,
                "locationOwner" : lblOwnerName.text,
                "locationDateApplied" : lblDateToday.text,
                ]

            
    
            ref?.child("Location_Information").child("Lounge").child(user!).child(title!).setValue(post)
            ref?.child("OwnerToApp").child("Lounge").child(title!).setValue(postApp)
    
            
        } else if lblLoc.text! == "Bar" {
            let post1 = [
                "locationType" : lblLoc.text,
                "locationTitle" : txtTitle.text,
                "locationAdd1" : lblAdd1.text,
                "locationAdd2" : lblAdd2.text,
                "locationCity" : lblCity.text,
                "locationPostal" : lblPostal.text,
                "locationFeature" : lblfullbar.text,
                "locationDesc" : lblDesc.text,
                "locationGuests": lblGuests.text,
                "locationStatus": lblPending.text,
                "locationOwner" : lblOwnerName.text,
                "locationDateApplied" : lblDateToday.text,
                "locationProgress" : lblProgress.text,
                "ownerUserID" : lblUser.text,
                ]
            
            
            
            let postApp1 = [
                "locationType" : lblLoc.text,
                "locationTitle" : txtTitle.text,
                "locationAdd1" : lblAdd1.text,
                "locationAdd2" : lblAdd2.text,
                "locationCity" : lblCity.text,
                "locationPostal" : lblPostal.text,
                "locationFeature" : lblfullbar.text,
                "locationDesc" : lblDesc.text,
                "locationGuests": lblGuests.text,
                "locationStatus": lblPending.text,
                "ownerUserID" : lblUser.text,
                "locationOwner" : lblOwnerName.text,
                "locationDateApplied" : lblDateToday.text,
                
                ]
            


            ref?.child("Location_Information").child("Bar").child(user!).child(title!).setValue(post1)
            ref?.child("OwnerToApp").child("Bar").child(title!).setValue(postApp1)
            
        }
        
        

    }
    

    @IBOutlet weak var lblDateToday: UILabel!
    func getDate(){
        let date = Date()
        let formatter = DateFormatter()
        
        formatter.dateFormat = "MM/dd/yyyy"
        
        let result = formatter.string(from: date)
        lblDateToday.text = result
    }
    
    @IBOutlet weak var lblOwnerName: UILabel!
    func checkifuserLoggedIn(){
        
        let uid = Auth.auth().currentUser?.uid
        Database.database().reference().child("users").child(uid!).observeSingleEvent(of: .value, with: {(snapshot) in
            
            
            if let dictionary = snapshot.value as? [String: AnyObject]{
                self.lblUser.text = dictionary["uid"] as? String
                self.lblOwnerName.text = dictionary["name"] as? String
            }
            
            
        }, withCancel:nil)
        
    }
    
    
    
    
    let acceptable_characters = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz 1234567890"
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        
        
        let cs = NSCharacterSet(charactersIn: acceptable_characters).inverted
        let filtered = string.components(separatedBy: cs).joined(separator: "")
        
        return (string == filtered)
        
        
    }
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        getDate()
        hideKeyboardWhenTappedAround()
        ref = Database.database().reference()
        checkifuserLoggedIn()
        txtTitle.botLine()
        lblfullbar.text = fullbar
        lbloutdoor.text = outdoor
        lblcraft.text = craft
        lblnight.text = night
        lblwifi.text = wifi
        lblac.text = ac
        lblcash.text = cash
        lblcard.text = card
        lblAdd1.text = add1
        lblAdd2.text = add2
        lblCity.text = city
        lblPostal.text = postal
        lblLoc.text = location
        lblGuests.text = guests
        lblDesc.text = desc
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    



}
