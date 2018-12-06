//
//  ZoomInZoomOut.swift
//  BottleServiceApp
//
//  Created by David Olarte on 02/08/2018.
//  Copyright © 2018 Iselacher Digital Media Factory. All rights reserved.
//

import UIKit
import Firebase

class ZoomInZoomOut: UIViewController , UIScrollViewDelegate{

    var dbRefBar: DatabaseReference!
    var dbRefLounge: DatabaseReference!
    var locName :String = ""
    var locType :String = ""
    
    @IBOutlet weak var lblLocType: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var scrollVIew: UIScrollView!
    @IBOutlet weak var lblLocTitle: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        lblLocType.text = locType
        lblLocTitle.text = locName
        lblLocTitle.isHidden = true
        lblLocType.isHidden = true
        
        dbRefBar = Database.database().reference().child("Location_Specific").child("Bar").child(locName)
        dbRefLounge  = Database.database().reference().child("Location_Specific").child("Lounge").child(locName)
        
        loadData()
        scrollVIew.minimumZoomScale = 1.0
        scrollVIew.maximumZoomScale = 6.0
      scrollVIew.delegate = self //- it is set on the storyboard.
        // Do any additional setup after loading the view.
    }
    
    
    
    func loadImageBar(){
        let loctitle = lblLocTitle.text
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
                self.imageView.image = image
            })
        })
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        if segue.destination is ViewBarLoungeEvent
        {
            let vc = segue.destination as? ViewBarLoungeEvent
            vc?.locTitle = lblLocTitle.text!
            vc?.locType = lblLocType.text!
        }
        
    }

    func loadImageLounge(){
        let loctitle = lblLocTitle.text
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
                self.imageView.image = image
            })
        })
    }
    
    func loadData(){
        if lblLocType.text == "Bar" {
    
            loadImageBar()
       
            
        } else if lblLocType.text == "Lounge" {
            
            loadImageLounge()
            
        } else if lblLocType.text == "Event" {
           
            loadImageLounge()
         
        }
    }

    
    
    
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        
        return imageView
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}
