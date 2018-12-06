//
//  ImageCollectionViewCell.swift
//  BottleServiceApp
//
//  Created by David Olarte on 31/07/2018.
//  Copyright © 2018 Iselacher Digital Media Factory. All rights reserved.
//

import UIKit

class ImageCollectionViewCells: UICollectionViewCell {
    
    @IBOutlet weak var lblSpecTitle: UILabel!
    @IBOutlet weak var txtViewSpecDetails: UITextView!
    @IBOutlet weak var imageView: UIImageView!
    
    override func prepareForReuse() {
         super.prepareForReuse()
        self.imageView.image = nil
    }
}
