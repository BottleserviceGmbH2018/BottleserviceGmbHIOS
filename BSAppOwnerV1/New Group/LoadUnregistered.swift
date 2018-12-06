//
//  LoadUnregistered.swift
//  BSAppOwnerV1
//
//  Created by David Olarte on 23.05.18.
//  Copyright © 2018 Iselacher Digital Media Factory. All rights reserved.
//

import Foundation
import FirebaseDatabase

struct LoadUnReg {
    let key: String!
    let url: String!
    
    let loctitle: String!
    let locAddress: String!
    let locStatus: String!
    let locType: String!
    let locOwner: String!
    let locDate: String!
    
    
    let itemRef: DatabaseReference?
    
    init(url:String, key:String,  loctitle:String, locAddress:String,locStatus:String, locType:String, locOwner: String, locDate:String) {
        self.key = key
        self.url = url
        self.locOwner = locOwner
        self.locAddress = locAddress
        self.locStatus = locStatus
        self.loctitle = loctitle
        self.locType = locType
        self.locDate = locDate
        
        
        self.itemRef = nil
        
    }
    
    init(snapshot:DataSnapshot) {
        key = snapshot.key
        itemRef = snapshot.ref
        
        let snapshotValue = snapshot.value as? NSDictionary
        
        if let imageUrl = snapshotValue?["locationSlider"] as? String {
            url = imageUrl
           
        } else {
            url = ""
        }
        
        if let title = snapshotValue?["locationTitle"] as? String {
            loctitle = title
            
        } else {
            loctitle = ""
        }
        
        if let city = snapshotValue?["locationCity"] as? String {
            locAddress = city
            
        } else {
            locAddress = ""
        }
        
        
        if let status = snapshotValue?["locationStatus"] as? String {
            locStatus = status
            
        } else {
            locStatus = ""
        }
        
        
        if let type = snapshotValue?["locationType"] as? String {
            locType = type
            
        } else {
            locType = ""
        }

        if let owner = snapshotValue?["locationOwner"] as? String {
            locOwner = owner
            
        } else {
            locOwner = ""
        }
        
        
        if let date = snapshotValue?["locationDateApplied"] as? String {
            locDate = date
            
        } else {
            locDate = ""
        }
        
        
        
        
        
        
    }
}
