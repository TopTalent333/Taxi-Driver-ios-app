//
//  SplashViewController.swift
//  Apporio Taxi Driver
//
//  Created by AppOrio on 06/06/17.
//  Copyright © 2017 apporio. All rights reserved.
//

import UIKit
import CoreLocation
import GoogleMaps


class SplashViewController: UIViewController,ParsingStates , CLLocationManagerDelegate {
    
    
    var data: RegisterDriver!
    var randomNumber = ""
    var city = ""
    var CITY = ""
    
    var index = 0
    let animationDuration: TimeInterval = 0.25
    let switchingInterval: TimeInterval = 3
    let locationManager = CLLocationManager()
    
   
    
    var Timer:Foundation.Timer!
    

    @IBOutlet weak var login_btn: UIButton!
    @IBOutlet weak var register_btn: UIButton!
    @IBOutlet weak var container_view: UIView!


    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        if(UserDefaults.standard.object(forKey: "PreferredLanguage") as! String == "en"){
            
            GlobalVariables.languageid = 1
        }
        else{
            GlobalVariables.languageid = 2
        }
        
        
        self.locationManager.delegate = self
        self.locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
        self.locationManager.requestAlwaysAuthorization()
        self.locationManager.startUpdatingLocation()
        
        
        
        
        if(NsUserDefaultManager.SingeltonInstance.isloggedin()){
            
            
            let defaultdetailstatus = NsUserDefaultManager.SingeltonInstance.getuserdetails(key: NsUserDefaultManager.KeyDetailStatus)!
            
            
            if defaultdetailstatus == "1"{
                
                APIManager.sharedInstance.delegate = self
                APIManager.sharedInstance.sendDeviceId()
                
                
                
                self.container_view.isHidden = false
                Timer  = Foundation.Timer.scheduledTimer(timeInterval: 5, target: self, selector: #selector(SplashViewController.myPerformeCode(_:)), userInfo: nil, repeats: false)
                
            }else if defaultdetailstatus == "3"{
                
                APIManager.sharedInstance.delegate = self
                APIManager.sharedInstance.sendDeviceId()
                
                
                
                self.container_view.isHidden = false
                Timer  = Foundation.Timer.scheduledTimer(timeInterval: 5, target: self, selector: #selector(SplashViewController.myPerformeCode(_:)), userInfo: nil, repeats: false)
                
            }
            
            
            else{
                
                APIManager.sharedInstance.delegate = self
                APIManager.sharedInstance.sendDeviceId()
                
                
                
                self.container_view.isHidden = true
                Timer  = Foundation.Timer.scheduledTimer(timeInterval: 5, target: self, selector: #selector(SplashViewController.myPerformeCode1(_:)), userInfo: nil, repeats: false)
                
            }
            
        }
        else{
            
            self.container_view.isHidden = true
            
            Timer  = Foundation.Timer.scheduledTimer(timeInterval: 5, target: self, selector: #selector(SplashViewController.myPerformeCode(_:)), userInfo: nil, repeats: false)
            
        }


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
    
    
    @IBAction func register_btn(_ sender: AnyObject) {
        
        
        
                let storyboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let revealController: RegisterationViewController = storyboard.instantiateViewController(withIdentifier: "RegisterationViewController") as! RegisterationViewController
        self.present(revealController, animated: true, completion: nil)
        
        
    }
    
    
    @IBAction func login_btn(_ sender: AnyObject) {
        
        
        
        let storyboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let revealController: LoginViewController = storyboard.instantiateViewController(withIdentifier: "LoginViewController") as! LoginViewController
        self.present(revealController, animated: true, completion: nil)
       
        
        
    }
    
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.first {
            
            reverseGeocodeCoordinate(location.coordinate)
            Lat = String(location.coordinate.latitude)
            Lng = String(location.coordinate.longitude)
            
            
        }
        
    }
    
    
    func reverseGeocodeCoordinate(_ coordinate: CLLocationCoordinate2D)  {
        
        // 1
        
        let geocoder = GMSGeocoder()
        
        // 2
        geocoder.reverseGeocodeCoordinate(coordinate) { response, error in
            if let address = response?.firstResult() {
                
                
                             
                GlobalVariables.driverLocation = address.addressLine1()! + " , " + address.addressLine2()!
                
            }
        }
    }
    
    
    func myPerformeCode(_ timer : Foundation.Timer) {
        
        
        
               Timer.invalidate()
        self.container_view.isHidden = false
        
        let transition = CATransition()
        
        //transition.type = kCATransitionFade
        transition.type = kCATransitionPush
        transition.subtype = kCATransitionFromBottom
        container_view.layer.add(transition, forKey: kCATransition)
        
        
        
        // here code to perform
    }
    
    func myPerformeCode1(_ timer : Foundation.Timer) {
        
        
        GlobalVariables.locationdidactive = 1
        
        let storyboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let nextController: OnLineViewController = storyboard.instantiateViewController(withIdentifier: "OnLineViewController") as! OnLineViewController
        
        if let window = self.view.window{
            window.rootViewController = nextController
        }

        
        /*let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
        let revealViewController:OnLineViewController = storyBoard.instantiateViewController(withIdentifier: "OnLineViewController") as! OnLineViewController
              self.present(revealViewController, animated:true, completion:nil)*/
        
        
    }
    
    func myPerformeCode2(_ timer : Foundation.Timer) {
        
        let storyboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let next: UploadDocumentViewController = storyboard.instantiateViewController(withIdentifier: "UploadDocumentViewController") as! UploadDocumentViewController
        self.present(next, animated: true, completion: nil)
        
        
        
        
    }
    
    @IBAction func demodriverbtn_click(_ sender: Any) {
        
        let storyboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let next: CreateDemoDriverViewController = storyboard.instantiateViewController(withIdentifier: "CreateDemoDriverViewController") as! CreateDemoDriverViewController
        next.modalPresentationStyle = .overCurrentContext
        self.present(next, animated: true, completion: nil)
        
    }
    
    
    
    
    // ************************** Success state ********************************
    
    
    func onSuccessState(_ data: AnyObject , resultCode: Int) {
        
        
    }


   

}
