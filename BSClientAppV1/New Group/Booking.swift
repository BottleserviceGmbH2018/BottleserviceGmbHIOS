//
//  Booking.swift
//  BSClientAppV1
//
//  Created by David Olarte on 02.06.18.
//  Copyright © 2018 Iselacher Digital Media Factory. All rights reserved.
//

import UIKit
import Firebase
import SDWebImage

class Booking: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return BookImage.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = cvBooking.dequeueReusableCell(withReuseIdentifier: "CellBookings", for: indexPath) as! BookingCollectionViewCell
        
        let image = BookImage[indexPath.row]
        cell.BookImage.sd_setImage(with: URL(string: image.url), placeholderImage: UIImage(named: "bottle service dave"))
        
        
        //  cell.lblSpecGuest.text = SpecImage[indexPath.row].specGuest
        cell.lblLocName.text = BookImage[indexPath.row].locname
        cell.lblSpecTitle.text = BookImage[indexPath.row].specName
        cell.lblPaymentStatus.text = BookImage[indexPath.row].payment
        cell.lblApproval.text = BookImage[indexPath.row].status
        cell.schedule.text = BookImage[indexPath.row].resDate
        
        return cell
    }
    var menuShowing = true
    @IBAction func btnShow(_ sender: Any) {
        
        if (menuShowing) {
            leadingConstraint.constant  = 0
            UIView.animate(withDuration: 0.3, animations: {
                self.view.layoutIfNeeded()
            })
        } else  {
            leadingConstraint.constant = -265
            UIView.animate(withDuration: 0.3, animations: {
                self.view.layoutIfNeeded()
            })
            
            
            
        }
        
        menuShowing = !menuShowing
    }
    
    func loadData(){
        
        
      //  let queryLounge = dbRef.queryOrdered(byChild: "name").queryEqual(toValue: "David Olarte")
        
        
        
        dbRef.observe(DataEventType.value, with: {(snapshot) in
            var newImags = [LoadBook]()
            
            for bookimg in snapshot.children {
                let bookObject = LoadBook(snapshot: bookimg as! DataSnapshot)
                newImags.append(bookObject)
                
            }
            self.BookImage = newImags
            self.cvBooking.reloadData()
            self.cvBooking.delegate = self
            self.cvBooking.dataSource = self
            
        })
    }
    @IBOutlet weak var menuVIew: UIView!
    @IBOutlet weak var leadingConstraint: NSLayoutConstraint!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let uid = Auth.auth().currentUser?.uid
        leadingConstraint.constant  = -265
        dbRef = Database.database().reference().child("Reservation_Status").child(uid!)
        checkifuserLoggedIn()
        loadData()
        print("xxc")
        
    }
    
    @IBOutlet weak var lbluserName: UILabel!
    @IBAction func btnBooking(_ sender: Any) {
        
        if (menuShowing) {
            leadingConstraint.constant  = 0
            UIView.animate(withDuration: 0.3, animations: {
                self.view.layoutIfNeeded()
            })
        } else  {
            leadingConstraint.constant = -265
            UIView.animate(withDuration: 0.3, animations: {
                self.view.layoutIfNeeded()
            })
        }
        
        menuShowing = !menuShowing
        
        
    }
    
    func checkifuserLoggedIn(){
        
        let uid = Auth.auth().currentUser?.uid
        Database.database().reference().child("users").child(uid!).observeSingleEvent(of: .value, with: {(snapshot) in
            
            if let dictionary = snapshot.value as? [String: AnyObject]{
                //  self.lblUser.text = dictionary["email"] as? String
                // self.lblName.text = dictionary["name"] as? String
                self.lbluserName.text = dictionary["name"] as? String
                
                
                //  self.profilepic()
            }
        }, withCancel:nil)
        
    }
    
    
    
    
    var BookImage =  [LoadBook]()
    var dbRef: DatabaseReference!
    var queryLounge: DatabaseQuery!
    
    @IBOutlet weak var cvBooking: UICollectionView!
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
}
