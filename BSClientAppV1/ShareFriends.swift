//
//  ShareFriends.swift
//  BottleServiceApp
//
//  Created by David Olarte on 11/06/2018.
//  Copyright © 2018 Iselacher Digital Media Factory. All rights reserved.
//

import UIKit

class ShareFriends: UIViewController {
    @IBOutlet weak var leadingConstraint: NSLayoutConstraint!
    
    
    var isSlideMenuHidden = true
    

    @IBAction func btnHide(_ sender: Any) {
        
        if isSlideMenuHidden  {
            leadingConstraint.constant = -375
            
            UIView.animate(withDuration: 0.3, animations: {
                self.view.layoutIfNeeded()
            })
            
            
            
            
        } else {
            leadingConstraint.constant = 0
            
            UIView.animate(withDuration: 0.3) {
                self.view.layoutIfNeeded()
            }
            
            
        }
        
        isSlideMenuHidden = !isSlideMenuHidden
        
    }
    
    

    
    @IBAction func btnMenu(_ sender: Any) {
        
        if isSlideMenuHidden  {
            leadingConstraint.constant = 0
            
            UIView.animate(withDuration: 0.3, animations: {
                self.view.layoutIfNeeded()
            })
            
            
            
            
        } else {
        leadingConstraint.constant = -375
            
            UIView.animate(withDuration: 0.3) {
                self.view.layoutIfNeeded()
            }
            
            
        }
        
                isSlideMenuHidden = !isSlideMenuHidden
        
    }
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        leadingConstraint.constant = -375
        
        
        

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
