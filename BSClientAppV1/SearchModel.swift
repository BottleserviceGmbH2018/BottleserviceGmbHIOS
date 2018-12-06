//
//  SearchModel.swift
//  BottleServiceApp
//
//  Created by David Olarte on 02/07/2018.
//  Copyright © 2018 Iselacher Digital Media Factory. All rights reserved.
//

import Foundation


class Loc{
    var key : String
    var locName : String
    var locCity : String
    var imageName : String
    
    
    init(dictionary: [String: AnyObject], key: String)
    self.key = key
    self.locName = dictionary
}
