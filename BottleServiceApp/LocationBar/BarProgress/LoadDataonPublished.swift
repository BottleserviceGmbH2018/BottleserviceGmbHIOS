//
//  LoadDataonPublished.swift
//  BottleServiceApp
//
//  Created by David Olarte on 17.05.18.
//  Copyright © 2018 Iselacher Digital Media Factory. All rights reserved.
//

import Foundation
import FirebaseDatabase


struct BarDataPublished{
    
    let key:String!
    let url:String!
    
    let locTitle : String!
    let locAdd : String!
    
    
    
    let itemRef: DatabaseReference?
    
    init(url:String, key:String, locTitle: String, locAdd: String)
    {
        self.locTitle = locTitle
        self.locAdd = locAdd
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
        if let address = snapshotValue?["locationAdd1"] as? String {
            locAdd = address
            
        } else {
            locAdd = ""
        }
        
        
    }
}
