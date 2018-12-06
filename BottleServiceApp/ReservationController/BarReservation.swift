//
//  BarReservation.swift
//  BottleServiceApp
//
//  Created by David Olarte on 14/06/2018.
//  Copyright © 2018 Iselacher Digital Media Factory. All rights reserved.
//

import UIKit
import Firebase
import SDWebImage

class BarReservation: UIViewController, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return images.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    
        let cell = cvBar.dequeueReusableCell(withReuseIdentifier: "CellBar", for: indexPath) as! BarReservationCollectionViewCell
        
        
        let image = images[indexPath.row]
     //   cell.BarImageView.image = image;
        
        
       cell.BarImageView.sd_setImage(with: URL(string: image.url), placeholderImage: UIImage(named: "bottle service dave"))

       cell.lblLocName.text = images[indexPath.row].locTitle
        return cell
        
        
    }
    
    func loadImage (){
        
        dbRef.observe(DataEventType.value, with: {(snapshot) in
            var newImages = [LoadDataOnBarReservation]()
            
            for BarResSnapshot in snapshot.children {
                let BarResObj = LoadDataOnBarReservation(snapshot: BarResSnapshot as! DataSnapshot)
                newImages.append(BarResObj)
            }
            self.images = newImages
            self.cvBar.reloadData()
        })
    
    }

    var dbRef : DatabaseReference!
    var images = [LoadDataOnBarReservation]()
    @IBOutlet weak var cvBar: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        let uid = Auth.auth().currentUser?.uid
        dbRef = Database.database().reference().child("Reservation_OwnerSide").child(uid!).child("Bar")
        loadImage()

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
