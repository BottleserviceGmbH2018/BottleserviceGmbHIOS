//
//  UnregisteredBarOwner.swift
//  BottleServiceApp
//
//  Created by David Olarte on 18/09/2018.
//  Copyright © 2018 Iselacher Digital Media Factory. All rights reserved.
//

import UIKit
import Firebase

class UnregisteredBarOwner: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return Unreg.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = cvBar.dequeueReusableCell(withReuseIdentifier: "CellUnregistered", for: indexPath) as! UnregisteredBarCollectionViewCell
        
        let unregdata = Unreg[indexPath.row]
        
        cell.UnRegBarImage.sd_setImage(with: URL(string: unregdata.url), placeholderImage: UIImage(named: "bottle service dave"))
        
        
        cell.lblAddress.text = Unreg[indexPath.row].locAddress
        cell.lblStatus.text = Unreg[indexPath.row].locStatus
        cell.lblTitle.text = Unreg[indexPath.row].loctitle
        cell.lblLoc.text = Unreg[indexPath.row].locType
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
            self.cvBar.reloadData()
            
            
            
            
        })
    }
    
    @IBOutlet weak var cvBar: UICollectionView!
    
    var refer: DatabaseReference!
    var queryref: DatabaseReference!
    var handle: DatabaseHandle!
    var refer1: DatabaseReference!
    var Unreg = [LoadUnReg]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        refer = Database.database().reference().child("OwnerToApp").child("Bar")
        // Do any additional setup after loading the view.
        loadImage()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

 

}
