//
//  AppBarCollectionViewCell.swift
//  BottleServiceApp
//
//  Created by David Olarte on 16/08/2018.
//  Copyright © 2018 Iselacher Digital Media Factory. All rights reserved.
//

import UIKit

class AppBarCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var ProgImageView: UIImageView!
    @IBOutlet weak var lblLocName: UILabel!
    
    
    
    
    override func prepareForReuse() {
        super.prepareForReuse()
        self.ProgImageView.image = nil
    }
}
