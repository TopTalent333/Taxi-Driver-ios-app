//
//  ReasonDialogViewController.swift
//  Apporio Taxi Driver
//
//  Created by AppOrio on 09/06/17.
//  Copyright © 2017 apporio. All rights reserved.
//

import UIKit
import Firebase

class ReasonDialogViewController: UIViewController,UITableViewDataSource,UITableViewDelegate,ParsingStates {
    
    var reasonData: ReasonModel!
    
     var cancelData: CancelRideModel!
    
    var rentalridecanceldata: RentalRideCancelModel!
    
    var rentalcancelreasondata: RentalCancelReasonModel!
    
    var movefrom = ""
    
     var ref = Database.database().reference()
    
    var SIZE = 0
    
    var check = 1000
    
    @IBOutlet weak var mainView: UIView!
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var cancel_btn: UIButton!
    
    @IBOutlet weak var notCancel_btn: UIButton!
    
    
    @IBOutlet weak var selectreasonlabel: UILabel!
    
    let driverid =   NsUserDefaultManager.SingeltonInstance.getuserdetails(key: NsUserDefaultManager.KeyDriverid)!


    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.clear
        view.isOpaque = false
        cancel_btn.isEnabled = false
        cancel_btn.layer.backgroundColor = ReasonDialogViewController.getColorFromHex("#979897").cgColor
        
        if movefrom == "Rentaltype"{
            
          //  APIManager.sharedInstance.delegate = self
           // APIManager.sharedInstance.RentalCancelReason()
            
            APIManager.sharedInstance.delegate = self
            APIManager.sharedInstance.reasonCancel()
            
            
        }else{
            APIManager.sharedInstance.delegate = self
            APIManager.sharedInstance.reasonCancel()
        }
       // APIManager.sharedInstance.delegate = self
       // APIManager.sharedInstance.reasonCancel()


        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    class func getColorFromHex(_ hexString:String)->UIColor{
        
        var rgbValue : UInt32 = 0
        let scanner:Scanner =  Scanner(string: hexString)
        
        scanner.scanLocation = 1
        scanner.scanHexInt32(&rgbValue)
        
        return UIColor(red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0, green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0, blue: CGFloat(rgbValue & 0x0000FF) / 255.0, alpha: CGFloat(1.0))
    }
    
    
    @IBAction func cancel_btn_click(_ sender: Any) {
        
        if movefrom == "Rentaltype"{
            
            
            
            APIManager.sharedInstance.delegate = self
            APIManager.sharedInstance.RentalDriverCancel(RentalBookindId: GlobalVariables.rideid, DriverId: self.driverid)
            
        }else{
            
            APIManager.sharedInstance.delegate = self
            APIManager.sharedInstance.CancelDriver(GlobalVariables.rideid)
            
            
        }
       // APIManager.sharedInstance.delegate = self
      //  APIManager.sharedInstance.CancelDriver(GlobalVariables.rideid)

    }
    
