//
//  ViewLounges.swift
//  BottleServiceApp
//
//  Created by David Olarte on 22/06/2018.
//  Copyright © 2018 Iselacher Digital Media Factory. All rights reserved.
//

import UIKit
import Firebase
import SDWebImage

class ViewLounges: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return LoungeImages.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = cvLounges.dequeueReusableCell(withReuseIdentifier: "CellLounges", for: indexPath) as! ViewLoungesCollectionViewCell
        
        
        
        let image = LoungeImages[indexPath.row]
        
        
        cell.lblLocatioNam.text = LoungeImages[indexPath.row].locTitle
        cell.lblLocationAdd.text = LoungeImages[indexPath.row].locAdd1
        cell.lblLocType.text = LoungeImages[indexPath.row].locType
        cell.LoungeImageView.sd_setImage(with: URL(string: image.url), placeholderImage: UIImage(named: "bottle service dave"))
    return cell
    }

    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
       
        let vs = storyboard?.instantiateViewController(withIdentifier: "ViewBarLoungeEvent") as? ViewBarLoungeEvent
        
  
            vs?.locTitle = LoungeImages[indexPath.row].locTitle
            vs?.locType = LoungeImages[indexPath.row].locType
        self.cvLounges.reloadData()
        self.cvLounges.allowsMultipleSelection = true
            self.present(vs!, animated: true)
            
    }
    
 
    
    var dbRef: DatabaseReference!
    
    
  func  loadImages (){
    
    
    
    dbRef.observe(DataEventType.value, with: {( snapshot) in
        
        var newImages = [LoadViewOnLounge]()
        
        for ViewLoungeSnap in snapshot.children  {
        
            
            let ViewInstaObject = LoadViewOnLounge(snapshot: ViewLoungeSnap as! DataSnapshot)
            
            newImages.append(ViewInstaObject)
            
            
        }
        self.LoungeImages = newImages
        
        self.cvLounges.reloadData()
        
    })


    }
    

    var LoungeImages = [LoadViewOnLounge]()
    @IBOutlet weak var cvLounges: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
  dbRef = Database.database().reference().child("OwnerToApp").child("Lounge")
        loadImages()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
