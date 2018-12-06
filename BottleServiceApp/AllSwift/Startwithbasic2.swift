//
//  Startwithbasic2.swift
//  BottleServiceApp
//
//  Created by David Olarte on 11.04.18.
//  Copyright © 2018 Iselacher Digital Media Factory. All rights reserved.
//

import UIKit

class Startwithbasic2: UIViewController {
    
    
    var location : String = ""
    var guests : String = ""
    var add1 : String = ""
    var add2 : String = ""
    var city : String = ""
    var postal : String = ""
    
    
    
    

    @IBOutlet weak var lblGuest: UILabel!
    @IBOutlet weak var lblLoc: UILabel!
    @IBOutlet weak var txtAdd1: UITextField!
    @IBOutlet weak var txtAdd2: UITextField!
    @IBOutlet weak var txtCity: UITextField!
    @IBOutlet weak var txtPostal: UITextField!
   
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        if segue.destination is StartWithBasic3
        {
            let vs = segue.destination as? StartWithBasic3
            vs?.location = lblLoc.text!
            vs?.guests = lblGuest.text!
            vs?.add1 = txtAdd1.text!
            vs?.add2 = txtAdd2.text!
            vs?.city = txtCity.text!
            vs?.postal = txtPostal.text!
            vs?.location = lblLoc.text!
            vs?.guests = lblGuest.text!
            
        }
    }
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        hideKeyboardWhenTappedAround()
        txtAdd1.botLine()
        txtAdd2.botLine()
        txtCity.botLine()
        txtPostal.botLine()
        
        
        lblLoc.text = location
        lblGuest.text = guests

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
