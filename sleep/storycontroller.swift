//
//  storycontroller.swift
//  sleep
//
//  Created by User23 on 2019/1/12.
//  Copyright © 2019 User16. All rights reserved.
//

import UIKit

class storycontroller: UIViewController {

    
    
    @IBOutlet var t: UITextField!
    @IBOutlet var c: UITextView!
    
    @IBAction func save(_ sender: Any) {
        
        
        if let date = UserDefaults.standard.object(forKey: "next") as? String {
            
           
            
            let  titles = t.text
            let  content = c.text
            
            let list1 = UserDefaults.standard
            list1.set(titles, forKey: date+"title")
            list1.set(content, forKey: date+"content")
        
            //alert
            let alert = UIAlertController(title: "Saved", message: "✓", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "okay", style: .default, handler: nil))
            self.present(alert, animated: true, completion: nil)
            
        }
       
    }
    
   


    override func viewDidLoad() {
        super.viewDidLoad()

       
    }

   
}
