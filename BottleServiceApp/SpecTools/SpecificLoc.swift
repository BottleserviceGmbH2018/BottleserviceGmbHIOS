//
//  LoadDataMain.swift
//  BSClientAppV1
//
//  Created by David Olarte on 14.05.18.
//  Copyright © 2018 Iselacher Digital Media Factory. All rights reserved.
//

import Foundation
import Firebase
import FirebaseDatabase

struct LoadDataOnSpecific{
    
    
    
    let specTitle : String!
    let specDetails : String!

    let key:String!
    let url:String!
    let itemRef: DatabaseReference?
    
    
    
    init(url:String, key:String, specTitle: String, specDetails: String){
        
        
        self.specTitle = specTitle
        self.specDetails = specDetails
       
        
        
        self.key = key
        self.url = url
        self.itemRef = nil
        
    }
    
    init(snapshot:DataSnapshot){
        key = snapshot.key
        itemRef = snapshot.ref
        let snapshotValue = snapshot.value as? NSDictionary
        if let imageUrl = snapshotValue?["specficationSlider"] as? String {
            url = imageUrl
        } else {
            url = ""
        }

        if let specName = snapshotValue?["specficationTitle"] as? String {
            specTitle = specName
            
        } else {
            specTitle = ""
        }
        if let specDet = snapshotValue?["specficationDescription"] as? String {
            specDetails = specDet
            
        } else {
            specDetails = ""
        }

    }
}






