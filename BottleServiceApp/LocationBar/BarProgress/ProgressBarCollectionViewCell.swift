//
//  ProgressCollectionViewCell.swift
//  BottleServiceApp
//
//  Created by David Olarte on 17.05.18.
//  Copyright © 2018 Iselacher Digital Media Factory. All rights reserved.
//

import UIKit

class ProgressBarCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var lblTitle: UILabel!
    
    @IBOutlet weak var ProgressImageView: UIImageView!
    
    override func prepareForReuse() {
        super.prepareForReuse()
        self.ProgressImageView.image = nil
        
    }
}
