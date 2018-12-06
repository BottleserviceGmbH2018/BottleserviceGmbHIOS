//
//  ProgressCollectionViewCell.swift
//  BottleServiceApp
//
//  Created by David Olarte on 17.05.18.
//  Copyright © 2018 Iselacher Digital Media Factory. All rights reserved.
//

import UIKit

class ProgressCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var ProgressImage: UIImageView!
    @IBOutlet weak var lblTitle: UILabel!
    
    
    
    override func prepareForReuse() {
        super.prepareForReuse()
        self.ProgressImage.image = nil  
    }
}
