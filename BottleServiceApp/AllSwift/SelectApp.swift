 //
//  SelectApp.swift
//  BottleServiceApp
//
//  Created by David Olarte on 11.03.18.
//  Copyright © 2018 Iselacher Digital Media Factory. All rights reserved.
//

import UIKit

class SelectApp: UIViewController {

    @IBOutlet weak var btnNext: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
btnNext.layer.cornerRadius = 29.5
        btnNext.layer.borderWidth = 1
        
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
