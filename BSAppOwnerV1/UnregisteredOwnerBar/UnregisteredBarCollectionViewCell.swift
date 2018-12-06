//
//  UnregisteredBarCollectionViewCell.swift
//  BottleServiceApp
//
//  Created by David Olarte on 18/09/2018.
//  Copyright © 2018 Iselacher Digital Media Factory. All rights reserved.
//

import UIKit
import Firebase

class UnregisteredBarCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var lblDateApplied: UILabel!
    @IBOutlet weak var lblOwnerName: UILabel!
    @IBOutlet weak var lblAddress: UILabel!
    @IBOutlet weak var lblStatus: UILabel!
    @IBOutlet weak var UnRegBarImage: UIImageView!
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblLoc: UILabel!
    
    @IBOutlet weak var btnApprove: UIButton!
    
    @IBOutlet weak var btnReject: UIButton!
    
    @IBOutlet weak var lblApproved: UILabel!
    @IBAction func btnApprove(_ sender: Any) {
        
        uploadDataBar()
    }
    
    @IBAction func btnReject(_ sender: Any) {
        
        
    }
    func uploadDataBar() {
        //let user = Auth.auth().currentUser
        let title = lblTitle.text!
        
        
        let ref = Database.database().reference().child("OwnerToApp").child("Bar").child(title)
        ref.updateChildValues ( [
            "locationStatus": lblApproved.text! ,
            ])
    }
    
    
    
    
}
