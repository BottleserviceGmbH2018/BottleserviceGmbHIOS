//
//  Dashboard.swift
//  BottleServiceApp
//
//  Created by David Olarte on 03.04.18.
//  Copyright © 2018 Iselacher Digital Media Factory. All rights reserved.
//

import UIKit
import FirebaseDatabase
import FirebaseStorage
import FirebaseAuth
import Firebase


class Dashboard: UIViewController {
    @IBOutlet weak var lbluser: UILabel!
    
    
    
    func checkifuserLoggedIn(){
    
        let uid = Auth.auth().currentUser?.uid
        Database.database().reference().child("users").child(uid!).observeSingleEvent(of: .value, with: {(snapshot) in
            
            
            if let dictionary = snapshot.value as? [String: AnyObject]{
                self.lbluser.text = dictionary["name"] as? String
            }
        
            
        }, withCancel:nil)
      
    }




    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    checkifuserLoggedIn()

        // Do any additional setup after loading the view.
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

