//
//  CalenderViewController.swift
//  Apporio Taxi Driver
//
//  Created by AppOrio on 20/07/17.
//  Copyright © 2017 apporio. All rights reserved.
//

import UIKit
import FSCalendar


class CalenderViewController: UIViewController,FSCalendarDataSource, FSCalendarDelegate {
    
    @IBOutlet weak var calender: FSCalendar!
    @IBOutlet weak var calendarHeightConstraint: NSLayoutConstraint!
    
    @IBOutlet weak var toplabel: UILabel!
    
    
    
    var year = 0
    var month = 0
    var day = 0
    
    var movefrom = ""
    
    var checkmovefrom = ""
    
    var selecteddate = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        
        calender.scrollDirection = .vertical
        calender.appearance.caseOptions = [.headerUsesUpperCase,.weekdayUsesUpperCase]
        
        
        calender.scopeGesture.isEnabled = true
        
        
     /*   let date = Date()
        let formatter = DateFormatter()
        
        // formatter.dateFormat = "dd.MM.yyyy"
        // let result = formatter.string(from: date)
        formatter.timeStyle = DateFormatter.Style.none
        formatter.dateStyle = DateFormatter.Style.long
        let CurrentDate = formatter.string(from: date)*/
       // GlobalVarible.CurrentDate = CurrentDate
        
        // calender.select(CurrentDate)
        
        // Do any additional setup after loading the view.
        let date = NSDate()
        let calendar = NSCalendar.current
        
        
    
              // let components = calendar.dateComponents([.year, .month, .day], from: date as Date)
        
      let components =  calendar.dateComponents([.day, .month, .year, .hour], from: date as Date)
        
        year =  components.year!
        month = components.month!
        day = components.day!
        
        let formatter = DateFormatter()
        
        formatter.dateFormat = "yyyy-MM-dd"
        
        selecteddate = formatter.string(from: date as Date)
        
        print(year)
        
        print(month)
        print(day)
        
         if checkmovefrom == "uploaddocument"{
        
        
             toplabel.text = "Select Expiry date of your document"
         }else{
        toplabel.text = ""
        }
        
        //   calender.selectDate(calender.dateWithYear(year, month: month, day: day))
        
        
        
        
       // calender.select(calender.date(withYear: day, month: month, day: day))


        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

 
    
    func minimumDate(for calendar: FSCalendar) -> Date {
                
        if checkmovefrom == "uploaddocument"{
     // let stringDate: String = formatter.string(from: date)
        
        return (self.calender.date(withYear: year, month: month, day: day) as NSDate) as Date
        
        }else{
        
        return (self.calender.date(withYear: 2000, month: 01, day: 01) as NSDate) as Date
            
        }
        

        
        
    }
    
        /*func minimumDateForCalendar(_ calendar: FSCalendar) -> Date {
            
            
            
            return calendar.date(withYear: year, month: month, day: day) as NSDate
            
        }*/
        
        func maximumDateForCalendar(calendar: FSCalendar) -> NSDate {
            return calendar.date(withYear: 2018, month: 10, day: 31) as NSDate
        }
        
        func calendar(_ calendar: FSCalendar, numberOfEventsFor date: Date) -> Int {
            let day = calendar.day(of: date as Date)
            return day % 5 == 0 ? day/5 : 0;
        }
        
        func calendarCurrentPageDidChange(_ calendar: FSCalendar) {
            //NSLog("change page to \(calendar.stringFromDate(calendar.currentPage))")
            
            
        }
    
    
    func calendar(_ calendar: FSCalendar, didSelect date: Date, at monthPosition: FSCalendarMonthPosition) {
        
       // print(calendar.select(date))
        print(date)
        
       let formatter = DateFormatter()
        
        
        formatter.dateFormat = "yyyy-MM-dd"
        
        selecteddate = formatter.string(from: date)
        
        
       
    }
    
    
    
    
  /*     func calendar(_ calendar: FSCalendar, didSelect date: Date) {
            
           // NSLog("calendar did select date \(calendar.stringFromDate(date, format:"dd/MM/yyyy"))")
          
          //  selecteddate = calendar.stringFromDate(date, format:"dd/MM/yyyy")
        
        
        
        }*/
        
        func calendar(_ calendar: FSCalendar, boundingRectWillChange bounds: CGRect, animated: Bool) {
            calendarHeightConstraint.constant = bounds.height
            view.layoutIfNeeded()
        }
    
        func calendar(_ calendar: FSCalendar, imageFor date: Date) -> UIImage? {
            
            return [13,24].contains(calendar.day(of: date)) ? UIImage(named: "icon_cat") : nil
            
          //  return [13,24].containsObject(calendar.dayOfDate(date)) ? UIImage(named: "icon_cat") : nil
        }
    
    @IBAction func okbtn(_ sender: Any) {
        
        
        if checkmovefrom == "uploaddocument"{
            
             if GlobalVariables.movefromcalender == 1{
                
                GlobalVariables.insurancdocumentdate = selecteddate
                self.dismiss(animated: true, completion: nil)
                
            }else  if GlobalVariables.movefromcalender == 2{
                
                GlobalVariables.licensedocumentdate = selecteddate
                self.dismiss(animated: true, completion: nil)
                
             }else  if GlobalVariables.movefromcalender == 3{
                
                GlobalVariables.rcdocumentdate = selecteddate
                 self.dismiss(animated: true, completion: nil)
                
             }else  if GlobalVariables.movefromcalender == 4{
                
                GlobalVariables.documentdateselected = selecteddate
                self.dismiss(animated: true, completion: nil)
                
            }
        
        
        }else{

        
        let storyboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let next: WeeklyStatementController = storyboard.instantiateViewController(withIdentifier: "WeeklyStatementController") as! WeeklyStatementController
        next.movefrom = "calender"
        next.dateSelected = selecteddate
        
        self.present(next, animated: true, completion: nil)
        }
        
    }
    
    
    @IBAction func cancelbtn(_ sender: Any) {
        
        self.dismiss(animated: true, completion: nil)
    }
    
    


}
