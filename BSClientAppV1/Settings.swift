//
//  Settings.swift
//  BottleServiceApp
//
//  Created by David Olarte on 22/06/2018.
//  Copyright © 2018 Iselacher Digital Media Factory. All rights reserved.
//

import UIKit
import Firebase
import GoogleSignIn

class Settings: UIViewController {


    @IBOutlet weak var LeadingConstraint: NSLayoutConstraint!
    
    var isSlideMenuHidden = true
    @IBAction func btnMenu(_ sender: Any) {
        
        if isSlideMenuHidden  {
            LeadingConstraint.constant = 0
            
            UIView.animate(withDuration: 0.3, animations: {
                self.view.layoutIfNeeded()
            })
            
            
            
            
        } else {
            LeadingConstraint.constant = -375
            
            UIView.animate(withDuration: 0.3) {
                self.view.layoutIfNeeded()
            }
            
            
        }
        
        isSlideMenuHidden = !isSlideMenuHidden
        
        
    }
    
    @IBAction func btnSettings(_ sender: Any) {
        
        if isSlideMenuHidden  {
            LeadingConstraint.constant = 0
            
            UIView.animate(withDuration: 0.3, animations: {
                self.view.layoutIfNeeded()
            })
            
            
            
            
        } else {
            LeadingConstraint.constant = -375
            
            UIView.animate(withDuration: 0.3) {
                self.view.layoutIfNeeded()
            }
            
            
        }
        
        isSlideMenuHidden = !isSlideMenuHidden
        
        
    }
    
    @IBOutlet weak var btnHide: UIButton!
    
    
    @IBAction func btnHide(_ sender: Any) {
        if isSlideMenuHidden  {
            LeadingConstraint.constant = 0
            
            UIView.animate(withDuration: 0.3, animations: {
                self.view.layoutIfNeeded()
            })
            
            
            
            
        } else {
            LeadingConstraint.constant = -375
            
            UIView.animate(withDuration: 0.3) {
                self.view.layoutIfNeeded()
            }
            
            
        }
        
        isSlideMenuHidden = !isSlideMenuHidden
        
        
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        LeadingConstraint.constant = -375

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()

    }
    



}