    @IBAction func not_cancel_btn_click(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
        
    }
    
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return SIZE
    }
    
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "reasonCell", for: indexPath) as! ReasonCell
        cell.selectionStyle = .none
        
        if movefrom == "Rentaltype"{
            
            
           // cell.reasonText.text = self.rentalcancelreasondata.details![indexPath.row].reasonName
            cell.reasonText.text = self.reasonData.msg![indexPath.row].reasonName!

            
        }else{
            
            cell.reasonText.text = self.reasonData.msg![indexPath.row].reasonName!
            
        }
        if(check == indexPath.row)
        {
            
            cell.checkRadioBtn.image = UIImage(named: "radio_checked")
            
        }else{
            cell.checkRadioBtn.image = UIImage(named: "radio_unchecked")
            
        }

        return cell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        tableView.deselectRow(at: indexPath, animated: true)
        // let cells = tableView.cellForRow(at: indexPath) as! ReasonCell
        let cells = tableView.cellForRow(at: indexPath) as! ReasonCell
        let row = indexPath.row
        check = indexPath.row
        print("Row:\(row)")
        cancel_btn.isEnabled = true
        
        if movefrom == "Rentaltype"{
            //GlobalVariables.cancelId = self.rentalcancelreasondata.details![row].reasonId!
             GlobalVariables.cancelId = self.reasonData.msg![row].reasonId!
        }else{
            GlobalVariables.cancelId = self.reasonData.msg![row].reasonId!
        }
       // GlobalVariables.cancelId = self.reasonData.msg![row].reasonId!
        print(GlobalVariables.cancelId)
        cancel_btn.layer.backgroundColor = ReasonDialogViewController.getColorFromHex("#46C47B").cgColor
        tableView.reloadData()
        
        
    }
    
    
    func showAlertMessage(_ title:String,Message:String){
        
        let alert = UIAlertController(title: title, message: Message, preferredStyle: .alert)
        let action = UIAlertAction(title: NSLocalizedString("OK", comment: ""), style: .default) { _ in
            
        }
        alert.addAction(action)
        self.present(alert, animated: true){}
    }
    
    
    func onSuccessState(_ data: AnyObject , resultCode: Int) {
        
        if resultCode == 1005{
            
            self.reasonData = data as! ReasonModel
            if self.reasonData.result == 1{
                
                if let size = self.reasonData.msg?.count
                {
                    SIZE = size
                    
                }
                
                self.tableView.reloadData()
                
                
            }
            
        }
        
        if resultCode == 8013{
            
            
            self.rentalcancelreasondata = data as! RentalCancelReasonModel
            if self.rentalcancelreasondata.status == 1{
                
                if let size = self.rentalcancelreasondata.details?.count
                {
                    SIZE = size
                    
                }
                
                self.tableView.reloadData()
                
                
            }
            
            
            
            
        }

        
        if resultCode == 1006{
            self.cancelData = data as! CancelRideModel
            
            if self.cancelData.result == 1{
                
                let alert = UIAlertController(title: "", message: NSLocalizedString("Booking Cancelled !", comment: ""), preferredStyle: .alert)
                let action = UIAlertAction(title: NSLocalizedString("OK", comment: ""), style: .default) { _ in
                   /* let storyboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
                    let next: OnLineViewController = storyboard.instantiateViewController(withIdentifier: "OnLineViewController") as! OnLineViewController
                    self.present(next, animated: true, completion: nil)*/
                    
                    let Message: NSDictionary = ["changed_destination": "0","ride_id": GlobalVariables.rideid,"ride_status": "9","done_ride_id": ""]
                    
                    self.ref.child("RideTable").child(GlobalVariables.rideid).setValue(Message)
                    

                    
                    
                    let storyboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
                    let nextController: OnLineViewController = storyboard.instantiateViewController(withIdentifier: "OnLineViewController") as! OnLineViewController
                    
                    if let window = self.view.window{
                        window.rootViewController = nextController
                    }
                    
                }
                alert.addAction(action)
                self.present(alert, animated: true){}
                
                
            }
        }
        
        
        if resultCode == 8021{
            
            self.rentalridecanceldata = data as! RentalRideCancelModel
            
            if self.rentalridecanceldata.status == 0
            {
            
                self.showAlertMessage("", Message: self.rentalridecanceldata.message!)
            
            }else{
            
                let alert = UIAlertController(title: "", message:self.rentalridecanceldata.message!, preferredStyle: .alert)
                let action = UIAlertAction(title: NSLocalizedString("OK", comment: ""), style: .default) { _ in
                    /* let storyboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
                     let next: OnLineViewController = storyboard.instantiateViewController(withIdentifier: "OnLineViewController") as! OnLineViewController
                     self.present(next, animated: true, completion: nil)*/
                    
                    let Message: NSDictionary = ["changed_destination": "0","ride_id": GlobalVariables.rideid,"ride_status": "18","done_ride_id": ""]
                    
                    self.ref.child("RideTable").child(GlobalVariables.rideid).setValue(Message)
                    

                    
                    
                    let storyboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
                    let nextController: OnLineViewController = storyboard.instantiateViewController(withIdentifier: "OnLineViewController") as! OnLineViewController
                    
                    if let window = self.view.window{
                        window.rootViewController = nextController
                    }
                    
                }
                alert.addAction(action)
                self.present(alert, animated: true){}

            }
            
            
        }
        
    }
    
    
    

    



}
