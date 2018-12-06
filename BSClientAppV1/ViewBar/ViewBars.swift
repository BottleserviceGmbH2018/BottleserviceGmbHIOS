//
//  ViewBars.swift
//  BottleServiceApp
//
//  Created by David Olarte on 17/09/2018.
//  Copyright © 2018 Iselacher Digital Media Factory. All rights reserved.
//

import UIKit
import Firebase

class ViewBars: UIViewController, UICollectionViewDelegate , UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return BarImages.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = cvBars.dequeueReusableCell(withReuseIdentifier: "CellBars", for: indexPath) as! ViewBarsCollectionViewCell
        
        let image = BarImages[indexPath.row]
        
        cell.lblLocName.text = BarImages[indexPath.row].locTitle
        cell.lblLocAddress.text = BarImages[indexPath.row].locAdd1
        
        cell.BarImageView.sd_setImage(with: URL(string: image.url), placeholderImage: UIImage(named: "bottle service dave"))
        return cell
    }
    
    
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let vs = storyboard?.instantiateViewController(withIdentifier: "ViewBarLoungeEvent") as? ViewBarLoungeEvent
        
        
        vs?.locTitle = BarImages[indexPath.row].locTitle
        vs?.locType = BarImages[indexPath.row].locType
        self.cvBars.reloadData()
        self.cvBars.allowsMultipleSelection = true
        self.present(vs!, animated: true)
        
    }
    
    @IBOutlet weak var cvBars: UICollectionView!
    
    
    func loadImages(){
        
        
        dbRef.observe(DataEventType.value, with: {( snapshot ) in
            
            
            var newImages = [LoadViewOnLounge]()
            
            for ViewBarSnap in snapshot.children {
                
                let ViewInsraObject =  LoadViewOnLounge(snapshot: ViewBarSnap as! DataSnapshot)
                newImages.append(ViewInsraObject)
                
                
            }
            
            self.BarImages = newImages
            self.cvBars.reloadData()
            
            
            
        })
    
        
        
    }
 
    
    
    var BarImages = [LoadViewOnLounge]()
    var dbRef: DatabaseReference!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        dbRef = Database.database().reference().child("OwnerToApp").child("Bar")
        loadImages()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

  

}
