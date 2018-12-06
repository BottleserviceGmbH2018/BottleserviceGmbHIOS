//
//  BarAppOwner.swift
//  BottleServiceApp
//
//  Created by David Olarte on 16/08/2018.
//  Copyright © 2018 Iselacher Digital Media Factory. All rights reserved.
//

import UIKit
import Firebase
import SDWebImage

class BarAppOwner: UIViewController, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
  
        if collectionView == cvBarProgress {
            
            return progressData.count
            
            
        } else {
            
            return publishedData.count
            
            
        }
        
        
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if collectionView == cvBarProgress {
           let progressCell = cvBarProgress.dequeueReusableCell(withReuseIdentifier: "CellProgress", for: indexPath) as! AppBarCollectionViewCell
            let progress = progressData[indexPath.row]
             progressCell.ProgImageView.sd_setImage(with: URL(string: progress.url), placeholderImage: UIImage(named: "bottle service dave") )
                progressCell.lblLocName.text = progressData[indexPath.row].locTitle
           return progressCell
       } else {
            
            
            
     
        let publishedCell = cvBarPublish.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! AppBarPubCollectionViewCell
            
            let published = publishedData[indexPath.row]
            
            publishedCell.PubImageView.sd_setImage(with: URL(string: published.url), placeholderImage: UIImage(named: "bottle service dave"))
            
            publishedCell.lblLocName.text = publishedData[indexPath.row].locTitle
            publishedCell.lblLocAdd.text = publishedData[indexPath.row].locAdd
            
    
            return publishedCell
      }
    }
    

    
    @IBOutlet weak var lblUser: UILabel!
    
    
    var progressData =  [BarDataProgress]()
    var publishedData = [BarDataPublished]()
    
    @IBOutlet weak var cvBarPublish: UICollectionView!
    @IBOutlet weak var cvBarProgress: UICollectionView!
    //var dbRef1 : DatabaseReference!
    var dbRef : DatabaseReference!

    
    func checkUserLoggedIn() {
        
        
        let uid = Auth.auth().currentUser?.uid
        
    Database.database().reference().child("users").child(uid!).observeSingleEvent(of: .value , with: {(snapshot) in
        if let dictionary = snapshot.value as? [String: AnyObject]{
            self.lblUser.text = dictionary["email"] as? String
        }
    }, withCancel:nil)
    }
    
    func loadProgress(){

        
        let queryRef = dbRef.queryOrdered(byChild: "locationStatus").queryEqual(toValue: "Pending")
        queryRef.observe(DataEventType.value, with: {(snapshot)  in
            var newProgress = [BarDataProgress]()
            for barProgress in snapshot.children{
               let progressObj = BarDataProgress(snapshot: barProgress as! DataSnapshot)
                newProgress.append(progressObj)
           }
            self.progressData = newProgress
            self.cvBarProgress.reloadData()
        })
   }
 
    
    func loadPublished(){
        
    let queryref1 = dbRef.queryOrdered(byChild: "locationStatus").queryEqual(toValue: "Approved")
        queryref1.observe(DataEventType.value, with: {(snapshot) in
            var newImages = [BarDataPublished]()
            for barDataImage in snapshot.children {
                let publishObj = BarDataPublished(snapshot: barDataImage as! DataSnapshot)
                newImages.append(publishObj)
            }
            self.publishedData = newImages
            self.cvBarPublish.reloadData()
        })
    }
    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
 
        
     //   let uid = Auth.auth().currentUser?.uid
        
        
     //   dbRef = Database.database().reference().child("Location_Information").child("Bar").child(uid!)
       // dbRef1 = Database.database().reference().child("Location_Information").child("Bar").child(uid!)
      dbRef = Database.database().reference().child("OwnerToApp").child("Bar")
        loadProgress()
        loadPublished()
        checkUserLoggedIn()
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    


}
