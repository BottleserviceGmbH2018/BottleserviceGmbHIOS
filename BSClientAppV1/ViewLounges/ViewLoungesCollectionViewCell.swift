//
//  ViewLoungesCollectionViewCell.swift
//  BottleServiceApp
//
//  Created by David Olarte on 22/06/2018.
//  Copyright © 2018 Iselacher Digital Media Factory. All rights reserved.
//

import UIKit

class ViewLoungesCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var LoungeImageView: UIImageView!
    
    @IBOutlet weak var lblLocatioNam: UILabel!
    @IBOutlet weak var lblLocationAdd: UILabel!
    @IBOutlet weak var lblLocSchedule: UILabel!
    @IBOutlet weak var lblLocType: UILabel!
    
    override func prepareForReuse() {
        super .prepareForReuse()
        self.LoungeImageView.image = nil
    }
}
