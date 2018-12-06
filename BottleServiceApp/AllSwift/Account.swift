//
//  Account.swift
//  BottleServiceApp
//
//  Created by David Olarte on 03.04.18.
//  Copyright © 2018 Iselacher Digital Media Factory. All rights reserved.
//

import UIKit
import Firebase
import FirebaseStorage
import FirebaseDatabase
import FirebaseAuth

class Account: UIViewController {
    
    

    @IBOutlet weak var lblnameemail: UILabel!
    @IBOutlet weak var lblname: UILabel!
    @IBOutlet weak var lblemail: UILabel!
   
    
    
    func checkifuserLoggedIn(){

        let uid = Auth.auth().currentUser?.uid
        Database.database().reference().child("users").child(uid!).observeSingleEvent(of: .value, with: {(snapshot) in
            
            
            if let dictionary = snapshot.value as? [String: AnyObject]{
                self.lblemail.text = dictionary["email"] as? String
                self.lblname.text = dictionary ["name"] as? String
                let two = self.lblname.text! + " - " + self.lblemail.text!
                self.lblnameemail.text! = two
                 
             }
            
            
        }, withCancel:nil)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        checkifuserLoggedIn()
       
      
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
