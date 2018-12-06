//
//  CheckBox.swift
//  BottleServiceApp
//
//  Created by David Olarte on 07/08/2018.
//  Copyright © 2018 Iselacher Digital Media Factory. All rights reserved.
//

import UIKit




class CheckBox: UIButton {
    
    let checkedImage = UIImage(named: "if_checked_checkbox_2639910")! as UIImage
    let uncheckedImage = UIImage(named: "if_checkbox_unchecked_42186")! as UIImage
    
    // Bool property
    var isChecked: Bool = false {
        didSet{
            if isChecked == true {
                self.setImage(checkedImage, for: UIControlState.normal)
            } else {
                self.setImage(uncheckedImage, for: UIControlState.normal)
            }
        }
    }
    
    override func awakeFromNib() {
        self.addTarget(self, action:#selector(buttonClicked(sender:)), for: UIControlEvents.touchUpInside)
        self.isChecked = false
    }
    
    @objc func buttonClicked(sender: UIButton) {
        if sender == self {
    
            isChecked = !isChecked
        }
    }

}
