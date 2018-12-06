//
//  UnregisteredCollectionViewCell.swift
//  BSAppOwnerV1
//
//  Created by David Olarte on 22.05.18.
//  Copyright © 2018 Iselacher Digital Media Factory. All rights reserved.
//

import UIKit
import Firebase

class UnregisteredCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var lblDateApplied: UILabel!
    @IBOutlet weak var lblOwnerName: UILabel!
    @IBOutlet weak var lblStatus: UILabel!
    @IBOutlet weak var btnAccept: UIButton!
    @IBOutlet weak var btnReject: UIButton!
    @IBOutlet weak var lblAddress: UILabel!
    @IBOutlet weak var ImageView: UIImageView!
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblTypeOfLoc: UILabel!
    @IBOutlet weak var lblApproved: UILabel!
    
    override func prepareForReuse() {
            super.prepareForReuse()
        self.ImageView.image = nil
        
    }
    
    @IBAction func btnApproved(_ sender: Any) {
        
  
    uploadDataLounge()
    
    }
    
    @IBAction func btnReject(_ sender: Any) {
      
    }
    
func uploadDataLounge() {
    //let user = Auth.auth().currentUser
    let title = lblTitle.text!
   
 
    let ref = Database.database().reference().child("OwnerToApp").child("Lounge").child(title)
               ref.updateChildValues ( [
                "locationStatus": lblApproved.text! ,
                ])
        }
    
}
