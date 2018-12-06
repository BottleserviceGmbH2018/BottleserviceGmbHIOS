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

struct LoadDataOnEvenReservation{
    
    
    
    let locTitle : String!
    let locAdd1 : String!
    let username : String!
    let resdate : String!
    
    
    
    let key:String!
    let url:String!
    let itemRef: DatabaseReference?
    
    
    
    init(url:String, key:String, locTitle: String, locAdd1: String, username: String, resdate: String){
        
        self.resdate = resdate
        self.locTitle = locTitle
        self.locAdd1 = locAdd1
        self.username = username
        
        
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
        
        if let loungeName = snapshotValue?["locName"] as? String {
            locTitle = loungeName
            
        } else {
            locTitle = ""
        }
        if let loungeAdd = snapshotValue?["locationAdd1"] as? String {
            locAdd1 = loungeAdd
            
        } else {
            locAdd1 = ""
        }
        
        
        if let resowner = snapshotValue?["name"] as? String {
            
            username = resowner
            
        } else {
            
            username = ""
        }
        
        
        
        if let resday = snapshotValue?["resDate"] as? String {
            
            resdate = resday
            
        } else {
            
            resdate = ""
        }
        
        
    }
}

struct LoadDataOnLoungeReservation{
    
    
    
    let locTitle : String!
    let locAdd1 : String!
    let username : String!
    let resdate : String!
    
    
    
    let key:String!
    let url:String!
    let itemRef: DatabaseReference?
    
    
    
    init(url:String, key:String, locTitle: String, locAdd1: String, username: String, resdate: String){
        
        self.resdate = resdate
        self.locTitle = locTitle
        self.locAdd1 = locAdd1
        self.username = username
        
        
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
        
        if let loungeName = snapshotValue?["locName"] as? String {
            locTitle = loungeName
            
        } else {
            locTitle = ""
        }
        if let loungeAdd = snapshotValue?["locationAdd1"] as? String {
            locAdd1 = loungeAdd
            
        } else {
            locAdd1 = ""
        }
        
        
        if let resowner = snapshotValue?["name"] as? String {
            
            username = resowner
            
        } else {
            
            username = ""
        }
        
        
        
        if let resday = snapshotValue?["resDate"] as? String {
            
            resdate = resday
            
        } else {
            
            resdate = ""
        }
        
        
    }
}

struct LoadDataOnBarReservation{
    
    
    
    let locTitle : String!
    let locAdd1 : String!
    let username : String!
    let resdate : String!
    
    
    
    let key:String!
    let url:String!
    let itemRef: DatabaseReference?
    
    
    
    init(url:String, key:String, locTitle: String, locAdd1: String, username: String, resdate: String){
        
        self.resdate = resdate
        self.locTitle = locTitle
        self.locAdd1 = locAdd1
        self.username = username
        
        
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
        
        if let loungeName = snapshotValue?["locName"] as? String {
            locTitle = loungeName
            
        } else {
            locTitle = ""
        }
        if let loungeAdd = snapshotValue?["locationAdd1"] as? String {
            locAdd1 = loungeAdd
            
        } else {
            locAdd1 = ""
        }
        
        
        if let resowner = snapshotValue?["name"] as? String {
            
            username = resowner
            
        } else {
            
            username = ""
        }
        
        
        
        if let resday = snapshotValue?["resDate"] as? String {
            
            resdate = resday
            
        } else {
            
            resdate = ""
        }
        
        
    }
}



