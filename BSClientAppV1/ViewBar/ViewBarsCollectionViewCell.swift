//
//  ViewBarsCollectionViewCell.swift
//  BottleServiceApp
//
//  Created by David Olarte on 18/09/2018.
//  Copyright © 2018 Iselacher Digital Media Factory. All rights reserved.
//

import UIKit

class ViewBarsCollectionViewCell: UICollectionViewCell {
    
    
    
    @IBOutlet weak var BarImageView: UIImageView!
    
    @IBOutlet weak var lblLocName: UILabel!
    
    @IBOutlet weak var lblLocAddress: UILabel!
    @IBOutlet weak var lblSched: UILabel!
    
    
    
    override func prepareForReuse() {
        super.prepareForReuse()
        self.BarImageView.image = nil 
    }
    
}
