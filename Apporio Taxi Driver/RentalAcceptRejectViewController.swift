//
//  RentalAcceptRejectViewController.swift
//  Apporio Taxi Driver
//
//  Created by AppOrio on 03/07/17.
//  Copyright © 2017 apporio. All rights reserved.
//

import UIKit
import Firebase

class RentalAcceptRejectViewController: UIViewController,ParsingStates {
    
    
    var rentalrideinfodata: RentalRideInfoModel!
    var rentalrideacceptdata: RentalRideAcceptModel!
    var rentalridrejectdata: RentalRideRejectModel!
    
    
   // @IBOutlet weak var scrollview: UIScrollView!
    
      let imageUrl = API_URLs.imagedomain
    @IBOutlet weak var topcarimageview: UIImageView!
    
    @IBOutlet weak var topcartypename: UILabel!
    
    @IBOutlet weak var toppackageselecttext: UILabel!
    
    @IBOutlet weak var showtimetext: UILabel!
    
    @IBOutlet weak var showetapricetext: UILabel!
    
    @IBOutlet weak var mapimageview: UIImageView!
    
    @IBOutlet weak var timecircle: CircleTimer!
    
    @IBOutlet weak var pickuplocationtext: UILabel!
    
    var helloWorldTimer: Timer = Timer()
    
    var driverid = ""
    
    var drivertoken = ""
    
    var ref = Database.database().reference()

    var ref1 = Database.database().reference()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        GlobalVariables.firebasedriverride = 1
        
        APIManager.sharedInstance.delegate = self
        APIManager.sharedInstance.RentalRideInfo(RentalBookindId: GlobalVariables.rideid)
        
        
       /* NotificationCenter.default.addObserver(
            self,
            selector: #selector(showtrack),
            name: NSNotification.Name(rawValue: "rentalacceptride"),
            object: nil)*/
        

        
         UserDefaults.standard.setValue("10", forKey:"firebaseride_status")
        
         driverid =  NsUserDefaultManager.SingeltonInstance.getuserdetails(key: NsUserDefaultManager.KeyDriverid)!
        
        drivertoken =  NsUserDefaultManager.SingeltonInstance.getuserdetails(key: NsUserDefaultManager.KeyDriverToken)!
        
        self.timecircle.totalTime = 40
        self.timecircle.isActive = true
        self.timecircle.start()
        self.timecircle.elapsedTime = 40
        
        helloWorldTimer = Timer.scheduledTimer(timeInterval: 40.0, target: self, selector: #selector(RentalAcceptRejectViewController.sayHello), userInfo: nil, repeats: false)

        // Do any additional setup after loading the view.
    }
    
    
     func showtrack(notification: NSNotification){
        
        APIManager.sharedInstance.delegate = self
        APIManager.sharedInstance.RentalRideInfo(RentalBookindId: GlobalVariables.rideid)
        
        UserDefaults.standard.setValue("10", forKey:"firebaseride_status")
        
        driverid =  NsUserDefaultManager.SingeltonInstance.getuserdetails(key: NsUserDefaultManager.KeyDriverid)!
        
        drivertoken =  NsUserDefaultManager.SingeltonInstance.getuserdetails(key: NsUserDefaultManager.KeyDriverToken)!
        
        self.timecircle.totalTime = 40
        self.timecircle.isActive = true
        self.timecircle.start()
        self.timecircle.elapsedTime = 40
        
        helloWorldTimer = Timer.scheduledTimer(timeInterval: 40.0, target: self, selector: #selector(RentalAcceptRejectViewController.sayHello), userInfo: nil, repeats: false)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        
        return 0
        
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "", for: indexPath)
        
        return cell
        
    }

  
    
