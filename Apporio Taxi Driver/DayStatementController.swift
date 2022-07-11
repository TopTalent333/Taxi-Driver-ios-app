//
//  DayStatementController.swift
//  Apporio Taxi Driver
//
//  Created by Nitu on 14/07/17.
//  Copyright © 2017 apporio. All rights reserved.
//

import UIKit
import Firebase

class DayStatementController: UIViewController , ParsingStates, UITableViewDataSource , UITableViewDelegate {
    
    var selectedday = ""
    var mydata: DayStatement!
    var driverreportdata: DriverReportModel!
    
    var daysize = 0
    @IBOutlet weak var dayTable: UITableView!
    
    
    @IBOutlet weak var totalearningview: UIView!
    
    @IBOutlet weak var totalamountview: UIView!
    
    @IBOutlet weak var totalAmountLabel: UILabel!
    @IBOutlet weak var taxiFeeLabel: UILabel!
    @IBOutlet weak var fareEarnedLabel: UILabel!
    @IBOutlet weak var completedTripsLabel: UILabel!
    @IBOutlet weak var totalEarningLabel: UILabel!
    @IBOutlet weak var oneDateLabel: UILabel!
    
    @IBOutlet weak var onlinetimetext: UILabel!
    
    @IBOutlet weak var acceptanceratetext: UILabel!
    
    @IBOutlet weak var ratingvaluetext: UILabel!
    
    @IBAction func back_click(_ sender: Any) {
        dismissViewcontroller()
    }
     let driverid =   NsUserDefaultManager.SingeltonInstance.getuserdetails(key: NsUserDefaultManager.KeyDriverid)!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
            
        totalearningview.layer.shadowColor = UIColor.gray.cgColor
        totalearningview.layer.shadowOpacity = 1
        totalearningview.layer.shadowOffset = CGSize(width: 0, height: 2)
        totalearningview.layer.shadowRadius = 2
        
        totalamountview.layer.shadowColor = UIColor.gray.cgColor
        totalamountview.layer.shadowOpacity = 1
        totalamountview.layer.shadowOffset = CGSize(width: 0, height: 2)
        totalamountview.layer.shadowRadius = 2
        
        APIManager.sharedInstance.delegate = self
        APIManager.sharedInstance.Driverdaystatement(self.driverid, date: self.selectedday)
        
        
        
        
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return self.daysize
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        
        let cell = dayTable.dequeueReusableCell(withIdentifier: "dayCell", for: indexPath as IndexPath)
        
        
        let mainview : UIView = (cell.contentView.viewWithTag(3) as? UIView)!
        let totalearning : UILabel = (cell.contentView.viewWithTag(2) as? UILabel)!
        let rideid : UILabel = (cell.contentView.viewWithTag(1) as? UILabel)!
        
        mainview.layer.shadowColor = UIColor.gray.cgColor
        mainview.layer.shadowOpacity = 1
        mainview.layer.shadowOffset = CGSize(width: 0, height: 2)
        mainview.layer.shadowRadius = 2

        if (self.mydata.details?.fullRideDetails?[indexPath.row].amount!)! == "0.00"{
            
            mainview.isHidden = true
            
        }else{
            
              mainview.isHidden = false
        totalearning.text =  GlobalVariables.currencysymbol + " " + (self.mydata.details?.fullRideDetails?[indexPath.row].amount!)!
        rideid.text = "CNR" + (self.mydata.details?.fullRideDetails?[indexPath.row].rideId!)! + " " + (self.mydata.details?.fullRideDetails?[indexPath.row].rideTime!)!
            
        
        }
        return cell
        
        
        
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        dayTable.deselectRow(at: indexPath, animated: true)
        let row = indexPath.row
        print("Row: \(row)")
        if (self.mydata.details?.fullRideDetails?[indexPath.row].amount!)! != "0.00"{
            let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
            let next = storyBoard.instantiateViewController(withIdentifier: "FullDetailsViewController") as! FullDetailsViewController
           next.rideid = (self.mydata.details?.fullRideDetails?[indexPath.row].rideId!)!
            next.ridestausvalue = "7"
            next.ridemode = "1"
            self.present(next, animated:true, completion:nil)
            
        }
    }

    func onSuccessState(_ data: AnyObject , resultCode: Int) {
        
        if resultCode == 667{
            
            self.mydata = data as! DayStatement
            
            if(self.mydata.result == 419){
                
                NsUserDefaultManager.SingeltonInstance.logOut()
                let storyboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
                let next: SplashViewController = storyboard.instantiateViewController(withIdentifier: "SplashViewController") as! SplashViewController
                self.present(next, animated: true, completion: nil)
                
                
                
            }else if(mydata.result == 0){
                
            dayTable.isHidden = true
                
                
            }else{
                
                dayTable.isHidden = false
               
                oneDateLabel.text = mydata.details?.date
                completedTripsLabel.text = mydata.details?.rides
                
                totalAmountLabel.text = GlobalVariables.currencysymbol + " " + (mydata.details?.amount)!
             taxiFeeLabel.text =  GlobalVariables.currencysymbol + " " + (mydata.details?.companyCut)!
               fareEarnedLabel.text =  GlobalVariables.currencysymbol + " " + (mydata.details?.fareRecevied)!
                totalEarningLabel.text =  GlobalVariables.currencysymbol + " " + (mydata.details?.amount)!
                
                daysize = (self.mydata.details?.fullRideDetails?.count)!
                 print(daysize)
                dayTable.reloadData()
                
                APIManager.sharedInstance.delegate = self
                APIManager.sharedInstance.DriverReportUrl(DriverId: self.driverid)
                
            }
            
        }
        
          if resultCode == 8024{
            
            self.driverreportdata = data as! DriverReportModel
            
            if(self.driverreportdata.status == 419){
                
                NsUserDefaultManager.SingeltonInstance.logOut()
                let storyboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
                let next: SplashViewController = storyboard.instantiateViewController(withIdentifier: "SplashViewController") as! SplashViewController
                self.present(next, animated: true, completion: nil)
                
                
                
            }else if(self.driverreportdata.status == 1){
                
                
                acceptanceratetext.text = driverreportdata.details?.dailyAcceptanceRate
                onlinetimetext.text = driverreportdata.details?.onlineTime
                //ratingvaluetext.text = Int((driverreportdata.details?.avrageRating)!)
                
            
            }else{
            
            
            }
            
            
            
            
        }
    }

    
}
