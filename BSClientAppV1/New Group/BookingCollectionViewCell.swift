//
//  BookingCollectionViewCell.swift
//  BSClientAppV1
//
//  Created by David Olarte on 02.06.18.
//  Copyright © 2018 Iselacher Digital Media Factory. All rights reserved.
//

import UIKit

class BookingCollectionViewCell: UICollectionViewCell {
   
    @IBOutlet weak var BookImage: UIImageView!
    @IBOutlet weak var lblSpecTitle: UITextView!
    @IBOutlet weak var schedule: UITextView!
    @IBOutlet weak var lblPaymentStatus: UITextView!
    @IBOutlet weak var lblApproval: UITextView!
    
    @IBOutlet weak var lblLocName: UITextView!
    
    
    override func prepareForReuse() {
        super.prepareForReuse()
        self.BookImage.image = nil
    }
    
}
