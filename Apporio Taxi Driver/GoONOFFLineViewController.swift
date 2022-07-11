//
//  GoONOFFLineViewController.swift
//  Apporio Taxi Driver
//
//  Created by AppOrio on 16/06/17.
//  Copyright © 2017 apporio. All rights reserved.
//

import UIKit
import Firebase

class GoONOFFLineViewController: UIViewController,ParsingStates {
    
    
    @IBOutlet weak var goondutyview: UIView!
    
    @IBOutlet weak var gooffdutyview: UIView!
    
    @IBOutlet weak var goofflinebtnview: UIView!
       
    @IBOutlet weak var goonlinebtnview: UIView!
    
    var viewcontrollerself : UIViewController!

    
      var ref = Database.database().reference()
      var data: OnLineOffline!
    
    
    var defaultdrivertoken = NsUserDefaultManager.SingeltonInstance.getuserdetails(key: NsUserDefaultManager.KeyDriverToken)!
    
    var onoffstatus = ""
    
    var drivername = NsUserDefaultManager.SingeltonInstance.getuserdetails(key: NsUserDefaultManager.KeyDrivername)!
    
    var driveremail = NsUserDefaultManager.SingeltonInstance.getuserdetails(key: NsUserDefaultManager.KeyDriverEmail)!
    
    var driverphone = NsUserDefaultManager.SingeltonInstance.getuserdetails(key: NsUserDefaultManager.KeyPhoneno)!
    
    var driverdeviceid = NsUserDefaultManager.SingeltonInstance.getuserdetails(key: NsUserDefaultManager.KeyDeviceId)!
    
    var driverimage = NsUserDefaultManager.SingeltonInstance.getuserdetails(key: NsUserDefaultManager.KeyDriverImage)!
    var driverpassword = NsUserDefaultManager.SingeltonInstance.getuserdetails(key: NsUserDefaultManager.KeyPassword)!
    var driverflag = NsUserDefaultManager.SingeltonInstance.getuserdetails(key: NsUserDefaultManager.KeyFlag)!
    
    var drivercartypename = NsUserDefaultManager.SingeltonInstance.getuserdetails(key: NsUserDefaultManager.KeyCarName)!
    
    var drivercarmodelname = NsUserDefaultManager.SingeltonInstance.getuserdetails(key: NsUserDefaultManager.KeyCarModelName)!
    
    var drivercarno = NsUserDefaultManager.SingeltonInstance.getuserdetails(key: NsUserDefaultManager.KeyCarNo)!
    
    var drivercityid = NsUserDefaultManager.SingeltonInstance.getuserdetails(key: NsUserDefaultManager.KeyCityId)!
    
    var drivermodelid = NsUserDefaultManager.SingeltonInstance.getuserdetails(key: NsUserDefaultManager.KeyCarModelid)!
    
    
    var loginlogoutstatus = NsUserDefaultManager.SingeltonInstance.getuserdetails(key: NsUserDefaultManager.KeyLoginLogout)!
    
    
    var cartypeid = NsUserDefaultManager.SingeltonInstance.getuserdetails(key: NsUserDefaultManager.KeyCarType)!
    
    var  driverid = NsUserDefaultManager.SingeltonInstance.getuserdetails(key: NsUserDefaultManager.KeyDriverid)!
    
    
    
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.clear
        view.isOpaque = false
        
        
        if GlobalVariables.checkvaluedriverpressonoffbtn == 0{
        
        goondutyview.isHidden = true
            gooffdutyview.isHidden = false
            goonlinebtnview.isHidden = false
            goofflinebtnview.isHidden = true
            
            goonlinebtnview.layer.shadowColor = UIColor.gray.cgColor
            goonlinebtnview.layer.shadowOpacity = 1
            goonlinebtnview.layer.shadowOffset = CGSize(width: 0, height: 2)
            goonlinebtnview.layer.shadowRadius = 3
            
        
        }
        if GlobalVariables.checkvaluedriverpressonoffbtn == 1{
            
            goondutyview.isHidden = false
            gooffdutyview.isHidden = true
            goonlinebtnview.isHidden = true
            goofflinebtnview.isHidden = false
            
            goofflinebtnview.layer.shadowColor = UIColor.gray.cgColor
            goofflinebtnview.layer.shadowOpacity = 1
            goofflinebtnview.layer.shadowOffset = CGSize(width: 0, height: 2)
            goofflinebtnview.layer.shadowRadius = 3

            
        }


        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func ondutycancelbtn(_ sender: Any) {
        dismissViewcontroller()
        self.viewcontrollerself.viewWillAppear(true)
    }
    
    @IBAction func offdutycancelbtn(_ sender: Any) {
        dismissViewcontroller()
        self.viewcontrollerself.viewWillAppear(true)
    }
    
