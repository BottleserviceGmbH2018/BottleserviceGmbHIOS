//
//  AppBarPubCollectionViewCell.swift
//  BottleServiceApp
//
//  Created by David Olarte on 16/08/2018.
//  Copyright © 2018 Iselacher Digital Media Factory. All rights reserved.
//

import UIKit

class AppBarPubCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var PubImageView: UIImageView!
    @IBOutlet weak var lblLocName: UILabel!
    @IBOutlet weak var lblLocAdd: UILabel!
    override func prepareForReuse() {
        super.prepareForReuse()
      self.PubImageView.image = nil
    }
}
