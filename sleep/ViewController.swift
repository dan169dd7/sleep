//
//  ViewController.swift
//  sleep
//
//  Created by User16 on 2019/1/3.
//  Copyright © 2019 User16. All rights reserved.
//

import UIKit



class ViewController: UIViewController,UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout{

    
    @IBOutlet weak var calendar: UICollectionView!
    @IBOutlet weak var timelabel: UILabel!
    
    
    @IBOutlet weak var nowlabel: UILabel!
    
    var currentYear = Calendar.current.component(.year, from: Date())
    var currentMonth = Calendar.current.component(.month, from: Date())
    
    var timer:Timer?
    var i = 0
    
    
    
 
    
    
    
    
    var months = ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"]
    
    
    
    var numberOfDaysInThisMonth:Int{
        let dateComponents = DateComponents(year: currentYear ,
                                            month: currentMonth)
        let date = Calendar.current.date(from: dateComponents)!
        let range = Calendar.current.range(of: .day, in: .month,
                                           for: date)
        return range?.count ?? 0
    }
    
    var whatDayIsIt:Int{
        let dateComponents = DateComponents(year: currentYear ,
                                            month: currentMonth)
        let date = Calendar.current.date(from: dateComponents)!
        return Calendar.current.component(.weekday, from: date)
    }
    
    
    var howManyItemsShouldIAdd:Int{
        return whatDayIsIt - 1
    }
    
    @IBAction func nextmonth(_ sender: Any) {
        
        currentMonth += 1
        if currentMonth == 13{
            currentMonth = 1
            currentYear += 1
        }
        setUp()
        
    }
    
    
    @IBAction func lastmonth(_ sender: Any) {
        
        currentMonth -= 1
        if currentMonth == 0{
            currentMonth = 12
            currentYear -= 1
        }
        setUp()
        
    }
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        timer = Timer.scheduledTimer(withTimeInterval:1,repeats:true){(_)in
            
         
            // 獲取當前時間
            
            let now:Date = Date()
            
            // 建立時間格式
            
            let dateFormat:DateFormatter = DateFormatter()
            
            dateFormat.dateFormat = "HH:mm:ss"
            
            // 將當下時間轉換成設定的時間格式
            
            let dateString:String = dateFormat.string(from: now)
            
            self.nowlabel.text="\(dateString)"
    
        }
        
        // Do any additional setup after loading the view, typically from a nib.
        setUp()
        
      
        
    }

   //日期
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        numberOfItemsInSection section: Int) -> Int {
       return numberOfDaysInThisMonth + howManyItemsShouldIAdd
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell =
            collectionView.dequeueReusableCell(withReuseIdentifier:
                "cell", for: indexPath)
        if let textLabel = cell.contentView.subviews[0] as? UILabel{
            if indexPath.row < howManyItemsShouldIAdd{
                textLabel.text = ""
            }else{
                textLabel.text =
                "\(indexPath.row + 1 - howManyItemsShouldIAdd)"
            }
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = collectionView.frame.width / 7
        return CGSize(width: width, height: 40)
    }
    
    func setUp(){
        
        timelabel.text = months[currentMonth - 1] + " \(currentYear)"
        calendar.reloadData()
        
    }
    
    
   
   
    @IBOutlet var selectdate: UIDatePicker!
    
    @IBAction func see(_ sender: Any) {
        
        
        let dateFormatter = DateFormatter()
        
        dateFormatter.dateFormat = "yyyy-MM-dd"
        
        let  selectDates = dateFormatter.string(from: selectdate.date)
    
        
        let list1 = UserDefaults.standard
        
        list1.set(selectDates, forKey: "selectdate")
        
    }
    
}

