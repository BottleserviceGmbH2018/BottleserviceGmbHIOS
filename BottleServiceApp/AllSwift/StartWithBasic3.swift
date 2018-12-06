//
//  StartWithBasic3.swift
//  BottleServiceApp
//
//  Created by David Olarte on 11.04.18.
//  Copyright © 2018 Iselacher Digital Media Factory. All rights reserved.
//

import UIKit

class StartWithBasic3: UIViewController {

    
    
    var location : String = ""
    var guests : String = ""
    var add1 : String = ""
    var add2 : String = ""
    var city : String = ""
    var postal : String = ""
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        if segue.destination is StartwithBasic4
        {
            let vs = segue.destination as? StartwithBasic4
            vs?.location = lblLoc.text!
            vs?.guests = lblGuests.text!
            vs?.add1 = lblAdd1.text!
            vs?.add2 = lblAdd2.text!
            vs?.city = City.text!
            vs?.postal = Postal.text!
            vs?.location = lblLoc.text!
            vs?.fullbar = lblFullbar.text!
            vs?.outdoor = lblOutdoor.text!
            vs?.craft = lblCraft.text!
            vs?.night = lblNightLife.text!
            vs?.wifi = lblWireless.text!
            vs?.ac = lblAircon.text!
            vs?.cash = lblCash.text!
            vs?.card = lblCard.text!
        }
    }
    @IBOutlet weak var swFullbar: UISwitch!
    @IBOutlet weak var lblCard: UILabel!
    @IBOutlet weak var lblCash: UILabel!
    @IBOutlet weak var lblAircon: UILabel!
    @IBOutlet weak var lblWireless: UILabel!
    @IBOutlet weak var lblNightLife: UILabel!
    @IBOutlet weak var lblCraft: UILabel!
    @IBOutlet weak var lblOutdoor: UILabel!
    @IBOutlet weak var lblFullbar: UILabel!
    @IBOutlet weak var lblAdd1: UILabel!
    @IBOutlet weak var lblAdd2: UILabel!
    @IBOutlet weak var City: UILabel!
    @IBOutlet weak var Postal: UILabel!
    @IBOutlet weak var lblLoc: UILabel!
    @IBOutlet weak var lblGuests: UILabel!
    @IBOutlet weak var swOutdoor: UISwitch!
    @IBOutlet weak var swCraft: UISwitch!
    @IBOutlet weak var swNight: UISwitch!
    @IBOutlet weak var swWireless: UISwitch!
    @IBOutlet weak var swAC: UISwitch!
    @IBOutlet weak var swCash: UISwitch!
    @IBOutlet weak var swCard: UISwitch!
    @IBOutlet weak var lblFeature: UILabel!
    

    @IBAction func swFullbarAct(_ sender: Any) {
        
        if swFullbar.isOn {
            lblFullbar.text = "Full Bar"
            let feat = self.lblFullbar.text! + "," + self.lblOutdoor.text! + "," + self.lblCraft.text! + "," + self.lblNightLife.text! + "," + self.lblWireless.text! + "," + self.lblAircon.text! + "," + self.lblCash.text! + "," + self.lblCard.text!
            
            
            self.lblFeature.text! = feat
            
            
        } else {
            self.lblFullbar.text = ""
            let feat = self.lblFullbar.text! + "," + self.lblOutdoor.text! + "," + self.lblCraft.text! + "," + self.lblNightLife.text! + "," + self.lblWireless.text! + "," + self.lblAircon.text! + "," + self.lblCash.text! + "," + self.lblCard.text!
            
            
            self.lblFeature.text! = feat
            
            }
    }
        
    
    @IBAction func swOutdoorAct(_ sender: Any) {
        
        if swOutdoor.isOn {
            lblOutdoor.text = "Outdoor Seating"
            
            let feat = self.lblFullbar.text! + "," + self.lblOutdoor.text! + "," + self.lblCraft.text! + "," + self.lblNightLife.text! + "," + self.lblWireless.text! + "," + self.lblAircon.text! + "," + self.lblCash.text! + "," + self.lblCard.text!
            
            
            self.lblFeature.text! = feat
            
        } else {
            lblOutdoor.text = ""
            
            let feat = self.lblFullbar.text! + "," + self.lblOutdoor.text! + "," + self.lblCraft.text! + "," + self.lblNightLife.text! + "," + self.lblWireless.text! + "," + self.lblAircon.text! + "," + self.lblCash.text! + "," + self.lblCard.text!
            
            
            self.lblFeature.text! = feat
            
        }
        
    }
    
  
    @IBAction func swCraftAct(_ sender: Any) {
        
        if swCraft.isOn {
            lblCraft.text = "Craft seer"
            
            let feat = self.lblFullbar.text! + "," + self.lblOutdoor.text! + "," + self.lblCraft.text! + "," + self.lblNightLife.text! + "," + self.lblWireless.text! + "," + self.lblAircon.text! + "," + self.lblCash.text! + "," + self.lblCard.text!
            
            
            self.lblFeature.text! = feat
        
        } else {
            lblCraft.text = ""
            
            let feat = self.lblFullbar.text! + "," + self.lblOutdoor.text! + "," + self.lblCraft.text! + "," + self.lblNightLife.text! + "," + self.lblWireless.text! + "," + self.lblAircon.text! + "," + self.lblCash.text! + "," + self.lblCard.text!
            
            
            self.lblFeature.text! = feat
        }
        
    }
    
    @IBAction func swNightAct(_ sender: Any) {
        
        if swNight.isOn {
         lblNightLife.text = "Night life"
            
            let feat = self.lblFullbar.text! + "," + self.lblOutdoor.text! + "," + self.lblCraft.text! + "," + self.lblNightLife.text! + "," + self.lblWireless.text! + "," + self.lblAircon.text! + "," + self.lblCash.text! + "," + self.lblCard.text!
            
            
            self.lblFeature.text! = feat
            
        } else {
            lblNightLife.text = ""
            
            
            let feat = self.lblFullbar.text! + "," + self.lblOutdoor.text! + "," + self.lblCraft.text! + "," + self.lblNightLife.text! + "," + self.lblWireless.text! + "," + self.lblAircon.text! + "," + self.lblCash.text! + "," + self.lblCard.text!
            
            
            self.lblFeature.text! = feat
        }
        
    }
    
    @IBAction func swWirelessAct(_ sender: Any) {
        if swWireless.isOn {
            lblWireless.text = "Wireless Internet"
            
            let feat = self.lblFullbar.text! + "," + self.lblOutdoor.text! + "," + self.lblCraft.text! + "," + self.lblNightLife.text! + "," + self.lblWireless.text! + "," + self.lblAircon.text! + "," + self.lblCash.text! + "," + self.lblCard.text!
            
            
            self.lblFeature.text! = feat
            
        } else {
            lblWireless.text = ""
            
            
            let feat = self.lblFullbar.text! + "," + self.lblOutdoor.text! + "," + self.lblCraft.text! + "," + self.lblNightLife.text! + "," + self.lblWireless.text! + "," + self.lblAircon.text! + "," + self.lblCash.text! + "," + self.lblCard.text!
            
            
            self.lblFeature.text! = feat
        }

    }
    
    @IBAction func swACAct(_ sender: Any) {
        if swAC.isOn {
            lblAircon.text = "Air Conditioning"
            let feat = self.lblFullbar.text! + "," + self.lblOutdoor.text! + "," + self.lblCraft.text! + "," + self.lblNightLife.text! + "," + self.lblWireless.text! + "," + self.lblAircon.text! + "," + self.lblCash.text! + "," + self.lblCard.text!
            
            
            self.lblFeature.text! = feat
            
        } else {
            lblAircon.text = ""
            
            let feat = self.lblFullbar.text! + "," + self.lblOutdoor.text! + "," + self.lblCraft.text! + "," + self.lblNightLife.text! + "," + self.lblWireless.text! + "," + self.lblAircon.text! + "," + self.lblCash.text! + "," + self.lblCard.text!
            
            
            self.lblFeature.text! = feat
        }
    }
    
    @IBAction func swCashAct(_ sender: Any) {
        if swCash.isOn {
        lblCash.text = "Cash Payment"
            
            let feat = self.lblFullbar.text! + "," + self.lblOutdoor.text! + "," + self.lblCraft.text! + "," + self.lblNightLife.text! + "," + self.lblWireless.text! + "," + self.lblAircon.text! + "," + self.lblCash.text! + "," + self.lblCard.text!
            
            
            self.lblFeature.text! = feat
        } else {
            lblCash.text = ""
            
            
            let feat = self.lblFullbar.text! + "," + self.lblOutdoor.text! + "," + self.lblCraft.text! + "," + self.lblNightLife.text! + "," + self.lblWireless.text! + "," + self.lblAircon.text! + "," + self.lblCash.text! + "," + self.lblCard.text!
            
            
            self.lblFeature.text! = feat
        }
        
    }
    

    @IBAction func swCardAct(_ sender: Any) {
        
        if swCard.isOn {
            lblCard.text = "Card Payment"
            
            let feat = self.lblFullbar.text! + "," + self.lblOutdoor.text! + "," + self.lblCraft.text! + "," + self.lblNightLife.text! + "," + self.lblWireless.text! + "," + self.lblAircon.text! + "," + self.lblCash.text! + "," + self.lblCard.text!
            
            
            self.lblFeature.text! = feat
            
        } else {
            lblCard.text = ""
            
            let feat = self.lblFullbar.text! + "," + self.lblOutdoor.text! + "," + self.lblCraft.text! + "," + self.lblNightLife.text! + "," + self.lblWireless.text! + "," + self.lblAircon.text! + "," + self.lblCash.text! + "," + self.lblCard.text!
            
            
            self.lblFeature.text! = feat
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        lblGuests.text = guests
        lblLoc.text = location
        
    lblAdd1.text = add1
        lblAdd2.text = add2
     City.text = city
        Postal.text = postal
  
     
        
        let feat = self.lblFullbar.text! + "," + self.lblOutdoor.text! + "," + self.lblCraft.text! + "," + self.lblNightLife.text! + "," + self.lblWireless.text! + "," + self.lblAircon.text! + "," + self.lblCash.text! + "," + self.lblCard.text!
        
        
    self.lblFeature.text! = feat
    
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
