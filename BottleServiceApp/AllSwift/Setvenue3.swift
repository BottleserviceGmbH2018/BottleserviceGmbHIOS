//
//  Setvenue3.swift
//  BottleServiceApp
//
//  Created by David Olarte on 26.04.18.
//  Copyright © 2018 Iselacher Digital Media Factory. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth
import FirebaseStorage
import FirebaseDatabase

class Setvenue3: UIViewController {

    
          var ref: DatabaseReference?
  
    @IBOutlet weak var btnMPrice: UIButton!
    @IBOutlet weak var btnPPrice: UIButton!
    @IBOutlet weak var btnMGuest: UIButton!
    @IBOutlet weak var btnPGuest: UIButton!
    @IBOutlet weak var lblTitle: UILabel!
    var locTitle : String = ""
    var locType : String = ""
    @IBOutlet weak var txtSpecialArea: UITextField!
    @IBOutlet weak var txtDescribeArea: UITextField!
    @IBOutlet weak var txtPrice: UITextField!
    @IBOutlet weak var lblLocType: UILabel!
    
    @IBAction func btnNext(_ sender: Any) {
      
    
    }
    
    
    @IBAction func btnPGuest(_ sender: Any) {
        let cur = Int(txtNoGuest.text!)!;
        self.txtNoGuest.text = String(cur + 1);
        
    }
    
    
    @IBAction func btnMGuest(_ sender: Any) {
        let cur = Int(txtNoGuest.text!)!;
        self.txtNoGuest.text = String(cur - 1);
        
    }
    
    @IBAction func btnPPrice(_ sender: Any) {
        let cur = Int(txtPrice.text!)!;
        self.txtPrice.text = String(cur + 1);
        
        
    }
    
    @IBAction func btnMPrice(_ sender: Any) {
        let cur = Int(txtPrice.text!)!;
        self.txtPrice.text = String(cur + 1);
    }
    
    override func  prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        if segue.destination is Setvenue4
        {
            let vs = segue.destination as? Setvenue4
            vs?.locTitle = lblTitle.text!
            vs?.locType = lblLocType.text!
            vs?.spTitle = txtSpecialArea.text!
            vs?.spGuest = txtNoGuest.text!
            vs?.spPrice = txtPrice.text!
            vs?.spArea = txtDescribeArea.text!
        }
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        hideKeyboardWhenTappedAround()
        ref = Database.database().reference()
        
        lblTitle.text = locTitle
        lblLocType.text = locType
        txtSpecialArea.botLine()
        txtDescribeArea.botLine()
        
        self.btnMGuest.layer.cornerRadius = 17
        self.btnMGuest.layer.borderWidth = 1
     
        self.btnPPrice.layer.cornerRadius = 17
        self.btnPPrice.layer.borderWidth = 1
        
        self.btnMPrice.layer.cornerRadius = 17
        self.btnMPrice.layer.borderWidth = 1
        
        self.btnPGuest.layer.cornerRadius = 17
        self.btnPGuest.layer.borderWidth = 1
        
        // Do any additional setup after loading the view.
    }
    @IBOutlet weak var txtNoGuest: UITextField!
    
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
