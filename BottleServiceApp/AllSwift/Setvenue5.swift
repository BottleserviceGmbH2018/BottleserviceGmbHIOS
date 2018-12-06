//
//  Setvenue5.swift
//  BottleServiceApp
//
//  Created by David Olarte on 30.04.18.
//  Copyright © 2018 Iselacher Digital Media Factory. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth
import FirebaseStorage
import FirebaseDatabase

class Setvenue5: UIViewController {
    
    
    var ref = DatabaseReference()

    var locTitle : String =  ""
    var locType : String = ""

    @IBOutlet weak var eMonday: UILabel!
    @IBOutlet weak var sMonday: UILabel!
    @IBOutlet weak var Monday: UITextView!
    @IBOutlet weak var STMonday: UIDatePicker!
    @IBOutlet weak var ETMonday: UIDatePicker!
    @IBOutlet weak var sTuesday: UILabel!
    @IBOutlet weak var eTuesday: UILabel!
    @IBOutlet weak var STTuesday: UIDatePicker!
    @IBOutlet weak var ETTuesday: UIDatePicker!
    @IBOutlet weak var Tuesday: UITextView!
    @IBOutlet weak var Wednesday: UITextView!
    @IBOutlet weak var sWednesday: UILabel!
    @IBOutlet weak var eWednesday: UILabel!
    @IBOutlet weak var STWednesday: UIDatePicker!
    @IBOutlet weak var ETWednesday: UIDatePicker!
    
    @IBOutlet weak var Thursday: UITextView!
    @IBOutlet weak var sThursday: UILabel!
    @IBOutlet weak var tThursday: UILabel!
    @IBOutlet weak var STThursday: UIDatePicker!
    @IBOutlet weak var ETThursday: UIDatePicker!
    
    @IBOutlet weak var Friday: UITextView!
    @IBOutlet weak var sFriday: UILabel!
    @IBOutlet weak var eFriday: UILabel!
    @IBOutlet weak var STFriday: UIDatePicker!
    @IBOutlet weak var ETFriday: UIDatePicker!
    
    
    @IBOutlet weak var Saturday: UITextView!
    @IBOutlet weak var sSaturday: UILabel!
    @IBOutlet weak var eSaturday: UILabel!
    @IBOutlet weak var STSaturday: UIDatePicker!
    @IBOutlet weak var ETSaturday: UIDatePicker!
    
    @IBOutlet weak var Sunday: UITextView!
    @IBOutlet weak var sSunday: UILabel!
    @IBOutlet weak var eSunday: UILabel!
    @IBOutlet weak var STSunday: UIDatePicker!
    @IBOutlet weak var ETSunday: UIDatePicker!
    
    @IBOutlet weak var lbltitle: UILabel!
    @IBOutlet weak var lblLocType: UILabel!
    
    
    
    func timeLounge() {
        
        let user = Auth.auth().currentUser
        let title = lbltitle.text

                let add = [
                    "StartMonday" : sMonday.text,
                    "EndMonday" : eMonday.text,
                    
                    "StartTuesday" : sTuesday.text,
                    "EndTuesday" : eTuesday.text,
                    
                    "StartWednesday" : sWednesday.text,
                    "EndWednesday" : eWednesday.text,
                    
                    "StartThursday" : sThursday.text,
                    "EndThursday" : tThursday.text,
                    
                    "StartFriday" : sFriday.text,
                    "EndFriday" : eFriday.text,
                    
                    "StartSaturday" : sSaturday.text,
                    "EndSaturday" : eSaturday.text,
                    
                    "StartSunday" : sSunday.text,
                    "EndSunday" : eSunday.text
                ]
 
        
        
        self.ref.child("Location_Information").child("Lounge").child((user?.uid)!).child(title!).child("locationSchedule").setValue(add)
            }
    
    
    func timeBar() {
        
        let user = Auth.auth().currentUser
        let title = lbltitle.text
        
        let add = [
            "StartMonday" : sMonday.text,
            "EndMonday" : eMonday.text,
            
            "StartTuesday" : sTuesday.text,
            "EndTuesday" : eTuesday.text,
            
            "StartWednesday" : sWednesday.text,
            "EndWednesday" : eWednesday.text,
            
            "StartThursday" : sThursday.text,
            "EndThursday" : tThursday.text,
            
            "StartFriday" : sFriday.text,
            "EndFriday" : eFriday.text,
            
            "StartSaturday" : sSaturday.text,
            "EndSaturday" : eSaturday.text,
            
            "StartSunday" : sSunday.text,
            "EndSunday" : eSunday.text
        ]
        
        
        
        self.ref.child("Location_Information").child("Bar").child((user?.uid)!).child(title!).child("locationSchedule").setValue(add)
    }
    
    
    
    
    @IBAction func btnNext(_ sender: Any) {
        let type = lblLocType.text
        
        
        if type == "Lounge" {
            
            timeLounge()
            
        } else if type == "Bar" {
            timeBar()
            
        }
    
        
    }
    
    
    
