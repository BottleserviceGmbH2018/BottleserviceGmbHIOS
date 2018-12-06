//
//  SetForGuest1.swift
//  BottleServiceApp
//
//  Created by David Olarte on 21.05.18.
//  Copyright © 2018 Iselacher Digital Media Factory. All rights reserved.
//

import UIKit

class SetForGuest1: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        
        if pickerView == pickerMonths {
        return 1
        } else {
            return 1
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if pickerView == pickerMonths {
          return pickerMonthData.count
        } else {
            return pickerTimeD.count
        }
        
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        if pickerView == pickerMonths  {
        return pickerMonthData[row]
        } else {
            return pickerTimeD[row]
        }
    }

    
    @IBOutlet weak var pickerMonths: UIPickerView!
    
    var pickerMonthData:[String] = [String]()
    var pickerTimeD: [String] = [String]()
    
    @IBOutlet weak var pickerTimeData: UIPickerView!

    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.pickerMonths.setValue(UIColor.white, forKey: "textColor")
        self.pickerMonths.delegate = self
        self.pickerMonths.dataSource = self
        
        self.pickerTimeData.setValue(UIColor.white, forKey: "textColor")
        self.pickerTimeData.delegate = self
        self.pickerTimeData.dataSource = self
        
     
        pickerTimeD = ["First Day 12:00 PM","First Day 1:00 PM","First Day 2:00 PM","First Day 3:00 PM","First Day 4:00 PM","First Day 5:00 PM","First Day 6:00 PM","First Day 7:00 PM","First Day 8:00 PM","First Day 9:00 PM","First Day 10:00 PM","First Day 11:00 PM","First Day 12:00 AM","First Day 12:00 PM","First Day 1:00 AM","First Day 2:00 AM","First Day 3:00 AM","First Day 4:00 AM","First Day 5:00 AM","First Day 6:00 AM","First Day 7:00 AM","First Day 8:00 AM","First Day 9:00 AM","First Day 10:00 AM","First Day 11:00 AM", "Second Day 12:00 PM","Second Day 1:00 PM","Second Day 2:00 PM","Second Day 3:00 PM","Second Day 4:00 PM","Second Day 5:00 PM","Second Day 6:00 PM","Second Day 7:00 PM","Second Day 8:00 PM","Second Day 9:00 PM","Second Day 10:00 PM","Second Day 11:00 PM","Second Day 12:00 AM","Second Day 12:00 PM","Second Day 1:00 AM","Second Day 2:00 AM","Second Day 3:00 AM","Second Day 4:00 AM","Second Day 5:00 AM","Second Day 6:00 AM","Second Day 7:00 AM","Second Day 8:00 AM","Second Day 9:00 AM","Second Day 10:00 AM","Second Day 11:00 AM"]
        pickerMonthData = ["All Future Dates","January","February","March","April","May","June","July","August","September","October","November","December"]
        
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
