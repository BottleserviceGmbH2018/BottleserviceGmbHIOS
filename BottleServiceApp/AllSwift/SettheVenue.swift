//
//  SetUpVenue.swift
//  BottleServiceApp
//
//  Created by David Olarte on 26.04.18.
//  Copyright © 2018 Iselacher Digital Media Factory. All rights reserved.
//

import UIKit

class SettheVenue: UIViewController {
    
    var locTitle : String = ""
    var locType : String = ""
    var locAdd1 : String = ""
    var locAdd2 : String = ""
    var locCity : String = ""
    var locPostal : String = ""
    var locFullbar : String = ""
    var locDesc : String = ""
    var locGuest : String = ""
    
    
    @IBOutlet weak var lblLoc: UILabel!
    
    @IBOutlet weak var lblLocType: UILabel!
    

    override func  prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        if segue.destination is Setvenue1
        {
            let vs = segue.destination as? Setvenue1
            vs?.locTitle = lblLoc.text!
            vs?.locType = lblLocType.text!
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        
      lblLoc.text = locTitle
      lblLocType.text = locType
    
        
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}
