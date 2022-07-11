//
//  EmergencyViewController.swift
//  Apporio Taxi Driver
//
//  Created by AppOrio on 23/08/17.
//  Copyright © 2017 apporio. All rights reserved.
//

import UIKit
import DropDown

class EmergencyViewController: UIViewController,ParsingStates {
    
    
    var emergencycontactdata: EmergencyResponseModel!
    let dropDown = DropDown()
    
    @IBOutlet weak var selectemergencytext: UILabel!
    
    @IBOutlet weak var dropdownview: UIView!
    
    @IBOutlet weak var callyouremergencytext: UILabel!
    
    
    var PhoneNumber = ""
    
    @IBOutlet weak var closebtnview: UIView!
    
    
    var emergencylistarray = [String]()
    
    var  driverid = NsUserDefaultManager.SingeltonInstance.getuserdetails(key: NsUserDefaultManager.KeyDriverid)!


    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.closebtnview.layer.borderWidth = 1.0
        self.closebtnview.layer.cornerRadius = 4
        self.closebtnview.layer.backgroundColor = UIColor.lightGray.cgColor
        
        
        
        APIManager.sharedInstance.delegate = self
        APIManager.sharedInstance.EmergencyContactUrl()


        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func SelectEmergencybtn_click(_ sender: Any) {
        
        dropDown.anchorView = dropdownview
        dropDown.topOffset = CGPoint(x:0, y: self.dropdownview.bounds.height)
        
        self.dropDown.width = 200
        self.dropDown.cellHeight = 50
        
        
        self.dropDown.show()
        
        dropDown.selectionAction = { [unowned self] (index: Int, item: String) in
            print("Selected item: \(item) at index: \(index)")
            
            self.PhoneNumber = self.emergencycontactdata!.details![index].sosNumber!
            self.selectemergencytext.text = self.emergencycontactdata!.details![index].sosNumber!
            print(self.PhoneNumber)
            
            self.callyouremergencytext.text = self.emergencycontactdata!.details![index].sosName!
            
            
            
            
            self.dropDown.hide()
        }
        
        
        
    }
    
    
    
    @IBAction func callPoliceControl_btn(_ sender: Any) {
        
        APIManager.sharedInstance.delegate = self
        APIManager.sharedInstance.EmergencyContactMessageUrl(RideId: GlobalVariables.rideid, DriverId: self.driverid, UserId: GlobalVariables.custId, SOSNUMBER: "100",Latitude: GlobalVariables.emergencylatitude,Longitude: GlobalVariables.emergencylongitude)
        
        if let url = URL(string: "telprompt://\("100")") {
            UIApplication.shared.openURL(url)
        }
        
    }
    
    @IBAction func callyouremergency_btn(_ sender: Any) {
        
        APIManager.sharedInstance.delegate = self
        APIManager.sharedInstance.EmergencyContactMessageUrl(RideId: GlobalVariables.rideid, DriverId: self.driverid, UserId: GlobalVariables.custId, SOSNUMBER: self.PhoneNumber,Latitude: GlobalVariables.emergencylatitude,Longitude: GlobalVariables.emergencylongitude)
        
        if let url = URL(string: "telprompt://\(self.PhoneNumber)") {
            UIApplication.shared.openURL(url)
        }
        
    }
    
    
    @IBAction func Close_btn(_ sender: Any) {
        dismissViewcontroller()
    }
    
    
    func onSuccessState(_ data: AnyObject , resultCode: Int) {
        
        if(resultCode == 8022){
            
            self.emergencycontactdata = data as! EmergencyResponseModel
            if self.emergencycontactdata.status == 1 {
                
                emergencylistarray.removeAll()
                
                for items in  self.emergencycontactdata.details!
                {
                    
                    
                    emergencylistarray.append(items.sosName!)
                    
                    
                    dropDown.dataSource = emergencylistarray
                    
                }
            }
            
            
        }
        
        
    }
    
   

}
