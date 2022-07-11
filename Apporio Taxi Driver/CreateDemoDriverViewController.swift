//
//  CreateDemoDriverViewController.swift
//  Apporio Taxi Driver
//
//  Created by AppOrio on 26/07/17.
//  Copyright © 2017 apporio. All rights reserved.
//

import UIKit
import Firebase

class CreateDemoDriverViewController: UIViewController,ParsingStates {
    
    
    @IBOutlet weak var innerview: UIView!
    
     var data: RegisterDriver!
    
     var ref1 = Database.database().reference()
    
    var drivername = ""
    var driverphone = ""
    
    @IBOutlet weak var enterdrivername: UITextField!
    
    @IBOutlet weak var enterdriveremailphone: UITextField!
    

    override func viewDidLoad() {
        super.viewDidLoad()

        innerview.layer.cornerRadius = 5
        innerview.clipsToBounds = true

        view.backgroundColor = UIColor.clear
        view.isOpaque = false

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func backbtn(_ sender: Any) {
          dismissViewcontroller()
        
    }

    @IBAction func okbtn_click(_ sender: Any) {
        
        drivername = enterdrivername.text!
        driverphone = enterdriveremailphone.text!
        
          let uniqueid =  UserDefaults.standard.string(forKey: "unique_number")
        
        APIManager.sharedInstance.delegate = self
        APIManager.sharedInstance.demoregisterDriver(driveremail: driverphone, driverphone: driverphone, drivername: drivername, uniquenumber: uniqueid!)
        
    }
    
    @IBAction func Skipbtn_click(_ sender: Any) {
        
        drivername = enterdrivername.text!
        driverphone = enterdriveremailphone.text!
        
        let uniqueid =  UserDefaults.standard.string(forKey: "unique_number")
        
        APIManager.sharedInstance.delegate = self
        APIManager.sharedInstance.demoregisterDriver(driveremail: driverphone, driverphone: driverphone, drivername: drivername, uniquenumber: uniqueid!)
    }
    
    
    func onSuccessState(_ data: AnyObject , resultCode: Int) {
        
        
        self.data = data as! RegisterDriver
        
        
        
        if(self.data.result == 419){
            
            NsUserDefaultManager.SingeltonInstance.logOut()
            let storyboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
            let next: SplashViewController = storyboard.instantiateViewController(withIdentifier: "SplashViewController") as! SplashViewController
            self.present(next, animated: true, completion: nil)
            
            
        }else if(self.data.result == 1){
            
            NsUserDefaultManager.SingeltonInstance.registerDriver(insurance: (self.data.details?.insurance!)!, rc: (self.data.details?.rc!)!, licence: (self.data.details?.license!)!, did: (self.data.details?.deviceId!)!, carModelId: (self.data.details?.carModelId!)!, otherDoc: (self.data.details?.otherDocs!)!, driverId: (self.data.details?.driverId!)!, driverImg: (self.data.details?.driverImage!)!, driverEmail: (self.data.details?.driverEmail!)!, driverName: (self.data.details?.driverName!)!, flag: (self.data.details?.flag!)!, long: (self.data.details?.currentLong!)!, cityid: (self.data.details?.cityId!)!, carNo: (self.data.details?.carNumber!)!, password: (self.data.details?.driverPassword!)!, lat: (self.data.details?.currentLat!)!, phoneNo: (self.data.details?.driverPhone!)!, carType: (self.data.details?.carTypeId!)!, onOff: (self.data.details?.onlineOffline!)!, status: (self.data.details?.status!)!, loginLogout: (self.data.details?.loginLogout!)!,driverToken: (self.data.details?.driverToken!)!,detailStatus : (self.data.details?.detailStatus)!,carmodelname : (self.data.details?.carModelName!)! , cartypename : (self.data.details?.carTypeName!)!,cityname : "demo City",Driverstatusimage: (self.data.details?.driverstatusimage)!,Driverstatusmessage: (self.data.details?.driverstatusmessage)!, DriverCarImage: (self.data.details?.drivercarImage)!)
            
            
            let alert = UIAlertController(title:  NSLocalizedString("Registration Successfully", comment: ""), message:"", preferredStyle: .alert)
            let action = UIAlertAction(title:  NSLocalizedString("OK", comment: ""), style: .default) { _ in
                
                GlobalVariables.movefromdemodriver = "demodriver"
                
                
                let Message: NSDictionary = ["ride_id": "No Ride","ride_status": "No Ride Status"]
                
                self.ref1.child("Activeride").child((self.data.details?.driverId!)!).setValue(Message)
                
                let storyboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
                let nextController: OnLineViewController = storyboard.instantiateViewController(withIdentifier: "OnLineViewController") as! OnLineViewController
                
                if let window = self.view.window{
                    window.rootViewController = nextController
                }
                
                /*  let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
                 let revealViewController:OnLineViewController = storyBoard.instantiateViewController(withIdentifier: "OnLineViewController") as! OnLineViewController
                 
                 self.present(revealViewController, animated:true, completion:nil)*/
            }
            alert.addAction(action)
            self.present(alert, animated: true){}
        }
        else{
            
            let alert = UIAlertController(title:  NSLocalizedString("Unable to register!", comment: ""), message: self.data.msg!, preferredStyle: .alert)
            let action = UIAlertAction(title:  NSLocalizedString("OK", comment: ""), style: .default) { _ in
                
            }
            alert.addAction(action)
            self.present(alert, animated: true){}
        }
        
    }
    
    
    
  
}
