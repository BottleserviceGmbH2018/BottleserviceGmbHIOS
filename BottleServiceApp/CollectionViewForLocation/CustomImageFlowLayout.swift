//
//  CustomImageFlowLayout.swift
//  BottleServiceApp
//
//  Created by David Olarte on 09.05.18.
//  Copyright © 2018 Iselacher Digital Media Factory. All rights reserved.
//

import UIKit

class CustomImageFlowLayout: UICollectionViewFlowLayout {
    
    
    override init() {
        super.init()
        setupLayout()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupLayout()
    }
    
    override var itemSize: CGSize
    {
        set {}
        
        get {
            let numberOfColumns: CGFloat = 1
            let itemWidth = (self.collectionView!.frame.width - (numberOfColumns - 1))
            return CGSize(width: itemWidth, height: itemWidth)
        }
    }
    
    func setupLayout(){
        minimumLineSpacing = 1
        minimumInteritemSpacing = 1
        scrollDirection = .vertical
    }
    

}