    @objc func datePickerValueChanged(datePicker: UIDatePicker) {
        
        let dateFormatter = DateFormatter()

        dateFormatter.timeStyle = DateFormatter.Style.medium
        let dateValue = dateFormatter.string(from: datePicker.date)
        sMonday.text = dateValue
        
    }
    
    @objc func datePickerValueChanged1(datePicker: UIDatePicker) {
        
        let dateFormatter = DateFormatter()
        
        
        
        dateFormatter.timeStyle = DateFormatter.Style.medium
        let dateValue = dateFormatter.string(from: datePicker.date)
        eMonday.text = dateValue
        
    }
    
    @objc func datePickerValueChanged2(datePicker: UIDatePicker) {
        
        let dateFormatter = DateFormatter()
        
        
        
        dateFormatter.timeStyle = DateFormatter.Style.medium
        let dateValue = dateFormatter.string(from: datePicker.date)
       sTuesday.text = dateValue
        
    }
    
    @objc func datePickerValueChanged3(datePicker: UIDatePicker) {
        
        let dateFormatter = DateFormatter()
        
        
        
        dateFormatter.timeStyle = DateFormatter.Style.medium
        let dateValue = dateFormatter.string(from: datePicker.date)
        eTuesday.text = dateValue
        
    }
    
    @objc func datePickerValueChanged4(datePicker: UIDatePicker) {
        
        let dateFormatter = DateFormatter()
        dateFormatter.timeStyle = DateFormatter.Style.medium
        let dateValue = dateFormatter.string(from: datePicker.date)
        sWednesday.text = dateValue
        
    }
    @objc func datePickerValueChanged5(datePicker: UIDatePicker) {
        
        let dateFormatter = DateFormatter()
        dateFormatter.timeStyle = DateFormatter.Style.medium
        let dateValue = dateFormatter.string(from: datePicker.date)
        eWednesday.text = dateValue
        
    }
    @objc func datePickerValueChanged6(datePicker: UIDatePicker) {
        
        let dateFormatter = DateFormatter()
        dateFormatter.timeStyle = DateFormatter.Style.medium
        let dateValue = dateFormatter.string(from: datePicker.date)
        sThursday.text = dateValue
        
    }
    @objc func datePickerValueChanged7(datePicker: UIDatePicker) {
        
        let dateFormatter = DateFormatter()
        dateFormatter.timeStyle = DateFormatter.Style.medium
        let dateValue = dateFormatter.string(from: datePicker.date)
        tThursday.text = dateValue
        
    }
    
    @objc func datePickerValueChanged8(datePicker: UIDatePicker) {
        
        let dateFormatter = DateFormatter()
        dateFormatter.timeStyle = DateFormatter.Style.medium
        let dateValue = dateFormatter.string(from: datePicker.date)
        sFriday.text = dateValue
        
    }
    
    @objc func datePickerValueChanged9(datePicker: UIDatePicker) {
        
        let dateFormatter = DateFormatter()
        dateFormatter.timeStyle = DateFormatter.Style.medium
        let dateValue = dateFormatter.string(from: datePicker.date)
        eFriday.text = dateValue
        
    }
    
