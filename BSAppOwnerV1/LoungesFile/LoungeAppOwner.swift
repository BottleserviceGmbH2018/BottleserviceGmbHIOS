//
//  LoungeAppOwner.swift
//  BottleServiceApp
//
//  Created by David Olarte on 20/08/2018.
//  Copyright © 2018 Iselacher Digital Media Factory. All rights reserved.
//

import UIKit
import Firebase
import SDWebImage

class LoungeAppOwner: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        
        if collectionView == cvProgress {
            
            
            return Progimages.count
            
        } else {
            
            return Pubimages.count
            
            
            
        }
  
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        
        if collectionView == cvProgress {
            
            
            
            let progressCell = cvProgress.dequeueReusableCell(withReuseIdentifier: "CellProgress", for: indexPath) as! LoungeAppProgCollectionViewCell
            
            let progress = Progimages[indexPath.row]
            progressCell.ProgImageView.sd_setImage(with: URL(string: progress.url), placeholderImage: UIImage(named: "bottle service dave"))
            
            progressCell.lblLocName.text = Progimages[indexPath.row].locTitle
            
            return progressCell
        } else {
            
            
            
            let publishedCell = cvPublish.dequeueReusableCell(withReuseIdentifier: "CellPublished", for: indexPath) as! LoungeAppPubCollectionViewCell
            
            let publish = Pubimages[indexPath.row]
            
            publishedCell.PubImageView.sd_setImage(with: URL(string: publish.url), placeholderImage: UIImage(named: "bottle service dave"))
            
            
            publishedCell.lblLocName.text = Pubimages[indexPath.row].locTitle
            publishedCell.lblAddress.text = Pubimages[indexPath.row].locAdd1
            
            
            
            return publishedCell
        }
        
        
        
        
        
        
    }
    
    
    func checkUserLoggedIn() {
        
        
        let uid = Auth.auth().currentUser?.uid
        
        Database.database().reference().child("users").child(uid!).observeSingleEvent(of: .value , with: {(snapshot) in
            if let dictionary = snapshot.value as? [String: AnyObject]{
                self.lblUser.text = dictionary["email"] as? String
            }
        }, withCancel:nil)
    }
    

    @IBOutlet weak var lblUser: UILabel!
    @IBOutlet weak var cvProgress: UICollectionView!
    @IBOutlet weak var cvPublish: UICollectionView!
    
    
    var Progimages = [LoungeDataProgress]()
    var Pubimages = [LoungeData]()
    
    var dbRef : DatabaseReference!
    
    
    func loadProgress(){
        
        
        let queryRef = dbRef.queryOrdered(byChild: "locationStatus").queryEqual(toValue: "Pending")
        queryRef.observe(DataEventType.value, with: {(snapshot)  in
            var newProgress = [LoungeDataProgress]()
            for LoungeProgress in snapshot.children{
                let progressObj = LoungeDataProgress(snapshot: LoungeProgress as! DataSnapshot)
                newProgress.append(progressObj)
            }
            self.Progimages = newProgress
            self.cvProgress.reloadData()
        })
    }
    
    
    func loadPublished(){
        
        let queryref1 = dbRef.queryOrdered(byChild: "locationStatus").queryEqual(toValue: "Approved")
        queryref1.observe(DataEventType.value, with: {(snapshot) in
            var newImages = [LoungeData]()
            for LoungeDataImage in snapshot.children {
                let publishObj = LoungeData(snapshot: LoungeDataImage as! DataSnapshot)
                newImages.append(publishObj)
            }
            self.Pubimages = newImages
            self.cvPublish.reloadData()
        })
    }
    
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()

        dbRef = Database.database().reference().child("OwnerToApp").child("Lounge")
        loadProgress()
        loadPublished()
        checkUserLoggedIn()
        
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
