

import UIKit

class diaryController: UITableViewController {

   
    @IBOutlet var date: UILabel!
    @IBOutlet weak var w: UILabel!
    @IBOutlet var s: UILabel!
    @IBOutlet var t: UILabel!
    @IBOutlet var c: UITextView!
    @IBOutlet var thisday: UILabel!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        if let selectdate = UserDefaults.standard.object(forKey: "selectdate") as? String {
            
            
            thisday.text="In "+selectdate+"...."
            
            if let wtime = UserDefaults.standard.object(forKey: selectdate+"w") as? String {
                
                w.text = "You woke up at "+wtime
            }
            
            
            if let stime = UserDefaults.standard.object(forKey: selectdate+"s") as? String {
                
                s.text = "You went to bed at "+stime
            }
            
       
        
        if let titles = UserDefaults.standard.object(forKey: selectdate+"title") as? String {
            
            t.text = titles
        }
        
        if let content = UserDefaults.standard.object(forKey: selectdate+"content") as? String {
            
            c.text = content
        }
            
      }
        
    }
}