    @objc func datePickerValueChanged10(datePicker: UIDatePicker) {
        
        let dateFormatter = DateFormatter()
        dateFormatter.timeStyle = DateFormatter.Style.medium
        let dateValue = dateFormatter.string(from: datePicker.date)
        sSaturday.text = dateValue
        
    }
    
    
    @objc func datePickerValueChanged11(datePicker: UIDatePicker) {
        
        let dateFormatter = DateFormatter()
        dateFormatter.timeStyle = DateFormatter.Style.medium
        let dateValue = dateFormatter.string(from: datePicker.date)
        eSaturday.text = dateValue
        
    }
    
    @objc func datePickerValueChanged12(datePicker: UIDatePicker) {
        
        let dateFormatter = DateFormatter()
        dateFormatter.timeStyle = DateFormatter.Style.medium
        let dateValue = dateFormatter.string(from: datePicker.date)
        sSunday.text = dateValue
        
    }
    @objc func datePickerValueChanged13(datePicker: UIDatePicker) {
        
        let dateFormatter = DateFormatter()
        dateFormatter.timeStyle = DateFormatter.Style.medium
        let dateValue = dateFormatter.string(from: datePicker.date)
        eSunday.text = dateValue
        
    }

 
    override func viewDidLoad() {
        super.viewDidLoad()
        
        

        
        STMonday.setValue(UIColor.white, forKeyPath: "textColor")
          ETMonday.setValue(UIColor.white, forKeyPath: "textColor")
        
        
        STTuesday.setValue(UIColor.white, forKeyPath: "textColor")
        ETTuesday.setValue(UIColor.white, forKeyPath: "textColor")
        
        STWednesday.setValue(UIColor.white, forKeyPath: "textColor")
        ETWednesday.setValue(UIColor.white, forKeyPath: "textColor")
        
        STThursday.setValue(UIColor.white, forKeyPath: "textColor")
        ETThursday.setValue(UIColor.white, forKeyPath: "textColor")
        
        STFriday.setValue(UIColor.white, forKeyPath: "textColor")
        ETFriday.setValue(UIColor.white, forKeyPath: "textColor")
        
        STSaturday.setValue(UIColor.white, forKeyPath: "textColor")
        ETSaturday.setValue(UIColor.white, forKeyPath: "textColor")
        
        
        STSunday.setValue(UIColor.white, forKeyPath: "textColor")
        ETSunday.setValue(UIColor.white, forKeyPath: "textColor")
        
        
        
        STMonday.addTarget(self, action: #selector(datePickerValueChanged), for: UIControlEvents.valueChanged)
        ETMonday.addTarget(self, action: #selector(datePickerValueChanged1), for: UIControlEvents.valueChanged)
        STTuesday.addTarget(self, action: #selector(datePickerValueChanged2), for: UIControlEvents.valueChanged)
        ETTuesday.addTarget(self, action: #selector(datePickerValueChanged3), for: UIControlEvents.valueChanged)
        STWednesday.addTarget(self, action: #selector(datePickerValueChanged4), for: UIControlEvents.valueChanged)
        ETWednesday.addTarget(self, action: #selector(datePickerValueChanged5), for: UIControlEvents.valueChanged)
        STThursday.addTarget(self, action: #selector(datePickerValueChanged6), for: UIControlEvents.valueChanged)
        ETThursday.addTarget(self, action: #selector(datePickerValueChanged7), for: UIControlEvents.valueChanged)
        STFriday.addTarget(self, action: #selector(datePickerValueChanged8), for: UIControlEvents.valueChanged)
        ETFriday.addTarget(self, action: #selector(datePickerValueChanged9), for: UIControlEvents.valueChanged)
        STSaturday.addTarget(self, action: #selector(datePickerValueChanged10), for: UIControlEvents.valueChanged)
        ETSaturday.addTarget(self, action: #selector(datePickerValueChanged11), for: UIControlEvents.valueChanged)
        STSunday.addTarget(self, action: #selector(datePickerValueChanged12), for: UIControlEvents.valueChanged)
        ETSunday.addTarget(self, action: #selector(datePickerValueChanged13), for: UIControlEvents.valueChanged)
        
        
        lbltitle.text = locTitle
        lblLocType.text = locType 
        
        ref = Database.database().reference()
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
