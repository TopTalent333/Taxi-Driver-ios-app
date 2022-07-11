//
//  LoginViewController.swift
//  Apporio Taxi Driver
//
//  Created by AppOrio on 06/06/17.
//  Copyright © 2017 apporio. All rights reserved.
//

import UIKit
import Firebase

class LoginViewController: UIViewController,ParsingStates {
    
    
    var mobileNo: String = ""
    var password: String = ""
    var data: RegisterDriver!
    
    
     var ref1 = Database.database().reference()
    
    @IBOutlet weak var boundaryview: UIView!
    
    
    @IBOutlet weak var phoneNoField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var login_btn: UIButton!


    override func viewDidLoad() {
        super.viewDidLoad()
        
        boundaryview.layer.cornerRadius = 5
        boundaryview.layer.borderWidth = 1.0
        boundaryview.layer.borderColor = UIColor.lightGray.cgColor

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func backbtnclick(_ sender: Any) {
        dismissViewcontroller()

        
    }
    func showalert5(message:String)  {
        
        DispatchQueue.main.async(execute: {
            
            let alertController = UIAlertController(title:   NSLocalizedString("Alert", comment: ""), message:message, preferredStyle: .alert)
            
            
            let OKAction = UIAlertAction(title: NSLocalizedString("ok", comment: ""), style: .default) { (action) in
                
                
                UIApplication.shared.openURL(NSURL(string: UIApplicationOpenSettingsURLString)! as URL)
                
            }
            alertController.addAction(OKAction)
            self.present(alertController, animated: true) {
                
            }
            
        })
        
    }
    @IBAction func login_btn_click(_ sender: Any) {
        
        if CLLocationManager.locationServicesEnabled() {
            switch(CLLocationManager.authorizationStatus()) {
            case .notDetermined, .restricted, .denied:
                self.showalert5(message: "To continue, let your device turn on location, which uses Google's location services.Please turn on your location from settings.")
                return
            case .authorizedAlways, .authorizedWhenInUse:
                print("Access")
            }
        } else {
            return
        }
        
        mobileNo = phoneNoField.text!
        password = passwordField.text!
        
        if ((mobileNo == "") || (password == "") ) {
            
            let alert = UIAlertController(title: NSLocalizedString("Login Failed!", comment: ""), message:NSLocalizedString("Fields cannot be blank ", comment: ""), preferredStyle: .alert)
            let action = UIAlertAction(title: NSLocalizedString("OK", comment: ""), style: .default) { _ in
                
            }
            alert.addAction(action)
            self.present(alert, animated: true){}
        }
            
        else
        {
            
            APIManager.sharedInstance.delegate = self
            APIManager.sharedInstance.loginDriver(emailPhone: mobileNo, password: password)
            
        }

    }
    
    @IBAction func forgotbtnclick(_ sender: Any) {
        
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
        let revealViewController:ForgotPasswordViewController = storyBoard.instantiateViewController(withIdentifier: "ForgotPasswordViewController") as! ForgotPasswordViewController
        
        self.present(revealViewController, animated:true, completion:nil)

    }
    
    
    func onSuccessState(_ data: AnyObject , resultCode: Int) {
        
        self.data = data as! RegisterDriver
        
        if(self.data.result == 1){
            
            
            if(self.data.details?.detailStatus == "1"){
                
                NsUserDefaultManager.SingeltonInstance.registerDriver(insurance: (self.data.details?.insurance!)!, rc: (self.data.details?.rc!)!, licence: (self.data.details?.license!)!, did: (self.data.details?.deviceId!)!, carModelId: (self.data.details?.carModelId!)!, otherDoc: (self.data.details?.otherDocs!)!, driverId: (self.data.details?.driverId!)!, driverImg: (self.data.details?.driverImage!)!, driverEmail: (self.data.details?.driverEmail!)!, driverName: (self.data.details?.driverName!)!, flag: (self.data.details?.flag!)!, long: (self.data.details?.currentLong!)!, cityid: (self.data.details?.cityId!)!, carNo: (self.data.details?.carNumber!)!, password: (self.data.details?.driverPassword!)!, lat: (self.data.details?.currentLat!)!, phoneNo: (self.data.details?.driverPhone!)!, carType: (self.data.details?.carTypeId!)!, onOff: (self.data.details?.onlineOffline!)!, status: (self.data.details?.status!)!, loginLogout: (self.data.details?.loginLogout!)!,driverToken: (self.data.details?.driverToken!)!,detailStatus : (self.data.details?.detailStatus)!,carmodelname : (self.data.details?.carModelName!)! , cartypename : (self.data.details?.carTypeName!)!,cityname : (self.data.details?.cityname!)!,Driverstatusimage: (self.data.details?.driverstatusimage)!,Driverstatusmessage: (self.data.details?.driverstatusmessage)!, DriverCarImage: (self.data.details?.drivercarImage!)!)
                
               /* let storyboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
                let next: UploadDocumentViewController = storyboard.instantiateViewController(withIdentifier: "UploadDocumentViewController") as! UploadDocumentViewController
                self.present(next, animated: true, completion: nil)*/
                
                let storyboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
                let next: DocumentStatusViewController = storyboard.instantiateViewController(withIdentifier: "DocumentStatusViewController") as! DocumentStatusViewController
                self.present(next, animated: true, completion: nil)
                
                
                
                
            }else  if(self.data.details?.detailStatus == "3"){
                
                  NsUserDefaultManager.SingeltonInstance.registerDriver(insurance: (self.data.details?.insurance!)!, rc: (self.data.details?.rc!)!, licence: (self.data.details?.license!)!, did: (self.data.details?.deviceId!)!, carModelId: (self.data.details?.carModelId!)!, otherDoc: (self.data.details?.otherDocs!)!, driverId: (self.data.details?.driverId!)!, driverImg: (self.data.details?.driverImage!)!, driverEmail: (self.data.details?.driverEmail!)!, driverName: (self.data.details?.driverName!)!, flag: (self.data.details?.flag!)!, long: (self.data.details?.currentLong!)!, cityid: (self.data.details?.cityId!)!, carNo: (self.data.details?.carNumber!)!, password: (self.data.details?.driverPassword!)!, lat: (self.data.details?.currentLat!)!, phoneNo: (self.data.details?.driverPhone!)!, carType: (self.data.details?.carTypeId!)!, onOff: (self.data.details?.onlineOffline!)!, status: (self.data.details?.status!)!, loginLogout: (self.data.details?.loginLogout!)!,driverToken: (self.data.details?.driverToken!)!,detailStatus : (self.data.details?.detailStatus)!,carmodelname : (self.data.details?.carModelName!)! , cartypename : (self.data.details?.carTypeName!)!,cityname : (self.data.details?.cityname!)!,Driverstatusimage: (self.data.details?.driverstatusimage)!,Driverstatusmessage: (self.data.details?.driverstatusmessage)!, DriverCarImage: (self.data.details?.drivercarImage!)!)
                
                
                let storyboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
                let next: SignupVerifyViewController = storyboard.instantiateViewController(withIdentifier: "SignupVerifyViewController") as! SignupVerifyViewController
                self.present(next, animated: true, completion: nil)
                
            }
            else{
                
                
                NsUserDefaultManager.SingeltonInstance.registerDriver(insurance: (self.data.details?.insurance!)!, rc: (self.data.details?.rc!)!, licence: (self.data.details?.license!)!, did: (self.data.details?.deviceId!)!, carModelId: (self.data.details?.carModelId!)!, otherDoc: (self.data.details?.otherDocs!)!, driverId: (self.data.details?.driverId!)!, driverImg: (self.data.details?.driverImage!)!, driverEmail: (self.data.details?.driverEmail!)!, driverName: (self.data.details?.driverName!)!, flag: (self.data.details?.flag!)!, long: (self.data.details?.currentLong!)!, cityid: (self.data.details?.cityId!)!, carNo: (self.data.details?.carNumber!)!, password: (self.data.details?.driverPassword!)!, lat: (self.data.details?.currentLat!)!, phoneNo: (self.data.details?.driverPhone!)!, carType: (self.data.details?.carTypeId!)!, onOff: (self.data.details?.onlineOffline!)!, status: (self.data.details?.status!)!, loginLogout: (self.data.details?.loginLogout!)!,driverToken: (self.data.details?.driverToken!)!,detailStatus : (self.data.details?.detailStatus)!,carmodelname : (self.data.details?.carModelName!)! , cartypename : (self.data.details?.carTypeName!)!,cityname : (self.data.details?.cityname!)!,Driverstatusimage: (self.data.details?.driverstatusimage)!,Driverstatusmessage: (self.data.details?.driverstatusmessage)!, DriverCarImage: (self.data.details?.drivercarImage!)!)
                
                print("data saved")
                
                let alert = UIAlertController(title: NSLocalizedString("Login Successfully", comment: ""), message:"", preferredStyle: .alert)
                let action = UIAlertAction(title: NSLocalizedString("OK", comment: ""), style: .default) { _ in
                    
                    
                    
                    let Message: NSDictionary = ["ride_id": "No Ride","ride_status": "No Ride Status"]
                    
                    self.ref1.child("Activeride").child((self.data.details?.driverId!)!).setValue(Message)
                                    
                   /* let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
                    let revealViewController:OnLineViewController = storyBoard.instantiateViewController(withIdentifier: "OnLineViewController") as! OnLineViewController
                    
                    self.present(revealViewController, animated:true, completion:nil)*/
                    
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
        else{
            
            let alert = UIAlertController(title: NSLocalizedString("Unable to login!", comment: ""), message: self.data.msg! , preferredStyle: .alert)
            let action = UIAlertAction(title: NSLocalizedString("OK", comment: ""), style: .default) { _ in
                
            }
            alert.addAction(action)
            self.present(alert, animated: true){}
        }
        
    }
    
    
    // ********************* Textfield delegate ***************************
    
    
    override func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true;
    }
    

    
   
}
