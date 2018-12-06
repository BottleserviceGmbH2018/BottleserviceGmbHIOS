//
//  Setvenue2.swift
//  BottleServiceApp
//
//  Created by David Olarte on 11.04.18.
//  Copyright © 2018 Iselacher Digital Media Factory. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth
import FirebaseStorage
import FirebaseDatabase
import SDWebImage

class Setvenue2: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return images.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = imageCollection.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! ImageCollectionViewCells
        
        let image = images[indexPath.row]
        
        
        cell.imageView.sd_setImage(with: URL(string: image.url), placeholderImage: UIImage(named: "bottle service dave"))
        
        cell.lblSpecTitle.text = images[indexPath.row].specTitle
        cell.txtViewSpecDetails.text = images[indexPath.row].specDetails
        

        
        return cell
        
    }
    
    
    var dbRef: DatabaseReference!
    
    
    
    @IBOutlet weak var imageCollection: UICollectionView!
    
var images = [LoadDataOnSpecific]()
    var locTitle : String = ""
    var locType : String = ""

    @IBOutlet weak var lblLocType: UILabel!
    
    @IBOutlet weak var lblLoc: UILabel!
    @IBOutlet weak var tableview: UITableView!
    

    var list: [String] = []
    var handle:DatabaseHandle?
    var ref: DatabaseReference!
    
    
    override func  prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        if segue.destination is Setvenue3
        {
            let vs = segue.destination as? Setvenue3
        vs?.locTitle = lblLoc.text!
        vs?.locType = lblLocType.text!
        } else if segue.destination is Setvenue5 {
            
            let vs = segue.destination as? Setvenue5
            vs?.locTitle = lblLoc.text!
            vs?.locType = lblLocType.text!
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
       let uid = Auth.auth().currentUser?.uid
        
      dbRef = Database.database().reference().child("Location_Specific").child(locType).child(uid!).child(locTitle)
        
       // dbRef = Database.database().reference().child("Location_Specific").child(locType).child(locTitle)
        lblLoc.text = locTitle
        lblLocType.text = locType
    
        loadImages()
    }

    
    
    func loadImages() {
        
        dbRef.observe(DataEventType.value, with: {(snapshot) in
            
            var newImages = [LoadDataOnSpecific]()
            
            for SpecificSnapshot in snapshot.children {
                
                let SpecObject = LoadDataOnSpecific(snapshot: SpecificSnapshot as! DataSnapshot)
                newImages.append(SpecObject)
            }
            self.images = newImages
            self.imageCollection.reloadData()
        })
   }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()

    }
    


}
