//
//  LocationEvent.swift
//  BottleServiceApp
//
//  Created by David Olarte on 17.05.18.
//  Copyright © 2018 Iselacher Digital Media Factory. All rights reserved.
//

import UIKit
import Firebase

class LocationEvent: UIViewController, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == cvProgress{
            return progressData.count
        } else  {
            return publishedData.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cellProgress = cvProgress.dequeueReusableCell(withReuseIdentifier: "CellProgress", for: indexPath) as! ProgressEventCollectionViewCell
        
        let progress = progressData[indexPath.row]
        
        //cellProgress.LoungeImageView.sd_setImage(with: URL(string: image.url), placeholderImage: UIImage(named: "bottle service dave"))
        return cellProgress
    }
    
    
    var progressData = [UIImage]()
    var publishedData = [UIImage]()

    @IBOutlet weak var cvPublished: UICollectionView!
    @IBOutlet weak var cvProgress: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    
    }
    


}
