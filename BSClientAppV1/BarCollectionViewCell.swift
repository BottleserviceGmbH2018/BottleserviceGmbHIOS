//
//  BarCollectionViewCell.swift
//  BSClientAppV1
//
//  Created by David Olarte on 14.05.18.
//  Copyright © 2018 Iselacher Digital Media Factory. All rights reserved.
//

import UIKit

class BarCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var barImage: UIImageView!
    @IBOutlet weak var lblAddress: UILabel!
    @IBOutlet weak var lblLocName: UILabel!
    @IBOutlet weak var lblSchedule: UILabel!
    @IBOutlet weak var lblLocType: UILabel!
    
    @IBOutlet weak var lbllocuid: UILabel!
    override func prepareForReuse() {
        super.prepareForReuse()
        self.barImage.image = nil
        
    }
}
