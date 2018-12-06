//
//  SelectAccount.swift
//  BottleServiceApp
//
//  Created by David Olarte on 09.03.18.
//  Copyright © 2018 Iselacher Digital Media Factory. All rights reserved.
//

import UIKit

class SelectAccount: UIViewController {
    
    
    var usertype : String = ""

    @IBOutlet weak var lblUsertype: UILabel!
    @IBOutlet weak var btnPersonal: UIButton!
    @IBOutlet weak var btnCompany: UIButton!
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        if segue.destination is RegisterPersonal1
        {
            let vs = segue.destination as? RegisterPersonal1
            vs?.usertype = lblUsertype.text!
          
        } else if segue.destination is RegisterCompany1{
            let vsa = segue.destination as? RegisterCompany1
            vsa?.usertype = lblUsertype.text!
        }
    }
    
    
    
 
    override func viewDidLoad() {
        super.viewDidLoad()
        
        btnPersonal.layer.cornerRadius = 20
        btnPersonal.layer.borderWidth = 1
        btnCompany.layer.cornerRadius = 20
        btnCompany.layer.borderWidth = 1
        
   lblUsertype?.text = usertype
      
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