    func sayHello()
    {
        APIManager.sharedInstance.delegate = self
       
        APIManager.sharedInstance.RentalRideReject(RentalBookindId: GlobalVariables.rideid, DriverId: driverid, DriverToken: drivertoken)
        helloWorldTimer.invalidate()
        self.timecircle.stop()
        self.timecircle.isActive = false
    }

    
    @IBAction func ClickAcceptbtn(_ sender: Any) {
        
        
        self.timecircle.stop()
        self.timecircle.isActive = false
        
        
        /*  self.helloWorldTimer.invalidate()
         
         
         APIManager.sharedInstance.delegate = self
         APIManager.sharedInstance.acceptRide(GlobalVariables.rideid, driverid: self.driverid)*/
        
        let refreshAlert = UIAlertController(title: "", message: NSLocalizedString("Do you want to accept ride ? ", comment: ""), preferredStyle: UIAlertControllerStyle.alert)
        
        refreshAlert.addAction(UIAlertAction(title: NSLocalizedString("Yes", comment: ""), style: .default, handler: { (action: UIAlertAction!) in
            
            
            self.helloWorldTimer.invalidate()
            
            
            APIManager.sharedInstance.delegate = self
           APIManager.sharedInstance.RentalRideAccept(RentalBookindId: GlobalVariables.rideid, DriverId: self.driverid, DriverToken: self.drivertoken)
            
        }))
        
        refreshAlert.addAction(UIAlertAction(title: NSLocalizedString("No", comment: ""), style: .default, handler: { (action: UIAlertAction!) in
            
            refreshAlert .dismiss(animated: true, completion: nil)
            
            
        }))
        
        
        present(refreshAlert, animated: true, completion: nil)

        
        
    }

