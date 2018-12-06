//
//  ViewBarLoungeEvent.swift
//  BSClientAppV1
//
//  Created by David Olarte on 28.05.18.
//  Copyright © 2018 Iselacher Digital Media Factory. All rights reserved.
//

import UIKit
import Firebase
import SDWebImage

class ViewBarLoungeEvent: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return SpecImage.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = cvLocSpec.dequeueReusableCell(withReuseIdentifier: "cellSpec", for: indexPath) as! SpecCollectionViewCell
        let image = SpecImage[indexPath.row]
        cell.specSlider.sd_setImage(with: URL(string: image.url), placeholderImage: UIImage(named: "bottle service dave"))
        cell.lblSpectitle.text = SpecImage[indexPath.row].specTitle
        cell.lblSpecDesc.text = SpecImage[indexPath.row].specDesc
        cell.lblSpecCost.text = SpecImage[indexPath.row].specCost
        cell.lblSpecGuest.text = SpecImage[indexPath.row].specGuest
        
        specTitle = SpecImage[indexPath.row].specTitle
        
        specDesc = SpecImage[indexPath.row].specDesc
        specGuest =  SpecImage[indexPath.row].specGuest
        specPrice = SpecImage[indexPath.row].specCost
        
   return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let vs = storyboard?.instantiateViewController(withIdentifier: "PayAndReview") as? PayAndReview
        

            vs?.specTitle = SpecImage[indexPath.row].specTitle
            vs?.specDesc = SpecImage[indexPath.row].specDesc
            vs?.specGuest = SpecImage[indexPath.row].specGuest
            vs?.specPrice = SpecImage[indexPath.row].specCost
            vs?.locTitle = SpecImage[indexPath.row].specLoc
            vs?.loctype = lblLocType.text!
            vs?.ownerID = lbluid.text!
            self.cvLocSpec.reloadData()
            self.cvLocSpec.allowsMultipleSelection = true
            
            
            
            
            self.present(vs!, animated: true)
            
       
    }

    
    
    
    @IBOutlet weak var lblLocType: UILabel!
    @IBOutlet weak var ImageSlider: UIImageView!
    @IBOutlet weak var lblName: UITextView!
    @IBOutlet weak var cvLocSpec: UICollectionView!
    @IBOutlet weak var lblAddress: UITextView!
    @IBOutlet weak var lblAD1: UILabel!
    @IBOutlet weak var lblCity: UILabel!
    var imgSlider = UIImage()
    var locTitle = ""
    var locType = ""
    var specTitle = ""
    var specDesc = ""
    var specGuest = ""
    var specPrice = ""
    var locuid = ""
    var SpecImage = [LoadOnSpec]()
    
    var locName = ""
    var dbRefBar: DatabaseReference!
    var dbRefLounge: DatabaseReference!
    
    func checkBar(){
        let loctitle = lblName.text
        print(loctitle!)
        // let uid = Auth.auth().currentUser?.uid
        Database.database().reference().child("OwnerToApp").child("Bar").child(loctitle!).observeSingleEvent(of: .value, with: {(snapshot) in
            if let dictionary = snapshot.value as? [String: AnyObject]{
                //self.lblAddress.text = dictionary["locationAdd1"] as? String
                self.lblCity.text = dictionary["locationCity"] as? String
                self.lblAD1.text = dictionary["locationAdd1"] as? String
                self.ImageSlider.image = dictionary["locationSlider"] as? UIImage
                let two = self.lblAD1.text! + " , " + self.lblCity.text!
                self.lblAddress.text! = two
            }
        }, withCancel:nil)
    }
    
    
    
    
    func loadImageBar(){
        let loctitle = lblName.text
        let ref = Database.database().reference()
        // let uid = Auth.auth().currentUser?.uid
        let usersRef = ref.child("OwnerToApp").child("Bar").child(loctitle!)
        usersRef.observeSingleEvent(of: .value, with: { snapshot in
            if !snapshot.exists() {
                return
            }
            let userInfo = snapshot.value as! NSDictionary
            print(userInfo)
            print(userInfo["locationTitle"]!)
            let imgSld = userInfo["locationSlider"] as! String
            print(imgSld)
            let storageRef = Storage.storage().reference(forURL: imgSld)
            storageRef.downloadURL(completion: {(url, error) in
                let data = try? Data(contentsOf: url!)
                let image = UIImage(data: data! as Data)
                self.ImageSlider.image = image
            })
        })
    }
    func loadImageonSpecBar() {
        dbRefBar.observe(DataEventType.value, with: {(snapshot) in
            var newImages = [LoadOnSpec]()
            for loadonSpec in snapshot.children {
                let specObject = LoadOnSpec(snapshot: loadonSpec as! DataSnapshot)
                newImages.append(specObject)
            }
            self.SpecImage = newImages
            self.cvLocSpec.reloadData()
        })
    }
    
    
    @IBOutlet weak var lbluid: UILabel!
    
    func checkLounge(){
        let loctitle = lblName.text
        print(loctitle!)
        // let uid = Auth.auth().currentUser?.uid
        Database.database().reference().child("OwnerToApp").child("Lounge").child(loctitle!).observeSingleEvent(of: .value, with: {(snapshot) in
            if let dictionary = snapshot.value as? [String: AnyObject]{
                //self.lblAddress.text = dictionary["locationAdd1"] as? String
                self.lblCity.text = dictionary["locationCity"] as? String
                self.lblAD1.text = dictionary["locationAdd1"] as? String
           
                //self.lbluid.text = dictionary["ownerUserID"] as? String
                self.ImageSlider.image = dictionary["locationSlider"] as? UIImage
                let two = self.lblAD1.text! + " , " + self.lblCity.text!
                self.lblAddress.text! = two
            }
        }, withCancel:nil)
    }
    
    func loadImageLounge(){
        let loctitle = lblName.text
        let ref = Database.database().reference()
        // let uid = Auth.auth().currentUser?.uid
        let usersRef = ref.child("OwnerToApp").child("Lounge").child(loctitle!)
        usersRef.observeSingleEvent(of: .value, with: { snapshot in
            if !snapshot.exists() {
                return
            }
            let userInfo = snapshot.value as! NSDictionary
            print(userInfo)
            print(userInfo["locationTitle"]!)
            let imgSld = userInfo["locationSlider"] as! String
            print(imgSld)
            let storageRef = Storage.storage().reference(forURL: imgSld)
            storageRef.downloadURL(completion: {(url, error) in
                let data = try? Data(contentsOf: url!)
                let image = UIImage(data: data! as Data)
                self.ImageSlider.image = image
            })
        })
    }
    func loadImageonSpecLounge() {
        dbRefLounge.observe(DataEventType.value, with: {(snapshot) in
            var newImages = [LoadOnSpec]()
            for loadonSpec in snapshot.children {
                let specObject = LoadOnSpec(snapshot: loadonSpec as! DataSnapshot)
                newImages.append(specObject)
            }
            self.SpecImage = newImages
            self.cvLocSpec.reloadData()
        })
    }
 func loadData(){
        if lblLocType.text == "Bar" {
            checkBar()
            loadImageBar()
            loadImageonSpecBar()

        } else if lblLocType.text == "Lounge" {
            checkLounge()
            loadImageLounge()
            loadImageonSpecLounge()
        } else if lblLocType.text == "Event" {
            checkLounge()
            loadImageLounge()
            loadImageonSpecLounge()
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        if segue.destination is ZoomInZoomOut
        {
            let vc = segue.destination as? ZoomInZoomOut
            vc?.locType = lblLocType.text!
            vc?.locName = lblName.text!
        }
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        lblLocType.text = locType
        lblName.text = locTitle
        lbluid.text = locuid
dbRefBar = Database.database().reference().child("Location_Specific").child("Bar").child(lbluid.text!).child(locTitle)
        dbRefLounge  = Database.database().reference().child("Location_Specific").child("Lounge").child(locuid).child(locTitle)

    loadData()
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
