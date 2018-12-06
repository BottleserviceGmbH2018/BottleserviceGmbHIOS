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

struct LoadDataOnEvent{
    
    
    
    let locTitle : String!
    let locAdd1 : String!
    let locType : String!
    let key:String!
    let url:String!
    let itemRef: DatabaseReference?
    
    
    
    init(url:String, key:String, locTitle: String, locAdd1: String, locType: String){
        
        
        self.locTitle = locTitle
        self.locAdd1 = locAdd1
        self.locType = locType
        
        
        self.key = key
        self.url = url
        self.itemRef = nil
        
    }
    
    init(snapshot:DataSnapshot){
        key = snapshot.key
        itemRef = snapshot.ref
        let snapshotValue = snapshot.value as? NSDictionary
        if let imageUrl = snapshotValue?["locationSlider"] as? String {
            url = imageUrl
        } else {
            url = ""
        }
        
        if let loungeName = snapshotValue?["locationTitle"] as? String {
            locTitle = loungeName
            
        } else {
            locTitle = ""
        }
        if let loungeAdd = snapshotValue?["locationAdd1"] as? String {
            locAdd1 = loungeAdd
            
        } else {
            locAdd1 = ""
        }
        
        if let locType1 = snapshotValue?["locationType"] as? String {
            locType = locType1
        } else {
            locType = ""
        }
        
    }
}

struct LoadDataOnLounge{
    
    let locTitle : String!
    let locAdd1 : String!
    let locType: String!
    let locuid : String!
    let key:String!
    let url:String!
    let itemRef: DatabaseReference?
    
    
    
    init(url:String, key:String, locTitle: String, locAdd1: String, locType: String, locuid:String){
        
        
        self.locTitle = locTitle
        self.locAdd1 = locAdd1
        self.locType = locType
        self.locuid = locuid
        
        self.key = key
        self.url = url
        self.itemRef = nil
        
    }
    
    init(snapshot:DataSnapshot){
        key = snapshot.key
        itemRef = snapshot.ref
        let snapshotValue = snapshot.value as? NSDictionary
        if let imageUrl = snapshotValue?["locationSlider"] as? String {
            url = imageUrl
        } else {
            url = ""
        }
        
        if let loungeName = snapshotValue?["locationTitle"] as? String {
            locTitle = loungeName
            
        } else {
            locTitle = ""
        }
        if let loungeAdd = snapshotValue?["locationAdd1"] as? String {
            locAdd1 = loungeAdd
            
        } else {
            locAdd1 = ""
        }
        
        if let locType1 = snapshotValue?["locationType"] as? String {
            locType = locType1
        } else {
            locType = ""
        }
        
        if let locuid1 = snapshotValue?["ownerUserID"] as? String {
            locuid = locuid1
        } else {
            locuid = ""
        }
        
    }
    }




struct LoadDataOnBar{
    
    let locTitle : String!
    let locAdd1 : String!
    let locType: String!
    let locuid: String!
    let key:String!
    let url:String!
    let itemRef: DatabaseReference?
    
    
    
    init(url:String, key:String, locTitle: String, locAdd1: String, locType: String, locuid: String){
        
        
        self.locTitle = locTitle
        self.locAdd1 = locAdd1
        self.locType = locType
        self.locuid = locuid
        
        
        self.key = key
        self.url = url
        self.itemRef = nil
        
    }
    
    init(snapshot:DataSnapshot){
        key = snapshot.key
        itemRef = snapshot.ref
        let snapshotValue = snapshot.value as? NSDictionary
        if let imageUrl = snapshotValue?["locationSlider"] as? String {
            url = imageUrl
        } else {
            url = ""
        }
        
        if let loungeName = snapshotValue?["locationTitle"] as? String {
            locTitle = loungeName
            
        } else {
            locTitle = ""
        }
        if let loungeAdd = snapshotValue?["locationAdd1"] as? String {
            locAdd1 = loungeAdd
            
        } else {
            locAdd1 = ""
        }
        
        if let locType1 = snapshotValue?["locationType"] as? String {
            locType = locType1
            
        } else {
            locType = ""
        }
        
        if let locuid1 = snapshotValue?["ownerUserID"] as? String {
            
            locuid = locuid1
        } else {
            
            locuid = ""
        }
        
    }
}



    

