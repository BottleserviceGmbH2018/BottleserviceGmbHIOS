//
//  LoungeReservationCollectionViewCell.swift
//  BottleServiceApp
//
//  Created by David Olarte on 14/06/2018.
//  Copyright © 2018 Iselacher Digital Media Factory. All rights reserved.
//

import UIKit
import Firebase

class LoungeReservationCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var lblLocName: UILabel!
    @IBOutlet weak var LoungeImage: UIImageView!
    @IBOutlet weak var lblNmae: UILabel!
    
    @IBOutlet weak var lblAddress: UILabel!
    @IBOutlet weak var lblApproved: UILabel!
    @IBOutlet weak var lblRejected: UILabel!
    
    override func prepareForReuse() {
        super.prepareForReuse()
self.LoungeImage.image = nil
    }
    
    
    @IBAction func btnAccept(_ sender: Any) {
   
            let user = Auth.auth().currentUser?.uid
            let name = lblLocName.text!
            
            
        let ref = Database.database().reference().child("Reservation_OwnerSide").child(user!).child("Lounge").child(name)
            ref.updateChildValues ( [
                "status": lblApproved.text! ,
                ])
        
        
        
      //  let refClient = Database.database().reference().child("Reservation_Status").
   
        
    }
    
    
    @IBOutlet weak var btnReject: UIButton!
    
    
    
    @IBAction func btnReject(_ sender: Any) {
    }
    
    
}





