//
//  LocationBar.swift
//  BottleServiceApp
//
//  Created by David Olarte on 12.04.18.
//  Copyright © 2018 Iselacher Digital Media Factory. All rights reserved.
//

import UIKit
import FirebaseDatabase
import FirebaseStorage
import FirebaseAuth
import Firebase
import SDWebImage

class LocationBar: UIViewController, UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
       
        if collectionView == cvProgress {
            return progressData.count
        } else {
        
        return publishedData.count
    }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        
        if collectionView == cvProgress {
        
        let progressCell = cvProgress.dequeueReusableCell(withReuseIdentifier: "CellProgress", for: indexPath) as! ProgressBarCollectionViewCell
        
        let progress = progressData[indexPath.row]
         progressCell.ProgressImageView.sd_setImage(with: URL(string: progress.url), placeholderImage: UIImage(named: "bottle service dave"))
            progressCell.lblTitle.text = progressData[indexPath.row].locTitle

        return progressCell
    
        } else {
        
        let publishedCell = cvPublished.dequeueReusableCell(withReuseIdentifier: "CellPublished", for: indexPath) as! PublishedBarCollectionViewCell
            
            let published = publishedData[indexPath.row]
          publishedCell.PublishedImage.sd_setImage(with: URL(string: published.url), placeholderImage: UIImage(named: "bottle service dave"))
            publishedCell.lblTitle.text = publishedData[indexPath.row].locTitle
            publishedCell.lblAddress.text = publishedData[indexPath.row].locAdd
         return publishedCell
            
        }
        }
    
    
    
    
    
    @IBOutlet weak var lblUser: UILabel!
     func checkifuserLoggedIn(){
        let uid = Auth.auth().currentUser?.uid
        Database.database().reference().child("users").child(uid!).observeSingleEvent(of: .value, with: {(snapshot) in
            if let dictionary = snapshot.value as? [String: AnyObject]{
                self.lblUser.text = dictionary["email"] as? String
            }

        }, withCancel:nil)
        
    }
    
    

    
    @IBOutlet weak var cvProgress: UICollectionView!
    @IBOutlet weak var cvPublished: UICollectionView!
    
    var dbRef : DatabaseReference!
    var progressData = [BarDataProgress]()
    var publishedData = [BarDataPublished]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

    let uid = Auth.auth().currentUser?.uid
      dbRef = Database.database().reference().child("Location_Information").child("Bar").child(uid!)
        //   dbRef1 = Database.database().reference().child("Location_Information").child("Bar").child(uid!)
      
        loadPending()
        loadApproved()
      checkifuserLoggedIn()
    
    }
    
    
    var queryref: DatabaseQuery!
    var queryref1: DatabaseQuery!
    
    func loadApproved() {
     let queryref1 = dbRef.queryOrdered(byChild: "locationStatus").queryEqual(toValue: "Approved")
        
        queryref1.observe(DataEventType.value, with: {(snapshot) in
            var newBarPub = [BarDataPublished]()
            for BarDataImages in snapshot.children {
                let BarObject = BarDataPublished(snapshot: BarDataImages as! DataSnapshot)
                newBarPub.append(BarObject)
        
    }
            
            self.publishedData = newBarPub
            self.cvPublished.reloadData()
        })
        
    
    }
    
    func loadPending(){
        let queryref = dbRef.queryOrdered(byChild: "locationStatus").queryEqual(toValue: "Pending")
        queryref.observe(DataEventType.value, with: {(snapshot) in
            var newProgress = [BarDataProgress]()
            
            for barProgress in snapshot.children {
                
                let progressObject = BarDataProgress(snapshot: barProgress as! DataSnapshot)
                newProgress.append(progressObject)
            }
            
            self.progressData = newProgress
            self.cvProgress.reloadData()
        })
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
