//
//  DashboardOwner.swift
//  BottleServiceApp
//
//  Created by David Olarte on 27/06/2018.
//  Copyright © 2018 Iselacher Digital Media Factory. All rights reserved.
//

import UIKit
import Firebase


class DashboardOwner: UIViewController {
    
    
    
    @IBOutlet weak var lblCountBar: UITextView!
    @IBOutlet weak var lblCountLounge: UITextView!
    func countLounge(){
        let user = Auth.auth().currentUser
        let ref = Database.database().reference().child("Location_Information").child("Lounge").child((user?.uid)!)
        
        ref.observe(.value, with: {(snapshot: DataSnapshot!) in
            print("Got Lounge");
           print(snapshot.childrenCount)
            let counts: Int = Int(snapshot.childrenCount)
            
            self.lblCountLounge.text = String(counts)
            
      
           
        })
    }
    func countBar(){
        let user = Auth.auth().currentUser
        let ref = Database.database().reference().child("Location_Information").child("Bar").child((user?.uid)!)
        
        ref.observe(.value, with: {(snapshot: DataSnapshot!) in
            print("Got Bar");
           print(snapshot.childrenCount)
            
            let count: Int = Int(snapshot.childrenCount)
            
            self.lblCountBar.text = String(count)
            
            
        })
    }


    override func viewDidLoad() {
        super.viewDidLoad()
      countLounge()
        countBar()
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
