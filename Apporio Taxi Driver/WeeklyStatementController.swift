//
//  WeeklyStatementController.swift
//  Apporio Taxi Driver
//
//  Created by Nitu on 14/07/17.
//  Copyright © 2017 apporio. All rights reserved.
//

import UIKit
import Firebase

class WeeklyStatementController: UIViewController , UITableViewDataSource , UITableViewDelegate,ParsingStates {

    var newdata: DriverEarningNew!
    
    var weekdata: DriverEarningNew!
    
    var movefrom = ""
    var dateSelected = ""
    
    
    let driverid =   NsUserDefaultManager.SingeltonInstance.getuserdetails(key: NsUserDefaultManager.KeyDriverid)!

    
    @IBOutlet weak var weekTable: UITableView!
    
    @IBOutlet weak var totaleaningview: UIView!
    
    @IBOutlet weak var totalamountview: UIView!
   
    @IBOutlet weak var totalAmountLabel: UILabel!
    @IBOutlet weak var taxiFeeLabel: UILabel!
    @IBOutlet weak var fareEarnedLabel: UILabel!
    @IBOutlet weak var completedTripsLabel: UILabel!
    @IBOutlet weak var totalEarningLabel: UILabel!
    @IBOutlet weak var weekDateLabel: UILabel!
    var selecteddate = ""
    var tableSize = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        totaleaningview.layer.shadowColor = UIColor.gray.cgColor
        totaleaningview.layer.shadowOpacity = 1
        totaleaningview.layer.shadowOffset = CGSize(width: 0, height: 2)
        totaleaningview.layer.shadowRadius = 2
        
        totalamountview.layer.shadowColor = UIColor.gray.cgColor
        totalamountview.layer.shadowOpacity = 1
        totalamountview.layer.shadowOffset = CGSize(width: 0, height: 2)
        totalamountview.layer.shadowRadius = 2
        
        
        
        if movefrom == "calender" {
            
            APIManager.sharedInstance.delegate = self
            APIManager.sharedInstance.DriverSelectDateStatement(driverid: self.driverid, Date: dateSelected)
            
        }else{

        
        print(newdata.details?.count)
        
        totalEarningLabel.text = GlobalVariables.currencysymbol + " " + String(self.newdata.weeklyAmount!)
        completedTripsLabel.text = String(self.newdata.totalRides!)
        
        fareEarnedLabel.text = GlobalVariables.currencysymbol + " " + self.newdata.fareRecevied!
        taxiFeeLabel.text = GlobalVariables.currencysymbol + " " + self.newdata.companyCut!
        totalAmountLabel.text = GlobalVariables.currencysymbol + " " + String(self.newdata.weeklyAmount!)
        tableSize = (self.newdata.details?.count)!
        
        if tableSize != 0  {
            weekDateLabel.text = (self.newdata.details?[0].date!)! + " to " +  (self.newdata.details?[6].date!)!
            weekTable.isHidden = false

            weekTable.reloadData()
        
        }
        else{
            weekTable.isHidden = true
        }
            
            
        }
    }
    
    
    @IBAction func back_click(_ sender: Any) {
        
        
         if movefrom == "calender" {
            
            self.presentingViewController!.presentingViewController!.dismiss(animated: true, completion: nil)
            
         }else{
        dismissViewcontroller()
        }
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return self.tableSize
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        
        let cell = weekTable.dequeueReusableCell(withIdentifier: "weeklyCell", for: indexPath as IndexPath)
        
        
         let mainview : UIView = (cell.contentView.viewWithTag(3) as? UIView)!
        let totalearning : UILabel = (cell.contentView.viewWithTag(2) as? UILabel)!
        let datelabel : UILabel = (cell.contentView.viewWithTag(1) as? UILabel)!
        
        
        
        
      //  print(self.newdata.details?[indexPath.row].detail?.date ?? "nil come")
      
        
        
        
        
       mainview.layer.shadowColor = UIColor.gray.cgColor
       mainview.layer.shadowOpacity = 1
        mainview.layer.shadowOffset = CGSize(width: 0, height: 2)
        mainview.layer.shadowRadius = 2

        
      
        
        
         if movefrom == "calender" {
            
            let detailswwww = self.weekdata.details?[indexPath.row].detail
            totalearning.text =  GlobalVariables.currencysymbol + " " + (self.weekdata.details?[indexPath.row].detail?.amount)!
            datelabel.text = (self.weekdata.details?[indexPath.row].day)! + " " + (self.weekdata.details?[indexPath.row].date
                )!

            
         }else{
            
              let detailswwww = self.newdata.details?[indexPath.row].detail
            totalearning.text =  GlobalVariables.currencysymbol + " " + (self.newdata.details?[indexPath.row].detail?.amount)!
            datelabel.text = (self.newdata.details?[indexPath.row].day)! + " " + (self.newdata.details?[indexPath.row].date
                )!

        
        
        
        }
        
        
       /* if (self.newdata.details?[indexPath.row].detail?.amount!)! == "0"{
            
            mainview.isHidden = true
            
        }else{*/

       // mainview.isHidden = false
             // }
        
        return cell
        
        
        
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        weekTable.deselectRow(at: indexPath, animated: true)
        let row = indexPath.row
        print("Row: \(row)")
        
        
         if movefrom == "calender" {
            
            
            if (self.weekdata.details?[indexPath.row].detail?.amount!)! == "0"{
                
            }
                
            else{
                let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
                let next = storyBoard.instantiateViewController(withIdentifier: "DayStatementController") as! DayStatementController
                next.selectedday = (self.weekdata.details?[row].date!)!
                self.present(next, animated:true, completion:nil)
                
            }
            
         }else{
        
        if (self.newdata.details?[indexPath.row].detail?.amount!)! == "0"{
         
        }
        
        else{
            let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
            let next = storyBoard.instantiateViewController(withIdentifier: "DayStatementController") as! DayStatementController
            next.selectedday = (self.newdata.details?[row].date!)!
            self.present(next, animated:true, completion:nil)

        }
            
        }
    }
    
    
    func onSuccessState(_ data: AnyObject , resultCode: Int) {
        
        if resultCode == 8018{
            
            weekdata = data as! DriverEarningNew
            
            if (weekdata.result == 0){
            
            
            }else{
            
            
            totalEarningLabel.text = GlobalVariables.currencysymbol + " " + String(self.weekdata.weeklyAmount!)
            completedTripsLabel.text = String(self.weekdata.totalRides!)
            
            fareEarnedLabel.text = GlobalVariables.currencysymbol + " " + self.weekdata.fareRecevied!
            taxiFeeLabel.text = GlobalVariables.currencysymbol + " " + self.weekdata.companyCut!
            totalAmountLabel.text = GlobalVariables.currencysymbol + " " + String(self.weekdata.weeklyAmount!)
            tableSize = (self.weekdata.details?.count)!
            
            if tableSize != 0  {
                weekDateLabel.text = (self.weekdata.details?[0].date!)! + " to " +  (self.weekdata.details?[6].date!)!
                weekTable.isHidden = false
                
                weekTable.reloadData()
                
            }
            else{
                weekTable.isHidden = true
            }
            
            }
            
        }
        
        
    }


}
