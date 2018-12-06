//
//  LoadDataonBook.swift
//  BSClientAppV1
//
//  Created by David Olarte on 02.06.18.
//  Copyright © 2018 Iselacher Digital Media Factory. All rights reserved.
//

import Foundation
import Firebase

struct LoadBook {
    let key: String!
    let url: String!
    let locname : String!
    let specName  : String!
    let resDate : String!
    let payment : String!
    let status : String!
    
    let itemRef: DatabaseReference?
    
    init(url: String, key: String, locname:String, specName:String, resDate: String, payment:String, status: String) {
        self.key = key
        self.url = url
        self.itemRef = nil
        self.locname = locname
        self.specName = specName
        self.resDate = resDate
        self.payment = payment
        self.status = status
        
    }
    
    init(snapshot:DataSnapshot) {
        key = snapshot.key
        itemRef = snapshot.ref
        
        let snapshotValue = snapshot.value as? NSDictionary
        
        if let imageUrl = snapshotValue?["locationSlider"] as? String{
            url = imageUrl
        } else {
            url = ""
        }
        
        if let locname1 = snapshotValue?["locName"] as? String {
            locname = locname1
        } else {
            locname = ""
        }
        
        if let specName1 = snapshotValue?["specType"] as? String{
            specName = specName1
        } else {
            specName = ""
        }
        
        if let resDate1 = snapshotValue?["resDate"] as? String{
            resDate = resDate1
        } else {
            resDate = ""
        }
        
        if let payment1 = snapshotValue?["paymentStatus"] as? String{
            payment = payment1
        } else {
            payment = ""
        }
        if let status1 = snapshotValue?["status"] as? String{
            status = status1
        } else {
            status = ""
        }
        
    }
}
