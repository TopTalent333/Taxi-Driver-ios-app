//
//  AcceptRejectViewController.swift
//  Apporio Taxi Driver
//
//  Created by AppOrio on 07/06/17.
//  Copyright © 2017 apporio. All rights reserved.
//

import UIKit
import Firebase
import AVFoundation

class AcceptRejectViewController: UIViewController, ParsingStates  {
    
    @IBOutlet weak var cancelbtnview: UIView!
    
    
    var rejectdata: RideReject!
    var acceptdata: RideAccept!
    var count = 0
    var driverid = ""
    var ridedata: ViewRide!
    var helloWorldTimer: Timer = Timer()
    var player : AVAudioPlayer?
    
    @IBOutlet weak var PaymentInfo: UILabel!
    
    
  //  @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var dropAddress: UILabel!
    @IBOutlet weak var pickupAddress: UILabel!
    @IBOutlet weak var timeCircle: CircleTimer!
    
    @IBOutlet weak var mapimagecircle: UIImageView!
    
    
    var ref = Database.database().reference()
    
    var ref1 = Database.database().reference()
    
    var value = 0
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        GlobalVariables.firebasedriverride = 1
        
            
        APIManager.sharedInstance.delegate = self
        APIManager.sharedInstance.viewRideInfo(rideid: GlobalVariables.rideid)
            
        
        driverid = NsUserDefaultManager.SingeltonInstance.getuserdetails(key: NsUserDefaultManager.KeyDriverid)!
        
        GlobalVariables.timerForGetDriverLocation5.invalidate()
        
        cancelbtnview.layer.borderWidth = 1.0
        cancelbtnview.layer.cornerRadius = 5
        
       /* NotificationCenter.default.addObserver(
            self,
            selector: #selector(showtrack),
            name: NSNotification.Name(rawValue: "acceptride"),
            object: nil)*/
        

        
        
         UserDefaults.standard.setValue("1", forKey:"firebaseride_status")

              
        self.timeCircle.totalTime = 40
        self.timeCircle.isActive = true
        self.timeCircle.start()
        self.timeCircle.elapsedTime = 40
        
