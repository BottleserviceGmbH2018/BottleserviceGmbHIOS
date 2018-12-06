 //
//  LoungeAppProgCollectionViewCell.swift
//  BottleServiceApp
//
//  Created by David Olarte on 20/08/2018.
//  Copyright © 2018 Iselacher Digital Media Factory. All rights reserved.
//

import UIKit

class LoungeAppProgCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var ProgImageView: UIImageView!
    @IBOutlet weak var lblLocName: UILabel!
    
    
    override func prepareForReuse() {
        super.prepareForReuse()
        self.ProgImageView.image = nil
    }
 }
