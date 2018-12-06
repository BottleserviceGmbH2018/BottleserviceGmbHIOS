//
//  BarReservationCollectionViewCell.swift
//  BottleServiceApp
//
//  Created by David Olarte on 14/06/2018.
//  Copyright © 2018 Iselacher Digital Media Factory. All rights reserved.
//

import UIKit
import Firebase



class BarReservationCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var BarImageView: UIImageView!
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblLocName: UILabel!
    
    override func prepareForReuse() {
        super.prepareForReuse()
        self.BarImageView.image = nil
    }
}
