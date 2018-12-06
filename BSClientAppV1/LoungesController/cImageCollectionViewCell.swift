//
//  ImageCollectionViewCell.swift
//  BSClientAppV1
//
//  Created by David Olarte on 10.05.18.
//  Copyright © 2018 Iselacher Digital Media Factory. All rights reserved.
//

import UIKit

class cImageCollectionViewCell: UICollectionViewCell, UICollectionViewDelegate{
    
    @IBOutlet weak var LoungeImageView: UIImageView!
    @IBOutlet weak var lblLounges: UILabel!
    @IBOutlet weak var lblAddress: UILabel!
    @IBOutlet weak var lblSched: UILabel!
    
    @IBOutlet weak var lbluid: UILabel!
    
    
    override func prepareForReuse() {
        super.prepareForReuse()
        self.LoungeImageView.image = nil
     
    }
 
}
