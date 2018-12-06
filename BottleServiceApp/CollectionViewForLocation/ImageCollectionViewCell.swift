//
//  ImageCollectionViewCell.swift
//  BottleServiceApp
//
//  Created by David Olarte on 09.05.18.
//  Copyright © 2018 Iselacher Digital Media Factory. All rights reserved.
//

import UIKit

class ImageCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var lblAddress: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var lblTitle: UILabel!
    
    
    override func prepareForReuse() {
        super.prepareForReuse()
        self.imageView.image = nil

    }
}
