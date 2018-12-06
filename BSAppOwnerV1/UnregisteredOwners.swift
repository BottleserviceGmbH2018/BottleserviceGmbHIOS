//
//  UnregisteredOwners.swift
//  BSAppOwnerV1
//
//  Created by David Olarte on 22.05.18.
//  Copyright © 2018 Iselacher Digital Media Factory. All rights reserved.
//

import UIKit
import Firebase
import SDWebImage
import FirebaseDatabase
import FirebaseStorage
import FirebaseAuth

class UnregisteredOwners: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate
{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return Unreg.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = cvUnregistered.dequeueReusableCell(withReuseIdentifier: "CellUnregistered", for: indexPath) as! UnregisteredCollectionViewCell
        
        let unregdata = Unreg[indexPath.row]
        
        cell.ImageView.sd_setImage(with: URL(string: unregdata.url), placeholderImage: UIImage(named: "bottle service dave"))
       
        cell.lblAddress.text = Unreg[indexPath.row].locAddress
        cell.lblStatus.text = Unreg[indexPath.row].locStatus
        cell.lblTitle.text = Unreg[indexPath.row].loctitle
        cell.lblTypeOfLoc.text = Unreg[indexPath.row].locType
        cell.lblDateApplied.text = Unreg[indexPath.row].locDate
        cell.lblOwnerName.text = Unreg[indexPath.row].locOwner
        
        
        return cell
    }
    
   
    func loadImage(){
        
    let queryref = refer.queryOrdered(byChild: "locationStatus").queryEqual(toValue: "Pending")
        queryref.observe(DataEventType.value, with: {(snapshot) in
    

        
    
            var UnReg = [LoadUnReg]()
            for UnregImageObject in snapshot.children {
                let unregObj = LoadUnReg(snapshot: UnregImageObject as! DataSnapshot)
                UnReg.append(unregObj)
            }
            self.Unreg = UnReg
            self.cvUnregistered.reloadData()

    
    
        
    }
    
    )}

    func loadImage1(){
 
        handle = refer1?.observe(DataEventType.value, with: {(snapshot) in
            
         
                if snapshot.value as? String == "Pending" {
                    print(snapshot)
                    var UnReg = [LoadUnReg]()
                    for UnregImageObject in snapshot.children {
                        let unregObj = LoadUnReg(snapshot: UnregImageObject as! DataSnapshot)
                        UnReg.append(unregObj)
                    }
                    self.Unreg = UnReg
                    self.self.cvUnregistered.reloadData()
                }
                    
             
            }
            
      
    )}


    
    
    @IBAction func btnApproved(_ sender: Any) {
 }
        
  

    var refer: DatabaseReference!
    var queryref : DatabaseQuery!
    var handle: DatabaseHandle!
    var refer1: DatabaseReference!
    var Unreg = [LoadUnReg]()

   
  
    @IBOutlet weak var cvUnregistered: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        refer = Database.database().reference().child("OwnerToApp").child("Lounge")
    
            //print(queryref)
            //.queryEqual(toValue: "Pending", childKey: "locationStatus") as! DatabaseReference
       // refer1 = Database.database().reference().child("Location_ReqAPP").child("Bar")
    loadImage()
   // loadImage1()
        
// let uid = Auth.auth().currentUser?.uid
  
        
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()

    }
    


}
