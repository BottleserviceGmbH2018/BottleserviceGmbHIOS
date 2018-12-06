//
//  LocationLoungeController.swift
//  
//
//  Created by David Olarte on 09.05.18.
//

import UIKit
import Firebase
import SDWebImage

class LocationLoungeController: UIViewController, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        
        if collectionView == cvProgress {
            return progressIMG.count
        } else{
        
        return images.count
    }
    }
  
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if collectionView == cvPublished {
        
        let cell = cvPublished.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath)as! ImageCollectionViewCell
        let image = images[indexPath.row]
        cell.imageView.sd_setImage(with: URL(string: image.url), placeholderImage: UIImage(named: "bottle service dave"))
     
            
            cell.lblTitle.text = images[indexPath.row].locTitle
        cell.lblAddress.text = images [indexPath.row].locAdd1
        
        return cell
        
        } else {
            
            let cellProgress = cvProgress.dequeueReusableCell(withReuseIdentifier: "cellProgress", for: indexPath) as! ProgressCollectionViewCell
            
            let progIMG = progressIMG[indexPath.row]
            
            cellProgress.ProgressImage.sd_setImage(with: URL(string: progIMG.url), placeholderImage: UIImage(named: "bottle service dave"))
            cellProgress.lblTitle.text = progressIMG[indexPath.row].locTitle
  

            return cellProgress
        }
    }
    
    
    
    
    
    @IBOutlet weak var cvProgress: UICollectionView!
    @IBOutlet weak var cvPublished: UICollectionView!
    

    var dbRef : DatabaseReference!
    var images = [LoungeData]()
    
    
    var progressIMG = [LoungeDataProgress]()
    
    
    var customImageFlowLayout: CustomImageFlowLayout!
    var address : [String] = []

    override func viewDidLoad() {
        super.viewDidLoad()
   // let uid = Auth.auth().currentUser?.uid
   dbRef = Database.database().reference().child("OwnerToApp").child("Lounge")
      loadApproved()
      loadPending()
    }
    
    
    func loadPending(){
        let queryref = dbRef.queryOrdered(byChild: "locationStatus").queryEqual(toValue: "Pending")
        queryref.observe(DataEventType.value, with: {(snapshot) in
            var newProgress = [LoungeDataProgress]()
            
            for loungeprogress in snapshot.children {
                
                let progressObject = LoungeDataProgress(snapshot: loungeprogress as! DataSnapshot)
                newProgress.append(progressObject)
            }
            
            self.progressIMG = newProgress
            self.cvProgress.reloadData()
    })
    }
    
    
    var queryref: DatabaseQuery!
    var queryref1: DatabaseQuery!
   func loadApproved(){
    
    let queryref1 = dbRef.queryOrdered(byChild: "locationStatus").queryEqual(toValue: "Approved")
    
        queryref1.observe(DataEventType.value, with: {(snapshot) in
            var newImages = [LoungeData]()
            for loungeDataImages in snapshot.children {
                let loungeObject = LoungeData(snapshot: loungeDataImages as! DataSnapshot)
                newImages.append(loungeObject)
     }
     self.images = newImages
              self.cvPublished.reloadData()
        })
    }
        override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
}
