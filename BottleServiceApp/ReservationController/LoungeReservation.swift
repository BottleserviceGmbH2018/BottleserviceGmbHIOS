//
//  LoungeReservation.swift
//  BottleServiceApp
//
//  Created by David Olarte on 14/06/2018.
//  Copyright © 2018 Iselacher Digital Media Factory. All rights reserved.
//

import UIKit
import Firebase
import SDWebImage


class LoungeReservation: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return images.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = cvLounge.dequeueReusableCell(withReuseIdentifier: "CellLounge", for: indexPath) as! LoungeReservationCollectionViewCell
        
        let image = images[indexPath.row]
    
        cell.LoungeImage.sd_setImage(with: URL(string: image.url), placeholderImage: UIImage(named: "bottle service dave"))
     //   cell.LoungeImage.image = image;
        
        cell.lblLocName.text = images[indexPath.row].locTitle
        cell.lblNmae.text = images[indexPath.row].username
        cell.lblAddress.text = images[indexPath.row].resdate
        
        return cell
        
    }
    
    

    
    var queryLounge: DatabaseQuery!
    var dbRef: DatabaseReference!
  var images = [LoadDataOnLoungeReservation]()
    
    func loadImage()
    {
        dbRef.observe(DataEventType.value, with: { (snapshot) in
            var newImages = [LoadDataOnLoungeReservation]()
            
            for LoungeResSnapshot in snapshot.children {
                let LoungeResObj = LoadDataOnLoungeReservation(snapshot: LoungeResSnapshot as! DataSnapshot)
                newImages.append(LoungeResObj)
            }
            self.images = newImages
            
            self.cvLounge.reloadData()
        })
        
        
    }
    
    func loadImages()
    {
        
        let queryLounge = dbRef.queryOrdered(byChild: "status").queryEqual(toValue: "Waiting for approval")
        
        queryLounge.observe(DataEventType.value, with: {(snapshot) in
            
            var newImages = [LoadDataOnLoungeReservation]()
            for LoungeResSnapshot in snapshot.children {
                let LoungeResObj = LoadDataOnLoungeReservation(snapshot: LoungeResSnapshot as! DataSnapshot)
                newImages.append(LoungeResObj)
            }
            
            self.images = newImages
            
            self.cvLounge.reloadData()
            self.cvLounge.delegate = self
            self.cvLounge.dataSource = self
            
        })
        
        
        
        
    }
    
    
    
    
    @IBOutlet weak var cvLounge: UICollectionView!
    override func viewDidLoad() {   
        super.viewDidLoad()
        
        
        
           //databaseRef.child("OwnerToApp").child("Lounge").queryOrdered(byChild: "locationTitle")
      let uid = Auth.auth().currentUser?.uid
        dbRef = Database.database().reference().child("Reservation_OwnerSide").child(uid!).child("Lounge")                                                                                                                                                                                                                                                                            
        loadImages()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

  

}