    @IBAction func Goofflinebtn_click(_ sender: Any) {
        
        onoffstatus = "2"
        let Message: NSDictionary = ["driver_id": self.driverid , "driver_name": self.drivername , "driver_phone": self.driverphone , "driver_email": self.driveremail , "driver_image": self.driverimage , "driver_password": self.driverpassword , "driver_token": self.defaultdrivertoken , "driver_device_id": self.driverdeviceid , "driver_flag": self.driverflag,"driver_rating": "" ,"driver_car_type_id": self.cartypeid ,"driver_model_id": self.drivermodelid ,"driver_number": self.drivercarno , "driver_city_id": self.drivercityid ,"driver_registration_date": "" ,"driver_lisence": "" ,"driver_rc": "" ,"driver_insurence": "" ,"driver_other_doc": "" ,"driver_last_update": "" ,"driver_last_update_date": "" ,"driver_completed_rides": "" ,"driver_rejected_rides": "" ,"driver_cancelled_rides": "" ,"driver_login_logout": "1" ,"driver_busy_status": "" ,"driver_online_offline_status": self.onoffstatus ,"driver_detail_status": "" ,"driver_admin_status": "" ,"driver_car_type_name": self.drivercartypename ,"driver_car_model_name": self.drivercarmodelname ,"driver_current_latitude": Lat ,"driver_current_longitude": Lng ,"driver_location_text": GlobalVariables.driverLocation ,"timestamp": "","bearingfactor": String(GlobalVariables.radiansBearing)]
        
        self.ref.child("Drivers_A").child(self.driverid).setValue(Message)
        
        
        APIManager.sharedInstance.delegate = self
        APIManager.sharedInstance.goOnline(driverid: driverid, onlineOffline: "2",driverToken: defaultdrivertoken)

        
        
        
    }
    
    @IBAction func Goonlinebtn_click(_ sender: Any) {
        
        onoffstatus = "1"
        let Message: NSDictionary = ["driver_id": self.driverid , "driver_name": self.drivername , "driver_phone": self.driverphone , "driver_email": self.driveremail , "driver_image": self.driverimage , "driver_password": self.driverpassword , "driver_token": self.defaultdrivertoken , "driver_device_id": self.driverdeviceid , "driver_flag": self.driverflag,"driver_rating": "" ,"driver_car_type_id": self.cartypeid ,"driver_model_id": self.drivermodelid ,"driver_number": self.drivercarno , "driver_city_id": self.drivercityid ,"driver_registration_date": "" ,"driver_lisence": "" ,"driver_rc": "" ,"driver_insurence": "" ,"driver_other_doc": "" ,"driver_last_update": "" ,"driver_last_update_date": "" ,"driver_completed_rides": "" ,"driver_rejected_rides": "" ,"driver_cancelled_rides": "" ,"driver_login_logout": "1" ,"driver_busy_status": "" ,"driver_online_offline_status": self.onoffstatus ,"driver_detail_status": "" ,"driver_admin_status": "" ,"driver_car_type_name": self.drivercartypename ,"driver_car_model_name": self.drivercarmodelname ,"driver_current_latitude": Lat ,"driver_current_longitude": Lng ,"driver_location_text": GlobalVariables.driverLocation ,"timestamp": "","bearingfactor": String(GlobalVariables.radiansBearing)]
        
        self.ref.child("Drivers_A").child(self.driverid).setValue(Message)
        
        
        APIManager.sharedInstance.delegate = self
        APIManager.sharedInstance.goOnline(driverid: driverid, onlineOffline: "1",driverToken: defaultdrivertoken)

        
    }
    
    func onSuccessState(_ data: AnyObject , resultCode: Int) {
        
        if (resultCode == 88){
            self.data = data as! OnLineOffline
            if(self.data.result == 419){
                
                NsUserDefaultManager.SingeltonInstance.logOut()
                let storyboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
                let next: SplashViewController = storyboard.instantiateViewController(withIdentifier: "SplashViewController") as! SplashViewController
                self.present(next, animated: true, completion: nil)
                
                
            }else if(self.data.result == 1){
                
                if self.data.msg == "Online"{
                GlobalVariables.checkvaluedriverpressonoffbtn = 1
                    
                    
                     UserDefaults.standard.setValue("1", forKey:"onoffline_status")
                    
                }else if self.data.msg == "Offline"{
                GlobalVariables.checkvaluedriverpressonoffbtn = 0
                   
                     UserDefaults.standard.setValue("2", forKey:"onoffline_status")
                    }
                
              //  self.showAlertMessage("", Message: (self.data.msg!))
                dismissViewcontroller()
                self.viewcontrollerself.viewWillAppear(true)
              
            }
        }
    }

   
}
