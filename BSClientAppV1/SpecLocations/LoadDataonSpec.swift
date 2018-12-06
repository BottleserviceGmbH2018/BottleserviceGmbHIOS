//
//  LoadDataonSpec.swift
//  BSClientAppV1
//
//  Created by David Olarte on 31.05.18.
//  Copyright © 2018 Iselacher Digital Media Factory. All rights reserved.
//

import Foundation
import Firebase

struct LoadOnSpec{
    let key:String!
    let url:String!
    let specTitle:String!
    let specDesc:String!
    let specGuest:String!
    let specCost:String!
    let specLoc:String!
    let locType:String!
    
    let itemRef:DatabaseReference?
    
    init(url:String, key:String, specTitle:String, specDesc:String, specGuest:String, specCost:String, specLoc: String, loctype:String){
        self.key = key
        self.url = url
        self.specTitle = specTitle
        self.specDesc = specDesc
        self.specGuest = specGuest
        self.specCost = specCost
        self.specLoc = specLoc
        self.itemRef = nil
        self.locType = loctype
        
    }
    
    init(snapshot:DataSnapshot) {
        
        
        key = snapshot.key
        
        itemRef = snapshot.ref
        
        let snapshotValue = snapshot.value as? NSDictionary
        
        if let imageUrl = snapshotValue?["specficationSlider"] as? String {
            url = imageUrl
        } else {
            url = ""
        }
        
        if let specTitle1 = snapshotValue?["specficationTitle"] as? String {
            specTitle = specTitle1
        } else {
            specTitle = ""
        }

        if let specDesc1 = snapshotValue?["specficationDescription"] as? String {
            specDesc = specDesc1
        } else {
            specDesc = ""
        }
        
        if let specGuest1 = snapshotValue?["specficationGuests"] as? String {
            specGuest = specGuest1
        } else {
            specGuest = ""
        }
        
        if let specCost1 = snapshotValue?["specficationPrice"] as? String {
            specCost = specCost1
        } else {
            specCost = ""
        }
        
        if let locSpec = snapshotValue?["locationTitle"] as? String {
            specLoc = locSpec
        } else {
            specLoc = ""
        }
        
        if let locType1 = snapshotValue?["locationType"] as? String {
                locType = locType1
        }else {
            locType = ""
        }
 
    }
}


struct LoadOnBar{
    let key:String!
    let url:String!
    let specTitle:String!
    let specDesc:String!
    let specGuest:String!
    let specCost:String!
    let specLoc:String!
    let locType:String!
    
    let itemRef:DatabaseReference?
    
    init(url:String, key:String, specTitle:String, specDesc:String, specGuest:String, specCost:String, specLoc: String, loctype:String){
        self.key = key
        self.url = url
        self.specTitle = specTitle
        self.specDesc = specDesc
        self.specGuest = specGuest
        self.specCost = specCost
        self.specLoc = specLoc
        self.itemRef = nil
        self.locType = loctype
        
    }
    
    init(snapshot:DataSnapshot) {
        
        
        key = snapshot.key
        
        itemRef = snapshot.ref
        
        let snapshotValue = snapshot.value as? NSDictionary
        
        if let imageUrl = snapshotValue?["specficationSlider"] as? String {
            url = imageUrl
        } else {
            url = ""
        }
        
        if let specTitle1 = snapshotValue?["specficationTitle"] as? String {
            specTitle = specTitle1
        } else {
            specTitle = ""
        }
        
        if let specDesc1 = snapshotValue?["specficationDescription"] as? String {
            specDesc = specDesc1
        } else {
            specDesc = ""
        }
        
        if let specGuest1 = snapshotValue?["specficationGuests"] as? String {
            specGuest = specGuest1
        } else {
            specGuest = ""
        }
        
        if let specCost1 = snapshotValue?["specficationPrice"] as? String {
            specCost = specCost1
        } else {
            specCost = ""
        }
        
        if let locSpec = snapshotValue?["locationTitle"] as? String {
            specLoc = locSpec
        } else {
            specLoc = ""
        }
        
        if let locType1 = snapshotValue?["locationType"] as? String {
            locType = locType1
        }else {
            locType = ""
        }
        
    }
}