        self.helloWorldTimer = Timer.scheduledTimer(timeInterval: 40.0, target: self, selector: #selector(AcceptRejectViewController.sayHello), userInfo: nil, repeats: false)

        // Do any additional setup after loading the view.
    }
    
    
     func showtrack(notification: NSNotification){
        
        
        APIManager.sharedInstance.delegate = self
        APIManager.sharedInstance.viewRideInfo(rideid: GlobalVariables.rideid)
        
        driverid = NsUserDefaultManager.SingeltonInstance.getuserdetails(key: NsUserDefaultManager.KeyDriverid)!
        
        GlobalVariables.timerForGetDriverLocation5.invalidate()
        
        cancelbtnview.layer.borderWidth = 1.0
        cancelbtnview.layer.cornerRadius = 5
        
        
        UserDefaults.standard.setValue("1", forKey:"firebaseride_status")
        
        
        self.timeCircle.totalTime = 40
        self.timeCircle.isActive = true
        self.timeCircle.start()
        self.timeCircle.elapsedTime = 40
        
        self.helloWorldTimer = Timer.scheduledTimer(timeInterval: 40.0, target: self, selector: #selector(AcceptRejectViewController.sayHello), userInfo: nil, repeats: false)

        
        
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        
        let url = Bundle.main.url(forResource: "notification_tone", withExtension: "mp3")!
        
        do {
            player = try AVAudioPlayer(contentsOf: url)
            guard let player = player else { return }
            player.prepareToPlay()
            player.play()
        }
        catch let error as NSError {
            print(error.description)
        }
    }
    
    // ********************* automatically reject ride after 20 sec ***************************
    
    
    func sayHello()
    {
        APIManager.sharedInstance.delegate = self
        APIManager.sharedInstance.rejectRide(rideid: GlobalVariables.rideid, driverid: driverid)
        self.helloWorldTimer.invalidate()
        self.timeCircle.stop()
        player?.stop()
        self.timeCircle.isActive = false
    }
    
    @IBAction func reject_btn_click(_ sender: Any) {
        
        let refreshAlert = UIAlertController(title: "", message: NSLocalizedString("Do you want to reject ride ? ", comment: ""), preferredStyle: UIAlertControllerStyle.alert)
        
        refreshAlert.addAction(UIAlertAction(title: NSLocalizedString("Yes", comment: ""), style: .default, handler: { (action: UIAlertAction!) in
                        
            self.helloWorldTimer.invalidate()
            self.player?.stop()
            self.timeCircle.stop()
            self.timeCircle.isActive = false
            
            APIManager.sharedInstance.delegate = self
            APIManager.sharedInstance.rejectRide(rideid: GlobalVariables.rideid, driverid: self.driverid)
            
        }))
        
        
        refreshAlert.addAction(UIAlertAction(title: NSLocalizedString("No", comment: ""), style: .default, handler: { (action: UIAlertAction!) in
            
            refreshAlert .dismiss(animated: true, completion: nil)
            
            
        }))
        
        present(refreshAlert, animated: true, completion: nil)
        
        
    }
    
    
    @IBAction func accept_btn_click(_ sender: Any) {
        
        self.timeCircle.stop()
        self.timeCircle.isActive = false
        
        
        /*  self.helloWorldTimer.invalidate()
         
         
         APIManager.sharedInstance.delegate = self
         APIManager.sharedInstance.acceptRide(GlobalVariables.rideid, driverid: self.driverid)*/
        
        let refreshAlert = UIAlertController(title: "", message: NSLocalizedString("Do you want to accept ride ? ", comment: ""), preferredStyle: UIAlertControllerStyle.alert)
        
        refreshAlert.addAction(UIAlertAction(title: NSLocalizedString("Yes", comment: ""), style: .default, handler: { (action: UIAlertAction!) in
            
            
            self.helloWorldTimer.invalidate()
            self.player?.stop()
            
            APIManager.sharedInstance.delegate = self
            APIManager.sharedInstance.acceptRide(rideid: GlobalVariables.rideid, driverid: self.driverid)
            
        }))
        
        refreshAlert.addAction(UIAlertAction(title: NSLocalizedString("No", comment: ""), style: .default, handler: { (action: UIAlertAction!) in
            
            refreshAlert .dismiss(animated: true, completion: nil)
            
            
        }))
        
        
        present(refreshAlert, animated: true, completion: nil)

    }
    
    
    func showalert(message:String)  {
        
        DispatchQueue.main.async(execute: {
            
            let alertController = UIAlertController(title:   NSLocalizedString("Alert", comment: ""), message:message, preferredStyle: .alert)
            
            
            let OKAction = UIAlertAction(title: NSLocalizedString("ok", comment: ""), style: .default) { (action) in
                
                let Message1: NSDictionary = ["ride_id": "No Ride","ride_status": "No Ride Status"]
                
                self.ref1.child("Activeride").child(GlobalVariables.driverid).setValue(Message1)
                

                
                let storyboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
                let nextController: OnLineViewController = storyboard.instantiateViewController(withIdentifier: "OnLineViewController") as! OnLineViewController
                
                if let window = self.view.window{
                    window.rootViewController = nextController
                }
                
                
            }
            alertController.addAction(OKAction)
            
            self.present(alertController, animated: true) {
                
            }
            
            
        })
        
    }

    
    
    func onSuccessState(_ data: AnyObject , resultCode: Int) {
        
        if (resultCode == 165){
            self.acceptdata = data as! RideAccept
            if(self.acceptdata.result == 1){
                
                
                GlobalVariables.driverid = (self.acceptdata.details?.driverId)!
                GlobalVariables.rideid = (self.acceptdata.details?.rideId)!
                GlobalVariables.pickupLoc = (self.acceptdata.details?.pickupLocation)!
                GlobalVariables.custId = (self.acceptdata.details?.userId)!
                GlobalVariables.pickupLat = (self.acceptdata.details?.pickupLat)!
                GlobalVariables.pickupLong = (self.acceptdata.details?.pickupLong)!
                GlobalVariables.trackusername = (self.acceptdata.details?.userName)!
                GlobalVariables.trackusermobile = (self.acceptdata.details?.userPhone)!
                GlobalVariables.trackdroplocation = (self.acceptdata.details?.dropLocation)!
                GlobalVariables.trackridestatus = (self.acceptdata.details?.rideStatus)!
                GlobalVariables.dropLat = (self.acceptdata.details?.dropLat)!
                GlobalVariables.dropLong = (self.acceptdata.details?.dropLong)!
                GlobalVariables.dropLocation = (self.acceptdata.details?.dropLocation)!
                
                let Message1: NSDictionary = ["ride_id": "No Ride","ride_status": "No Ride Status"]
                
                self.ref1.child("Activeride").child(GlobalVariables.driverid).setValue(Message1)
                
                
                let Message: NSDictionary = ["changed_destination": "0",
                                             "ride_id": GlobalVariables.rideid,"ride_status": "3","done_ride_id": ""]
                
                self.ref.child("RideTable").child(GlobalVariables.rideid).setValue(Message)
                
               self.helloWorldTimer.invalidate()
                self.player?.stop()
                             
                NsUserDefaultManager.SingeltonInstance.RideAccept(DriverId: (self.acceptdata.details?.driverId)!, RideId: (self.acceptdata.details?.rideId)!, PickUpLoc: (self.acceptdata.details?.pickupLocation)!, CustId: (self.acceptdata.details?.userId)!, PickUpLat: (self.acceptdata.details?.pickupLat)!, PickUpLong: (self.acceptdata.details?.pickupLong)!, TrackUserName: (self.acceptdata.details?.userName)!, TrackUserMobile: (self.acceptdata.details?.userPhone)!, TrackDropLocation: (self.acceptdata.details?.dropLocation)!, TrackRideStatus: (self.acceptdata.details?.rideStatus)!, DropLat: (self.acceptdata.details?.dropLat)!, DropLong: (self.acceptdata.details?.dropLong)!, DropLocation: (self.acceptdata.details?.dropLocation)!)
                
                
                let storyboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
                let next: TrackRideViewController = storyboard.instantiateViewController(withIdentifier: "TrackRideViewController") as! TrackRideViewController
                next.acceptdataresponse = self.acceptdata
                
                self.present(next, animated: true, completion: nil)
                
            }else{
            
              self.showalert(message: self.acceptdata.msg!)
            }
        }
        
        if (resultCode == 176){
            self.rejectdata = data as! RideReject
            if(self.rejectdata.result == 1){
                
                
                self.helloWorldTimer.invalidate()
                self.player?.stop()
                
                
                let Message1: NSDictionary = ["ride_id": "No Ride","ride_status": "No Ride Status"]
                
                self.ref1.child("Activeride").child(GlobalVariables.driverid).setValue(Message1)
                
                
                let Message: NSDictionary = ["changed_destination": "0","ride_id": GlobalVariables.rideid,"ride_status": "4","done_ride_id": ""]
                
                self.ref.child("RideTable").child(GlobalVariables.rideid).setValue(Message)
                
                let storyboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
                let nextController: OnLineViewController = storyboard.instantiateViewController(withIdentifier: "OnLineViewController") as! OnLineViewController
                
                if let window = self.view.window{
                    window.rootViewController = nextController
                }
              //  dismissViewcontroller()
                
            }else{
                
                self.showalert(message: self.rejectdata.msg!)
            }
            
        }
        
        if resultCode == 143 {
            
            self.ridedata = data as! ViewRide
            if (self.ridedata.result == 1){
                
                
                GlobalVariables.driverid = (self.ridedata.details?.driverId)!
                GlobalVariables.rideid = (self.ridedata.details?.rideId)!
                GlobalVariables.pickupLoc = (self.ridedata.details?.pickupLocation)!
                GlobalVariables.custId = (self.ridedata.details?.userId)!
                GlobalVariables.pickupLat = (self.ridedata.details?.pickupLat)!
                GlobalVariables.pickupLong = (self.ridedata.details?.pickupLong)!
                GlobalVariables.ride_status = (self.ridedata.details?.rideStatus)!
                GlobalVariables.dropLat = (self.ridedata.details?.dropLat)!
                GlobalVariables.dropLong = (self.ridedata.details?.dropLong)!
                GlobalVariables.dropLocation = (self.ridedata.details?.dropLocation)!
                PaymentInfo.text = (self.ridedata.details?.paymentOptionName)!
                
                self.pickupAddress.text = (self.ridedata.details?.pickupLocation)!
                
                
                mapimagecircle.layer.borderWidth = 1
                mapimagecircle.layer.masksToBounds = false
                mapimagecircle.layer.borderColor = UIColor.black.cgColor
                mapimagecircle.layer.cornerRadius =  mapimagecircle.frame.height/2
                mapimagecircle.clipsToBounds = true

                
                
                let url22 = "https://maps.googleapis.com/maps/api/staticmap?center=\(GlobalVariables.pickupLat),\(GlobalVariables.pickupLong)&zoom=15&size=350x350"
                
                print(url22)
                let url2 = NSURL(string: url22)
               mapimagecircle.af_setImage(withURL:
                    url2! as URL,
                                                  placeholderImage: UIImage(named: "dress"),
                                                  filter: nil,
                                                  imageTransition: .crossDissolve(1.0))
                
                

                
              //  self.dropAddress.text = (self.ridedata.details?.dropLocation)!
            }
        }
        
        
    }


}
