//
//  StartwithBasic4.swift
//  BottleServiceApp
//
//  Created by David Olarte on 11.04.18.
//  Copyright © 2018 Iselacher Digital Media Factory. All rights reserved.
//

import UIKit

class StartwithBasic4: UIViewController {
    
    
    var location : String = ""
    var guests : String = ""
    var add1 : String = ""
    var add2 : String = ""
    var city : String = ""
    var postal : String = ""
    var  fullbar : String = ""
    var outdoor : String = ""
    var craft : String = ""
    var night : String = ""
    var wifi : String = ""
    var ac : String = ""
    var cash : String = ""
    var card : String = ""
    var desc : String = ""
    

    
    @IBOutlet weak var lblcard: UILabel!
    @IBOutlet weak var lblcash: UILabel!
    @IBOutlet weak var lblac: UILabel!
    @IBOutlet weak var lblwifi: UILabel!
    @IBOutlet weak var lblnight: UILabel!
    @IBOutlet weak var lblcraft: UILabel!
    @IBOutlet weak var lbloutdoor: UILabel!
    @IBOutlet weak var lblfullbar: UILabel!
    @IBOutlet weak var lblGuests: UILabel!
    @IBOutlet weak var lblLoc: UILabel!
    @IBOutlet weak var lblPostal: UILabel!
    @IBOutlet weak var lblCity: UILabel!
    @IBOutlet weak var lblAdd2: UILabel!
    @IBOutlet weak var lblAdd1: UILabel!
    @IBOutlet weak var txtDesc: UITextView!
    @IBOutlet weak var lblDescribe: UILabel!
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        if segue.destination is StartwithBasic5
        {
            let vs = segue.destination as? StartwithBasic5
            vs?.location = lblLoc.text!
            vs?.guests = lblGuests.text!
            vs?.add1 = lblAdd1.text!
            vs?.add2 = lblAdd2.text!
            vs?.city = lblCity.text!
            vs?.postal = lblPostal.text!
            vs?.location = lblLoc.text!
            vs?.fullbar = lblfullbar.text!
            vs?.outdoor = lbloutdoor.text!
            vs?.craft = lblcraft.text!
            vs?.night = lblnight.text!
            vs?.wifi = lblwifi.text!
            vs?.ac = lblac.text!
            vs?.cash = lblcash.text!
            vs?.card = lblcard.text!
           vs?.desc = txtDesc.text!
        }
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        hideKeyboardWhenTappedAround()
        txtDesc.layer.cornerRadius = 5
        txtDesc.layer.borderWidth = 1

        lblfullbar.text = fullbar
        lbloutdoor.text = outdoor
        lblcraft.text = craft
        lblnight.text = night
        lblwifi.text = wifi
        lblac.text = ac
        lblcash.text = cash
        lblcard.text = card
        lblLoc.text = location
        lblGuests.text = guests
        lblAdd2.text = add2
        lblAdd1.text = add1
        lblCity.text = city
        lblPostal.text = postal

        

        // Do any additional setup after loading the view.
    }

    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
