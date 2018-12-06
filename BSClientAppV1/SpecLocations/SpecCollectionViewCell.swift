//
//  SpecCollectionViewCell.swift
//  BSClientAppV1
//
//  Created by David Olarte on 31.05.18.
//  Copyright © 2018 Iselacher Digital Media Factory. All rights reserved.
//

import UIKit

class SpecCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var specSlider: UIImageView!
    @IBOutlet weak var lblSpectitle: UILabel!
    @IBOutlet weak var lblSpecDesc: UILabel!
    @IBOutlet weak var lblSpecGuest: UILabel!
    @IBOutlet weak var lblSpecCost: UILabel!
    
    @IBOutlet weak var btnRequest: UIButton!
    
    override func prepareForReuse() {
        
        super.prepareForReuse()
        self.specSlider.image = nil
        self.lblSpecGuest.sizeToFit()
    }
    
}
