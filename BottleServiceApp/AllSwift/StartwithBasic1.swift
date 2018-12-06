//
//  StartwithBasic1.swift
//  BottleServiceApp
//
//  Created by David Olarte on 10.04.18.
//  Copyright © 2018 Iselacher Digital Media Factory. All rights reserved.
//

import UIKit
import Foundation
import DropDown


extension UIView {
    
    @IBInspectable
    var cornerRadius: CGFloat {
        get {
            return layer.cornerRadius
        }
        set {
            layer.cornerRadius = newValue
        }
    }
    
    @IBInspectable
    var borderWidth: CGFloat {
        get {
            return layer.borderWidth
        }
        set {
            layer.borderWidth = newValue
        }
    }
    
    @IBInspectable
    var borderColor: UIColor? {
        get {
            if let color = layer.borderColor {
                return UIColor(cgColor: color)
            }
            return nil
        }
        set {
            if let color = newValue {
                layer.borderColor = color.cgColor
            } else {
                layer.borderColor = nil
            }
        }
    }
    
    @IBInspectable
    var shadowRadius: CGFloat {
        get {
            return layer.shadowRadius
        }
        set {
            layer.shadowRadius = newValue
        }
    }
    
    @IBInspectable
    var shadowOpacity: Float {
        get {
            return layer.shadowOpacity
        }
        set {
            layer.shadowOpacity = newValue
        }
    }
    
    @IBInspectable
    var shadowOffset: CGSize {
        get {
            return layer.shadowOffset
        }
        set {
            layer.shadowOffset = newValue
        }
    }
    
    @IBInspectable
    var shadowColor: UIColor? {
        get {
            if let color = layer.shadowColor {
                return UIColor(cgColor: color)
            }
            return nil
        }
        set {
            if let color = newValue {
                layer.shadowColor = color.cgColor
            } else {
                layer.shadowColor = nil
            }
        }
    }
}


class StartwithBasic1: UIViewController,  UIPickerViewDataSource, UIPickerViewDelegate {
    var location : String = ""
    var guests : String = ""
    @IBOutlet weak var lblLoc: UILabel!
    @IBOutlet weak var btnMinus: UIButton!
    @IBOutlet weak var btnPlus: UIButton!
    @IBOutlet weak var txtGuest: UITextField!
    @IBAction func btnPlus(_ sender: Any) {
        let cur = Int(txtGuest.text!)!;
            self.txtGuest.text = String(cur + 1);
    }
    @IBAction func btnNext(_ sender: Any) {
    }
    @IBOutlet weak var btnNext: UIButton!
    @IBAction func btnMinus(_ sender: Any) {
        let cur = Int(txtGuest.text!)!;
        self.txtGuest.text = String(cur - 1);
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerData.count
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickerData[row]
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        lblLoc.text = pickerData [row]
    }
    @IBOutlet weak var picker: UIPickerView!
 
    var pickerData: [String] = [String]()
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        if segue.destination is Startwithbasic2
        {
            let vs = segue.destination as? Startwithbasic2
            vs?.location = lblLoc.text!
        vs?.guests = txtGuest.text!
           
 
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, attributedTitleForRow row: Int, forComponent component: Int) -> NSAttributedString? {
        let titleData = pickerData[row]
        let myTitle = NSAttributedString(string: titleData, attributes: [NSAttributedStringKey.foregroundColor: UIColor.white])
        return myTitle
    }
   
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        hideKeyboardWhenTappedAround()
        self.btnPlus.layer.cornerRadius = 26
        self.btnPlus.layer.borderWidth = 1
        self.btnMinus.layer.cornerRadius = 26
        self.btnMinus.layer.borderWidth = 1
      
        
        self.picker.setValue(UIColor.white, forKey: "textColor")
        
        
        self.picker.delegate = self
        self.picker.dataSource = self
        
        pickerData = ["Bar","Lounge"]
        
    
        
        
        
      
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
