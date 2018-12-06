//
//  EventCollectionViewCell.swift
//  BSClientAppV1
//
//  Created by David Olarte on 11.05.18.
//  Copyright © 2018 Iselacher Digital Media Factory. All rights reserved.
//

import UIKit

class EventCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var EventImageView: UIImageView!
    
    
    @IBOutlet weak var lblEventName: UILabel!
    
    @IBOutlet weak var lblLocName: UILabel!
    @IBOutlet weak var lblAddress: UILabel!
    
    @IBOutlet weak var lblSchedule: UILabel!
    override func prepareForReuse() {
        super.prepareForReuse()
        self.EventImageView.image = nil
        
    }
}
