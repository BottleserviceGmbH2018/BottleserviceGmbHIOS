//
//  LoungeAppPubCollectionViewCell.swift
//  BottleServiceApp
//
//  Created by David Olarte on 20/08/2018.
//  Copyright © 2018 Iselacher Digital Media Factory. All rights reserved.
//

import UIKit

class LoungeAppPubCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var PubImageView: UIImageView!
    @IBOutlet weak var lblLocName: UILabel!
    @IBOutlet weak var lblAddress: UILabel!
    
    override func prepareForReuse() {
        super.prepareForReuse()
        self.PubImageView.image = nil
    }
}