    @IBAction func ClickIgnorebtn(_ sender: Any) {
        
        
        let refreshAlert = UIAlertController(title: "", message: NSLocalizedString("Do you want to reject ride ? ", comment: ""), preferredStyle: UIAlertControllerStyle.alert)
        
        refreshAlert.addAction(UIAlertAction(title: NSLocalizedString("Yes", comment: ""), style: .default, handler: { (action: UIAlertAction!) in
            
            
            self.helloWorldTimer.invalidate()
            self.timecircle.stop()
            self.timecircle.isActive = false
            APIManager.sharedInstance.delegate = self
            
            APIManager.sharedInstance.RentalRideReject(RentalBookindId: GlobalVariables.rideid, DriverId: self.driverid, DriverToken: self.drivertoken)
            
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
        
        if (resultCode == 8007){
            
            self.rentalrideinfodata = data as! RentalRideInfoModel
            if(self.rentalrideinfodata.status == 1){
                
                GlobalVariables.driverid = (self.rentalrideinfodata.details?.driverId)!
                GlobalVariables.rideid = (self.rentalrideinfodata.details?.rentalBookingId)!
                GlobalVariables.pickupLoc = (self.rentalrideinfodata.details?.pickupLocation)!
                GlobalVariables.custId = (self.rentalrideinfodata.details?.userId)!
                GlobalVariables.pickupLat = (self.rentalrideinfodata.details?.pickupLat)!
                GlobalVariables.pickupLong = (self.rentalrideinfodata.details?.pickupLong)!
                GlobalVariables.ride_status = (self.rentalrideinfodata.details?.bookingStatus)!
               
                
                self.pickuplocationtext.text = (self.rentalrideinfodata.details?.pickupLocation)!
                
                self.topcartypename.text = (self.rentalrideinfodata.details?.carTypeName)
                self.showtimetext.text = (self.rentalrideinfodata.details?.bookingTime)
                self.showetapricetext.text = GlobalVariables.currencysymbol + " " + (self.rentalrideinfodata.details?.packageprice)!
                self.toppackageselecttext.text = self.rentalrideinfodata.details?.packagename
                
                
                let image = self.rentalrideinfodata.details?.carTypeImage!
                
                let newUrl = imageUrl + image!
                let url = URL(string: newUrl)
                topcarimageview.af_setImage(withURL:
                    url! as URL,
                                               placeholderImage: UIImage(named: "dress"),
                                               filter: nil,
                                               imageTransition: .crossDissolve(1.0))

                
                
                mapimageview.layer.borderWidth = 1
                mapimageview.layer.masksToBounds = false
                mapimageview.layer.borderColor = UIColor.black.cgColor
                mapimageview.layer.cornerRadius =  mapimageview.frame.height/2
                mapimageview.clipsToBounds = true
                
                
                
                let url22 = "https://maps.googleapis.com/maps/api/staticmap?center=\(GlobalVariables.pickupLat),\(GlobalVariables.pickupLong)&zoom=15&size=350x350"
                
                print(url22)
                let url2 = NSURL(string: url22)
                mapimageview.af_setImage(withURL:
                    url2! as URL,
                                           placeholderImage: UIImage(named: "dress"),
                                           filter: nil,
                                           imageTransition: .crossDissolve(1.0))

                
                
            }
            else{
            
            
            
            }
        }
        
        
          if (resultCode == 8008){
            
            
            
            self.rentalrideacceptdata = data as! RentalRideAcceptModel
            if(self.rentalrideacceptdata.status == 1){
                
                
                GlobalVariables.driverid = (self.rentalrideacceptdata.details?.driverId)!
                GlobalVariables.rideid = (self.rentalrideacceptdata.details?.rentalBookingId)!
                GlobalVariables.pickupLoc = (self.rentalrideacceptdata.details?.pickupLocation)!
                GlobalVariables.custId = (self.rentalrideacceptdata.details?.userId)!
                GlobalVariables.pickupLat = (self.rentalrideacceptdata.details?.pickupLat)!
                GlobalVariables.pickupLong = (self.rentalrideacceptdata.details?.pickupLong)!
                GlobalVariables.trackusername = (self.rentalrideacceptdata.details?.userName)!
                GlobalVariables.trackusermobile = (self.rentalrideacceptdata.details?.userPhone)!
               
                GlobalVariables.trackridestatus = (self.rentalrideacceptdata.details?.bookingStatus)!
                
                
                let Message1: NSDictionary = ["ride_id": "No Ride","ride_status": "No Ride Status"]
                
                self.ref1.child("Activeride").child(GlobalVariables.driverid).setValue(Message1)
                

                
                
                let Message: NSDictionary = ["changed_destination": "0","ride_id": GlobalVariables.rideid,"ride_status": "11","done_ride_id": ""]
                
                self.ref.child("RideTable").child(GlobalVariables.rideid).setValue(Message)
                
                

              
                
                NsUserDefaultManager.SingeltonInstance.RentalRideAccept(DriverId: (self.rentalrideacceptdata.details?.driverId)!, RideId: (self.rentalrideacceptdata.details?.rentalBookingId)!, PickUpLoc: (self.rentalrideacceptdata.details?.pickupLocation)!, CustId: (self.rentalrideacceptdata.details?.userId)!, PickUpLat: (self.rentalrideacceptdata.details?.pickupLat)!, PickUpLong: (self.rentalrideacceptdata.details?.pickupLong)!, TrackUserName: (self.rentalrideacceptdata.details?.userName)!, TrackUserMobile: (self.rentalrideacceptdata.details?.userPhone)!, TrackRideStatus: (self.rentalrideacceptdata.details?.bookingStatus)!
)
                
                
                let storyboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
                let next: RentalTrackRideViewController = storyboard.instantiateViewController(withIdentifier: "RentalTrackRideViewController") as! RentalTrackRideViewController
                next.acceptdataresponse = self.rentalrideacceptdata
                
                self.present(next, animated: true, completion: nil)
                
            }else{
            
            self.showalert(message: self.rentalrideacceptdata.message!)
            }

            
            
        }
        
          if (resultCode == 8009){
            
            self.rentalridrejectdata = data as! RentalRideRejectModel
            if(self.rentalridrejectdata.status == 1){
                
                
                let Message1: NSDictionary = ["ride_id": "No Ride","ride_status": "No Ride Status"]
                
                self.ref1.child("Activeride").child(GlobalVariables.driverid).setValue(Message1)
                

                
                let Message: NSDictionary = ["changed_destination": "0","ride_id": GlobalVariables.rideid,"ride_status": "14","done_ride_id": ""]
                
                self.ref.child("RideTable").child(GlobalVariables.rideid).setValue(Message)
                
                let storyboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
                let nextController: OnLineViewController = storyboard.instantiateViewController(withIdentifier: "OnLineViewController") as! OnLineViewController
                
                if let window = self.view.window{
                    window.rootViewController = nextController
                }


                
               // dismissViewcontroller()
            }else{
                
                self.showalert(message: self.rentalridrejectdata.message!)
            }
            
        }


        
    }
   

}
