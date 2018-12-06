//
//  SelectUser.swift
//  BottleServiceApp
//
//  Created by David Olarte on 09.03.18.
//  Copyright © 2018 Iselacher Digital Media Factory. All rights reserved.
//

import UIKit

class SelectUser: UIViewController {

    @IBOutlet weak var btnClient: UIButton!
  
    @IBOutlet weak var btnLounge: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        btnClient.layer.cornerRadius = 20
        btnClient.layer.borderWidth = 1
        
        btnLounge.layer.cornerRadius = 20
        btnLounge.layer.borderWidth = 1
        
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
