//
//  tablecontroller.swift
//  sleep
//
//  Created by User16 on 2019/1/9.
//  Copyright © 2019 User16. All rights reserved.
//

import UIKit

class tablecontroller: UITableViewController {

    

    @IBOutlet weak var waketime: UIDatePicker!
    @IBOutlet weak var sleeptime: UIDatePicker!
    
    
    @IBAction func wakebtn(_ sender: Any) {//起床時間保存
        
        let dateFormatter = DateFormatter()
        let timeFormatter = DateFormatter()
        
        dateFormatter.dateFormat = "yyyy-MM-dd"
        timeFormatter.dateFormat = "hh:mm"
        
        let  Datew = dateFormatter.string(from: waketime.date)
        let  selectedwDate = timeFormatter.string(from: waketime.date)
        
        let list1 = UserDefaults.standard
        list1.set(selectedwDate, forKey: Datew+"w")
    
        
        //alert
        let alert = UIAlertController(title: "Saved", message: "✓", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "okay", style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
     
    @IBAction func sleepbtn(_ sender: Any) {//睡覺時間保存
        
        
        let dateFormatter = DateFormatter()
        let timeFormatter = DateFormatter()
        
        dateFormatter.dateFormat = "yyyy-MM-dd"
        timeFormatter.dateFormat = "hh:mm"
        
        let  Dates = dateFormatter.string(from: sleeptime.date)
        let  selectedwDate = timeFormatter.string(from: sleeptime.date)
        
        let list1 = UserDefaults.standard
        list1.set(selectedwDate, forKey: Dates+"s")
        
        list1.set(Dates, forKey: "next")
        
        //alert
        let alert = UIAlertController(title: "Saved", message: "✓", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "okay", style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    
    
}
