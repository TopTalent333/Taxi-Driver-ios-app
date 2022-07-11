//
//  TrackRideViewController.swift
//  Apporio Taxi Driver
//
//  Created by AppOrio on 07/06/17.
//  Copyright © 2017 apporio. All rights reserved.
//

import UIKit
import GoogleMaps
import Firebase
import SwiftyJSON
import GooglePlaces

import KVNProgress


class TrackRideViewController: UIViewController, CLLocationManagerDelegate , ParsingStates ,GMSMapViewDelegate ,GMSAutocompleteViewControllerDelegate {
    
    
    var enddata: RideEnd!
   var ridedata: ViewRide!
    var beginData: RideBegin!
     var changeData: DropChange!
     var acceptdataresponse: RideAccept!
    var lat: Double = 0.0
    var long: Double = 0.0
    let locationManager = CLLocationManager()
    var currentLocation: String = ""
    var arrive_time: String = ""
    var arrive_sec: Int = 0
    var data: Arrived!
    var updateData: UpdateDriverLocation!
    var driverid = ""
    
    var ref = Database.database().reference()
    
    // var locationArray = [[String:Doble]]()
    
    var locationArray = [String]()
    
   
    
    var value5 = ""
    
    var truncated = ""
    
    @IBOutlet weak var editbtn: UIButton!
    
    var timerForGetDriverLocation1 = Timer()
    
    
    @IBOutlet weak var editimg: UIImageView!
    
    @IBOutlet weak var navigatebtn: UIButton!
    
    @IBOutlet weak var meterview: UIView!
    
    @IBOutlet weak var topview: UIView!
    

    @IBOutlet weak var sosbtn: UIButton!
    
    
    var timerForGetDriverLocation = Timer()
    
    var k = 0
    
    var totaldistance = 3000
    
    var radiansBearing : Double = 0.0
    
    var markerList = [GMSMarker]()
    
    
    var originMarker: GMSMarker!
    var destinationMarker: GMSMarker!
    
    var polyline = GMSPolyline()
    var animationPolyline = GMSPolyline()
    var path = GMSPath()
    var animationPath = GMSMutablePath()
    var i: UInt = 0
    var timer1: Timer!
    
    var originCoordinate: CLLocationCoordinate2D!
    
    var destinationCoordinate: CLLocationCoordinate2D!
    
    private let googleMapsKey = "AIzaSyAwdw2gOgLTM_lAjEtVvIH87xHx3RTKEUQ"
    private let baseURLString = "https://maps.googleapis.com/maps/api/directions/json?"
    
    let baseURLDirections = "https://maps.googleapis.com/maps/api/directions/json?"


    
    
    var driverLat = ""
    var driverLong = ""
    var driverLocation = ""
    
    
   var distanceinmetervalue = 0
    
    var defaultdrivertoken = NsUserDefaultManager.SingeltonInstance.getuserdetails(key: NsUserDefaultManager.KeyDriverToken)!
    
    
    
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
    
    var EndLat = ""
    var EndLng = ""
    var EndLocation = ""
    
    var newEndLat = ""
    var newEndLng = ""
    

    var startlat = ""
    var startlng = ""
    var destinationlat = ""
    var destinationlng = ""
    
    var temparorylat = ""
    var temparorylong = ""
    
    var marker = GMSMarker()
    
    var temparoryvalue = 1
    
    var temparoryvalue1 = 1
    
    var markervalue = 1


    
    var kmvalueupdate = 0.0
    
  

    
    @IBOutlet weak var usernametext: UILabel!
    
    @IBOutlet weak var usermobiletext: UILabel!
    
    @IBOutlet weak var droplocationtext: UILabel!
    
    @IBOutlet weak var mapview: GMSMapView!
    
    @IBOutlet weak var pickuplocationtext: UILabel!
    
    @IBOutlet weak var kmvalue: UILabel!
    
    @IBOutlet weak var endtripview: UIView!
    
    @IBOutlet weak var begintripview: UIView!
    
    @IBOutlet weak var locatedview: UIView!
    
     var dropchange = 0
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        dropchange = 0
        

        topview.layer.shadowColor = UIColor.gray.cgColor
        topview.layer.shadowOpacity = 1
        topview.layer.shadowOffset = CGSize(width: 0, height: 2)
        topview.layer.shadowRadius = 2


        navigatebtn.layer.cornerRadius = 4


        GlobalVariables.trackusername =  UserDefaults.standard.object(forKey: "accepttrackusername") as! String
        GlobalVariables.trackusermobile = UserDefaults.standard.object(forKey: "accepttrackusermobile") as! String

        GlobalVariables.trackdroplocation = UserDefaults.standard.object(forKey: "accepttrackdroplocation") as! String

        GlobalVariables.pickupLat = UserDefaults.standard.object(forKey: "acceptpickuplat") as! String

        GlobalVariables.pickupLong = UserDefaults.standard.object(forKey: "acceptpickuplong") as! String

        GlobalVariables.dropLat = UserDefaults.standard.object(forKey: "acceptdroplat") as! String

        GlobalVariables.dropLong = UserDefaults.standard.object(forKey: "acceptdroplong") as! String

        GlobalVariables.pickupLoc = UserDefaults.standard.object(forKey: "acceptpickuploc") as! String

        // GlobalVariables.rideid = UserDefaults.standard.object(forKey: "acceptdriverid") as! String

        GlobalVariables.dropLocation = UserDefaults.standard.object(forKey: "acceptdroplocation") as! String


        APIManager.sharedInstance.delegate = self
        APIManager.sharedInstance.viewRideInfo(rideid: GlobalVariables.rideid)

        usernametext.text = GlobalVariables.trackusername
        usermobiletext.text = GlobalVariables.trackusermobile




        if (GlobalVariables.trackridestatus == "3"){
            
            
            droplocationtext.text = GlobalVariables.pickupLoc
            locatedview.isHidden = false
            meterview.isHidden = true
            begintripview.isHidden = true
            endtripview.isHidden = true
            editbtn.isHidden = true
            editimg.isHidden = true
            sosbtn.isHidden = true
            GlobalVariables.checkcurrentstatusvalue = 0
        
        }else if (GlobalVariables.trackridestatus == "5"){
            droplocationtext.text = GlobalVariables.trackdroplocation
            locatedview.isHidden = true
            meterview.isHidden = true
            begintripview.isHidden = false
            endtripview.isHidden = true
            editbtn.isHidden = false
            editimg.isHidden = false
            sosbtn.isHidden = true
            GlobalVariables.checkcurrentstatusvalue = 1
        
        
        }else if (GlobalVariables.trackridestatus == "6"){
            
            droplocationtext.text = GlobalVariables.trackdroplocation
            meterview.isHidden = false
            locatedview.isHidden = true
            begintripview.isHidden = true
            endtripview.isHidden = false
            editbtn.isHidden = false
            editimg.isHidden = false
            sosbtn.isHidden = false
            GlobalVariables.checkcurrentstatusvalue = 2 
            
            
        }
        
        

        
        
        driverid = NsUserDefaultManager.SingeltonInstance.getuserdetails(key: NsUserDefaultManager.KeyDriverid)!
        
        lat = Double(GlobalVariables.pickupLat)!
        long = Double(GlobalVariables.pickupLong)!
     //   pickLoc.text = GlobalVariables.pickupLoc
        
        k = 0
      //  self.locationManager.delegate = self
     //   self.locationManager.startUpdatingLocation()
        mapview.delegate = self
        
        GlobalVariables.ridecurrentstatus = ""
        // self.timerForGetDriverLocation = NSTimer.scheduledTimerWithTimeInterval(10.0, target: self, selector: #selector(DirectController.getDriverLocation(_:)) , userInfo: nil, repeats: true)
        
        
        self.locationManager.delegate = self
        self.locationManager.desiredAccuracy = kCLLocationAccuracyBest
        // self.locationManager.requestWhenInUseAuthorization()
        self.locationManager.requestAlwaysAuthorization()
        
        self.locationManager.startUpdatingLocation()
        
       mapview.isUserInteractionEnabled =  true
        
       mapview.settings.myLocationButton = true
        
        
        
        //   mapView.animateToLocation(CLLocationCoordinate2D(latitude: lat , longitude: long))
    
        mapview.animate(toZoom: 15)
        
      /*  do {
            // Set the map style by passing the URL of the local file.
            if let styleURL = Bundle.main.url(forResource: "black_theme", withExtension: "json") {
                mapview.mapStyle = try GMSMapStyle(contentsOfFileURL: styleURL)
            } else {
                NSLog("Unable to find style.json")
            }
        } catch {
            NSLog("One or more of the map styles failed to load. \(error)")
        }*/
        


        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func sosbtn_click(_ sender: Any) {
        
        
        let refreshAlert = UIAlertController(title:  NSLocalizedString("EMERGENCY FOR CALL", comment: ""), message: NSLocalizedString("Are You in problem ?", comment: ""), preferredStyle: UIAlertControllerStyle.alert)
        
        refreshAlert.addAction(UIAlertAction(title: NSLocalizedString("Yes", comment: "") , style: .default, handler: { (action: UIAlertAction!) in
            
            let storyboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
            let next: EmergencyViewController = storyboard.instantiateViewController(withIdentifier: "EmergencyViewController") as! EmergencyViewController
            self.present(next, animated: true, completion: nil)
            
        }))
        
        
        refreshAlert.addAction(UIAlertAction(title: NSLocalizedString("No", comment: ""), style: .default, handler: { (action: UIAlertAction!) in
            
            refreshAlert .dismiss(animated: true, completion: nil)
            
            
        }))
        
        present(refreshAlert, animated: true, completion: nil)
        
        
    }
    
    
    
    @IBAction func backbtn(_ sender: Any) {
        
        GlobalVariables.trackbackbtnvaluematch = 1
        let storyboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let nextController: OnLineViewController = storyboard.instantiateViewController(withIdentifier: "OnLineViewController") as! OnLineViewController
        
        if let window = self.view.window{
            window.rootViewController = nextController
        }
        
        /*if GlobalVariables.checkbackstatusfromfullride == 1{
             GlobalVariables.checkbackstatusfromfullride = 0
            self.dismissViewcontroller()
           
        
        }else{
        
         self.presentingViewController!.presentingViewController!.dismiss(animated: true, completion: nil)
        
        }*/
        
        
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        if self.dropchange == 1{
            APIManager.sharedInstance.delegate = self
            APIManager.sharedInstance.changeDrop(droplat: GlobalVariables.dropLat, droplong:GlobalVariables.dropLong, droplocation: GlobalVariables.trackdroplocation, rideid: GlobalVariables.rideid)
        }
    }
    
    
   @IBAction func edit_drop_location_click(_ sender: Any) {
        
        let autocompleteController = GMSAutocompleteViewController()
        autocompleteController.delegate = self
        present(autocompleteController, animated: true, completion: nil)
        
        
    }
    
    
    override func viewWillDisappear(_ animated: Bool)
    {
        super.viewWillDisappear(animated)
        
      //  timer1.invalidate()
        k = 1
        
    }
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.first {
            
           
            
            reverseGeocodeCoordinate(location.coordinate)
            
            
        /* if GlobalVariables.checkcurrentstatusvalue == 0{
            
            self.driverLat = String(location.coordinate.latitude)
            self.driverLong = String(location.coordinate.longitude)
            
            
            }else if GlobalVariables.checkcurrentstatusvalue == 2{
            
           // self.EndLat = String(location.coordinate.latitude)
           // self.EndLng = String(location.coordinate.longitude)
            
            
            
          }else{
            
            
            }*/
            
            
            
        }
        
    }
    
  
    
    func getBearing(toPoint point: CLLocationCoordinate2D) {
        
        
        func degreesToRadians(_ degrees: Double) -> Double { return degrees * Double.pi / 180.0 }
        func radiansToDegrees(_ radians: Double) -> Double { return radians * 180.0 / Double.pi }
        
        let lat1 = degreesToRadians(Double(Lat)!)
        let lon1 = degreesToRadians(Double(Lng)!)
        
        print(Lat)
        
        let lat2 = degreesToRadians(point.latitude);
        let lon2 = degreesToRadians(point.longitude);
        
        print(point.latitude)
        
        let dLon = lon2 - lon1;
        
        let y = sin(dLon) * cos(lat2);
        let x = cos(lat1) * sin(lat2) - sin(lat1) * cos(lat2) * cos(dLon);
        
        let radiansBearing1 = atan2(y, x);
        
        radiansBearing = (radiansToDegrees(radiansBearing1))
        
        // return radiansToDegrees(radiansBearing)
    }
    
    
    func reverseGeocodeCoordinate(_ coordinate: CLLocationCoordinate2D) {
        
        let geocoder = GMSGeocoder()
        
        geocoder.reverseGeocodeCoordinate(coordinate) { response, error in
            if let address = response?.firstResult() {
                
              //  self.mapview.clear()
                if GlobalVariables.checkcurrentstatusvalue == 0{
    
                let lines = address.lines
                print("Current loc: \(lines!.joined(separator: "\n"))")
                let driverLoc = lines!.joined(separator: "\n")
                    
                    self.driverLocation = lines!.joined(separator: "\n")
                 
                self.pickuplocationtext.text = lines!.joined(separator: "\n")
                //  let driverLat = String(coordinate.latitude)
                //  let driverLong = String(coordinate.longitude)
                
                // self.setuplocationMarker(CLLocationCoordinate2D(latitude: coordinate.latitude, longitude: coordinate.longitude))
                
                               
                self.k = 0
                
                
                if self.driverLat == ""{
                    
                    self.driverLat = String(coordinate.latitude)
                    self.driverLong = String(coordinate.longitude)
                    
                    
                }
                
                    
                   
                    
             /* let coordinateTo = CLLocation(latitude: coordinate.latitude, longitude: coordinate.longitude)
                
                // let coordinateFrom = CLLocation(latitude: 28.4198, longitude: 77.0382)
                
                let pickuplat = Double(self.driverLat)
                let pickuplng = Double(self.driverLong)
                
                let coordinateFrom = CLLocation(latitude: pickuplat! , longitude: pickuplng!)
                
                let distanceInMeter =  coordinateFrom.distance(from: coordinateTo)
                
                print(distanceInMeter)
                
                
                if distanceInMeter < 10 {
                    print("hello")
                    print(Lat)
                   
                    self.starttimer2()
                    
                }else{*/
                
                self.driverLat = String(coordinate.latitude)
                self.driverLong = String(coordinate.longitude)

                
                    self.getBearing(toPoint: coordinate)
                    
                
                    print(Lat)
                    print(coordinate.latitude)
                    
                    
                    
                    let Message: NSDictionary = ["driver_id": self.driverid , "driver_name": self.drivername , "driver_phone": self.driverphone , "driver_email": self.driveremail , "driver_image": self.driverimage , "driver_password": self.driverpassword , "driver_token": self.defaultdrivertoken , "driver_device_id": self.driverdeviceid , "driver_flag": self.driverflag,"driver_rating": "" ,"driver_car_type_id": self.cartypeid ,"driver_model_id": self.drivermodelid ,"driver_number": self.drivercarno , "driver_city_id": self.drivercityid ,"driver_registration_date": "" ,"driver_lisence": "" ,"driver_rc": "" ,"driver_insurence": "" ,"driver_other_doc": "" ,"driver_last_update": "" ,"driver_last_update_date": "" ,"driver_completed_rides": "" ,"driver_rejected_rides": "" ,"driver_cancelled_rides": "" ,"driver_login_logout": "1" ,"driver_busy_status": "" ,"driver_online_offline_status": "1" ,"driver_detail_status": "" ,"driver_admin_status": "" ,"driver_car_type_name": self.drivercartypename ,"driver_car_model_name": self.drivercarmodelname ,"driver_current_latitude":  self.driverLat ,"driver_current_longitude": self.driverLong ,"driver_location_text": driverLoc ,"timestamp": "","bearingfactor": String(self.radiansBearing)]
                    
                    self.ref.child("Drivers_A").child(self.driverid).setValue(Message)
                    
                    self.starttimer2()
              // }
                    
                }else if GlobalVariables.checkcurrentstatusvalue == 2{
                    
                    
                  //  self.EndLat = String(coordinate.latitude)
                 //   self.EndLng = String(coordinate.longitude)
                    
                    let lines = address.lines

                    //let driverLoc = lines!.joined(separator: "\n")
                    
                    self.pickuplocationtext.text = lines!.joined(separator: "\n")
                    
                    self.EndLocation = lines!.joined(separator: "\n")
                    
                    
                    if self.EndLat == ""{
                        
                        self.EndLat = String(coordinate.latitude)
                        self.EndLng = String(coordinate.longitude)
                        
                        
                    }
                    
                    if self.newEndLat == ""{
                        
                        self.newEndLat = String(coordinate.latitude)
                        self.newEndLng = String(coordinate.longitude)
                        
                        
                    }
                    
                    
                    let coordinateTo = CLLocation(latitude: coordinate.latitude, longitude: coordinate.longitude)
                    
                    // let coordinateFrom = CLLocation(latitude: 28.4198, longitude: 77.0382)
                    
                    let pickuplat = Double(self.newEndLat)
                    let pickuplng = Double(self.newEndLng)
                    
                                      
                    let coordinateFrom = CLLocation(latitude: pickuplat! , longitude: pickuplng!)
                    
                    let distanceInMeter =  coordinateFrom.distance(from: coordinateTo)
                    
                    print(distanceInMeter)
                    
                    
                    if distanceInMeter < 100 {
                        print("hello")
                        
                        print(distanceInMeter)
                        print(Lat)
                         //self.starttimer1()
                        
                    }else{
                        
                        self.newEndLat = String(coordinate.latitude)
                        self.newEndLng = String(coordinate.longitude)
                        
                      self.value5 = self.value5.appending(String(coordinate.latitude) + "," + String(coordinate.longitude) + "|")
                        
                        
                        print(self.value5)
                        
                        
                    /*  let savescript = UserDefaults.standard.string(forKey: "locationArray")
                        
                        print(savescript)
                       
                        
                       if savescript == "blank" {
                        
                        self.value5 = self.value5.appending(String(coordinate.latitude) + "," + String(coordinate.longitude) + "|")
                        
                        
                        
                           //  self.value5 = (savescript?.appending(String(coordinate.latitude) + "," + String(coordinate.longitude) + "|"))!
                            
                       }else{
                        
                        self.value5 = self.value5.appending(savescript!)
                        
                         self.value5 = self.value5.appending(String(coordinate.latitude) + "," + String(coordinate.longitude) + "|")
                        
                        
                        }*/
                        
                      //   self.locationArray.append(self.value5)
                       
                      /*  let locationDictionary:[String:Double] = ["latitude":coordinate.latitude,"longitude":coordinate.longitude]
                    
                      // var locationArray = [[String:Double]]()
                        
                        
                       
                    
                        self.locationArray.append(locationDictionary)*/
                        
                         UserDefaults.standard.set(self.value5, forKey: "locationArray")
                        
                       // print(self.locationArray)
                        
                        
                   }
                    
                    
                    GlobalVariables.emergencylatitude = String(coordinate.latitude)
                    GlobalVariables.emergencylongitude = String(coordinate.longitude)
                        
                        self.EndLat = String(coordinate.latitude)
                        self.EndLng = String(coordinate.longitude)
                        
                        
                        self.getBearing(toPoint: coordinate)
                        
                        
                        print(Lat)
                        print(coordinate.latitude)
                    
                    
                        
                        
                        let Message: NSDictionary = ["driver_id": self.driverid , "driver_name": self.drivername , "driver_phone": self.driverphone , "driver_email": self.driveremail , "driver_image": self.driverimage , "driver_password": self.driverpassword , "driver_token": self.defaultdrivertoken , "driver_device_id": self.driverdeviceid , "driver_flag": self.driverflag,"driver_rating": "" ,"driver_car_type_id": self.cartypeid ,"driver_model_id": self.drivermodelid ,"driver_number": self.drivercarno , "driver_city_id": self.drivercityid ,"driver_registration_date": "" ,"driver_lisence": "" ,"driver_rc": "" ,"driver_insurence": "" ,"driver_other_doc": "" ,"driver_last_update": "" ,"driver_last_update_date": "" ,"driver_completed_rides": "" ,"driver_rejected_rides": "" ,"driver_cancelled_rides": "" ,"driver_login_logout": "1" ,"driver_busy_status": "" ,"driver_online_offline_status": "1" ,"driver_detail_status": "" ,"driver_admin_status": "" ,"driver_car_type_name": self.drivercartypename ,"driver_car_model_name": self.drivercarmodelname ,"driver_current_latitude":  self.EndLat ,"driver_current_longitude": self.EndLng ,"driver_location_text": self.EndLocation ,"timestamp": "","bearingfactor": String(self.radiansBearing)]
                        
                        self.ref.child("Drivers_A").child(self.driverid).setValue(Message)
                        
                         self.starttimer1()
                  // }

                    
                    
                    
                }
                
                
                
                
            }
            
        }
        
    }
    
    
    func starttimer2(){
        
        let latitude = self.driverLat
        
        let longitude = self.driverLong
        
        let bearningdegree = String(radiansBearing)
        
        self.startlat = self.driverLat
        self.startlng = self.driverLong
        
        self.destinationlat = String(GlobalVariables.pickupLat)
        self.destinationlng = String(GlobalVariables.pickupLong)
        
        
        let origin = self.startlat + "," + self.startlng
        let destination = self.destinationlat + "," + self.destinationlng
        
        
        
        
        if self.temparoryvalue1 == 1 {
            //  self.createRoute()
             self.mapview.clear()
            self.getDirections(origin: origin, destination: destination, waypoints: nil, travelMode: nil)
            self.temparorylat = latitude
            self.temparorylong = longitude
            self.temparoryvalue1 = 0
            
        }
        
        
        let coordinateTo = CLLocation(latitude: Double(latitude)!, longitude: Double(longitude)!)
        
        // let coordinateFrom = CLLocation(latitude: 28.4198, longitude: 77.0382)
        
        let pickuplat = Double(self.temparorylat)
        let pickuplng = Double(self.temparorylong)
        
        let coordinateFrom = CLLocation(latitude: pickuplat! , longitude: pickuplng!)
        
        let distanceInMeter =  coordinateFrom.distance(from: coordinateTo)
        
        print(distanceInMeter)
        
        
        let totaldistancevalue = Double(self.totaldistance/30)
        
        print(totaldistancevalue)
        
        if distanceInMeter < totaldistancevalue{
            
        }else{
            
            self.mapview.clear()
            self.temparorylat = latitude
            self.temparorylong = longitude
            self.temparoryvalue1 = 1
            self.markervalue = 1
            //self.createRoute()
            
            self.getDirections(origin: origin, destination: destination, waypoints: nil, travelMode: nil)
        }
        
       // self.cresterootviatrack(lat: latitude, long: longitude,BearningFactor: bearningdegree)
        
        
        
    }
    
    
    func starttimer1(){
        
        let latitude = self.EndLat
        
        let longitude = self.EndLng
        
        let bearningdegree = String(radiansBearing)
        
        self.startlat = self.EndLat
        self.startlng = self.EndLng
        
        self.destinationlat = String(GlobalVariables.dropLat)
        self.destinationlng = String(GlobalVariables.dropLong)
        
        
        let origin = self.startlat + "," + self.startlng
        let destination = self.destinationlat + "," + self.destinationlng
        
        
        
        if self.temparoryvalue == 1 {
            //  self.createRoute()
             self.mapview.clear()
            self.getDirections(origin: origin, destination: destination, waypoints: nil, travelMode: nil)
            self.temparorylat = latitude
            self.temparorylong = longitude
            self.temparoryvalue = 0
            
        }
        
        
        let coordinateTo = CLLocation(latitude: Double(latitude)!, longitude: Double(longitude)!)
        
        // let coordinateFrom = CLLocation(latitude: 28.4198, longitude: 77.0382)
        
        let pickuplat = Double(self.temparorylat)
        let pickuplng = Double(self.temparorylong)
        
        let coordinateFrom = CLLocation(latitude: pickuplat! , longitude: pickuplng!)
        
        let distanceInMeter =  coordinateFrom.distance(from: coordinateTo)
        
        let distanceInKiloMeter = distanceInMeter * 0.001
        
        print(distanceInMeter)
        
        var totaldistancevalue = 0.0
        
        totaldistancevalue = Double(self.totaldistance/30)
        
        
        if totaldistancevalue < 50.0{
        
          totaldistancevalue = 50.0
            
        }else{
            
        totaldistancevalue = Double(self.totaldistance/30)
        
        }
        
        print(totaldistancevalue)
        
        if distanceInMeter < totaldistancevalue{
            
        }else{
            
          // kmvalue.text = String(kmvalueupdate + distanceInKiloMeter)
           // kmvalueupdate = kmvalueupdate + distanceInKiloMeter
            
            let value = kmvalueupdate + distanceInKiloMeter
            kmvalue.text = String(format: "%.2f",value)
            
            kmvalueupdate = kmvalueupdate + distanceInKiloMeter
            
            self.mapview.clear()
            self.temparorylat = latitude
            self.temparorylong = longitude
            self.temparoryvalue = 1
            self.markervalue = 1
            //self.createRoute()
            
            self.getDirections(origin: origin, destination: destination, waypoints: nil, travelMode: nil)
        }
        
      //  self.cresterootviatrack(lat: latitude, long: longitude,BearningFactor: bearningdegree)
        
        
        
    }
    

    
    
    func cresterootviatrack(lat: String , long: String ,BearningFactor : String){
        
        // func cresterootviatrack(lat: String , long: String){
        
        
        let coordinates = CLLocationCoordinate2D(latitude: Double(lat)!, longitude: Double(long)!)
        
        if markervalue == 1 {
            marker = GMSMarker(position: coordinates)
            //marker.icon = UIImage(named: "ic_minicar_30")
            
            markervalue = 0
        }
        
        CATransaction.begin()
        CATransaction.setAnimationDuration(1.0)
        marker.rotation = Double(BearningFactor)!
        CATransaction.commit()
        
        CATransaction.begin()
        CATransaction.setAnimationDuration(1.0)
        marker.position =  coordinates
        CATransaction.commit()
        marker.map = mapview
        
        
        
    }

    
    
    func getDirections(origin: String!, destination: String!, waypoints: Array<String>!, travelMode: AnyObject!){
        if let originLocation = origin {
            if let destinationLocation = destination {
                let directionsURLString = baseURLDirections + "origin=" + originLocation + "&destination=" + destinationLocation + "&key=" + GlobalVariables.googlemapkeys
                
                //  directionsURLString = directionsURLString.stringByAddingPercentEscapesUsingEncoding(NSUTF8StringEncoding)!
                
                let directionsURL = NSURL(string: directionsURLString)
                
                DispatchQueue.main.async(execute: { () -> Void in
                    
                    let directionsData = NSData(contentsOf: directionsURL! as URL)
                    
                    
                    
                    do {
                        
                        let dictonary:Dictionary<String, Any> = try JSONSerialization.jsonObject(with: directionsData! as Data, options: JSONSerialization.ReadingOptions.mutableContainers) as! Dictionary<String, Any>
                        
                        
                        let status = dictonary["status"] as! String
                        
                        let json = JSON(data: directionsData! as Data)
                        
                                               
                        if status == "OK" {
                            
                            self.totaldistance = json["routes"][0]["legs"][0]["distance"]["value"].int!
                            
                            print(self.totaldistance)
                            
                        }
                        
                        self.drawRoute(routeDict: dictonary)
                        
                    } catch {
                        NSLog("One or more of the map styles failed to load. \(error)")
                    }
                    
                    
                })
            }
            else {
                //  completionHandler("Destination is nil.", false)
            }
        }
        else {
            // completionHandler("Origin is nil", false)
        }
        
        
    }
    
    
    func drawRoute(routeDict: Dictionary<String, Any>) {
        
        let routesArray = routeDict["routes"] as! NSArray
        
              
        var bounds = GMSCoordinateBounds()
        if (routesArray.count > 0)
        {
            let routeDict = routesArray[0] as! Dictionary<String, Any>
            let routeOverviewPolyline = routeDict["overview_polyline"] as! Dictionary<String, Any>
            let points = routeOverviewPolyline["points"]
            
            
            // let legs = routeDict["legs"] as! Dictionary<String, Any>
            //  let startLocationDictionary = routeDict["legs"][0]["start_location"] as! Dictionary<String, Any>
            
            self.originCoordinate = CLLocationCoordinate2DMake(Double(self.startlat)!, Double(self.startlng)!)
            
            originMarker = GMSMarker(position: self.originCoordinate)
            
            
            
            self.markerList.append(originMarker)
            
            if GlobalVariables.checkcurrentstatusvalue == 0{
                
                originMarker.icon = UIImage(named: "driver_icon")
                //  originMarker.icon = GMSMarker.markerImage(with: UIColor.red)
            }
            
            else if GlobalVariables.checkcurrentstatusvalue == 2 {
                
                // mapview.isMyLocationEnabled = true
               // originMarker.icon = UIImage(named: "mandy")
                originMarker.icon = UIImage(named: "driver_icon")
            
            }else{
            
            originMarker.icon = GMSMarker.markerImage(with: UIColor.green)
            
            }
            
            originMarker.map = self.mapview
            
            
            self.destinationCoordinate = CLLocationCoordinate2DMake(Double(self.destinationlat)! , Double(self.destinationlng)!)
            
           
            
            destinationMarker = GMSMarker(position: self.destinationCoordinate)
            
           
            self.markerList.append(destinationMarker)
            
            
           if GlobalVariables.checkcurrentstatusvalue == 0{
            
            destinationMarker.icon = UIImage(named: "pick_point")
            
            }else{
            destinationMarker.icon = GMSMarker.markerImage(with: UIColor.red)
            
            }
            destinationMarker.map = self.mapview
            
            
            for marker in markerList {
                bounds = bounds.includingCoordinate(marker.position)
            }
            
            self.path = GMSPath.init(fromEncodedPath: points as! String)!
            
            self.polyline.path = path
           // self.polyline.strokeColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.5)
            self.polyline.strokeColor = UIColor.black
            self.polyline.strokeWidth = 3.0
            self.polyline.map = self.mapview
            
            
            
          /* if GlobalVariables.checkcurrentstatusvalue == 2 {
            
          self.timerForGetDriverLocation1 = Timer.scheduledTimer(timeInterval: 5.0, target: self, selector: #selector(TrackRideViewController.getDriverLocation), userInfo: nil, repeats: true)
            
           }else{*/
            
            let update = GMSCameraUpdate.fit(bounds, with: UIEdgeInsetsMake(50, 60, 50, 60))
            mapview.animate(with: update)
            
            
            //}

          
            
            if GlobalVariables.checkcurrentstatusvalue == 0{
                
             //  self.timer1 = Timer.scheduledTimer(timeInterval: 0.080, target: self, selector: #selector(animatePolylinePath), userInfo: nil, repeats: true)
                
            } else if GlobalVariables.checkcurrentstatusvalue == 1{
               // timer1.invalidate()
                
            } else  if GlobalVariables.checkcurrentstatusvalue == 2{
                
              //  self.timer1 = Timer.scheduledTimer(timeInterval: 0.080, target: self, selector: #selector(animatePolylinePath), userInfo: nil, repeats: true)
                
            }

            
           
        }
    }
    
    func animatePolylinePath() {
        if (self.i < self.path.count()) {
            self.animationPath.add(self.path.coordinate(at: self.i))
            self.animationPolyline.path = self.animationPath
            self.animationPolyline.strokeColor = UIColor(red: 26/256, green: 188/256, blue: 156/256, alpha: 1.0)
            self.animationPolyline.strokeWidth = 3
            self.animationPolyline.map = self.mapview
            self.i += 1
        }
        else {
            self.i = 0
            self.animationPath = GMSMutablePath()
            self.animationPolyline.map = nil
        }
    }
    
   /* func getDriverLocation(timer : Timer){
        
     self.mapview.isBuildingsEnabled = false

          mapview.camera = GMSCameraPosition.camera(withLatitude: Double(self.EndLat)!, longitude: Double(self.EndLng)!, zoom: 17.0, bearing: self.radiansBearing, viewingAngle: 67.0)
    }*/
    

    
    
    @IBAction func navigation_btn(_ sender: Any) {
        
        
        
    if (GlobalVariables.trackridestatus == "3"){
        
        
         if(UIApplication.shared.canOpenURL(NSURL(string:"https://maps.google.com")! as URL))
        {
            
            
            UIApplication.shared.openURL(NSURL(string:
                "comgooglemaps-x-callback://?saddr=&daddr=\(Float(GlobalVariables.pickupLat)!),\(Float(GlobalVariables.pickupLong)!)&directionsmode=driving")! as URL)
            
        } else
        {
            NSLog("Can't use com.google.maps://");
        }
            
       
    } else   if (GlobalVariables.trackridestatus == "5"){
        
        
         if(UIApplication.shared.canOpenURL(NSURL(string:"https://maps.google.com")! as URL))
        {
            
            
            UIApplication.shared.openURL(NSURL(string:
                "comgooglemaps-x-callback://?saddr=&daddr=\(Float(GlobalVariables.dropLat)!),\(Float(GlobalVariables.dropLong)!)&directionsmode=driving")! as URL)
        } else
        {
            NSLog("Can't use com.google.maps://");
        }
        
        }
    else if (GlobalVariables.trackridestatus == "6"){
        
        if(UIApplication.shared.canOpenURL(NSURL(string:"https://maps.google.com")! as URL))

        {
        
            UIApplication.shared.openURL(NSURL(string:
                "comgooglemaps-x-callback://?saddr=&daddr=\(Float(GlobalVariables.dropLat)!),\(Float(GlobalVariables.dropLong)!)&directionsmode=driving")! as URL)
        }else{
        
         NSLog("Can't use comgooglemaps://");
        }
        
               }
        
        
        
    }
    
    
    
    @IBAction func locatedcancelbtn(_ sender: Any) {
        
        let storyboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let next: ReasonDialogViewController = storyboard.instantiateViewController(withIdentifier: "ReasonDialogViewController") as! ReasonDialogViewController
        next.modalPresentationStyle = UIModalPresentationStyle.overCurrentContext
        next.modalTransitionStyle = UIModalTransitionStyle.crossDissolve
        next.movefrom = ""
        self.present(next, animated: true, completion: nil)
        

    }
    
    @IBAction func Located_btn_click(_ sender: Any) {
        
      /*  let refreshAlert = UIAlertController(title: "", message: NSLocalizedString("Do you want to change the status of ride ? ", comment: ""), preferredStyle: UIAlertControllerStyle.alert)
        
        refreshAlert.addAction(UIAlertAction(title: NSLocalizedString("Yes", comment: ""), style: .default, handler: { (action: UIAlertAction!) in*/
            
            self.mapview.clear()
            
             //  self.locationManager.stopUpdatingLocation()
            GlobalVariables.checkcurrentstatusvalue = 1
            
            if GlobalVariables.dropLat == "0.0"{
                self.mapview.isMyLocationEnabled = true
                self.mapview.settings.myLocationButton = true
               // self.timer1.invalidate()
                
                self.mapview.animate(toZoom: 15)
                
            }
            
            
            
            APIManager.sharedInstance.delegate = self
            APIManager.sharedInstance.driverArrived(rideid: GlobalVariables.rideid, driverid: self.driverid)
            
      /*  }))
        
        refreshAlert.addAction(UIAlertAction(title: NSLocalizedString("No", comment: ""), style: .default, handler: { (action: UIAlertAction!) in
            
            refreshAlert .dismiss(animated: true, completion: nil)
            
            
        }))
        
        present(refreshAlert, animated: true, completion: nil)*/
        
        
    }
    
    @IBAction func begintripcancelbtn(_ sender: Any) {
        
        let storyboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let next: ReasonDialogViewController = storyboard.instantiateViewController(withIdentifier: "ReasonDialogViewController") as! ReasonDialogViewController
        next.modalPresentationStyle = UIModalPresentationStyle.overCurrentContext
        next.modalTransitionStyle = UIModalTransitionStyle.crossDissolve
        next.movefrom = ""
        self.present(next, animated: true, completion: nil)
        

        
        
    }
    
    @IBAction func begintrip_btn_click(_ sender: Any) {
        
        if GlobalVariables.dropLat == "0.0"{
            
            // self.mapview.isMyLocationEnabled = true
            // self.mapview.settings.myLocationButton = true
            //self.timer1.invalidate()
            
            //  self.mapview.animate(toZoom: 15)
            
            let alert = UIAlertController(title: NSLocalizedString("Before begin trip", comment: ""), message: NSLocalizedString("Please enter drop location first", comment: ""), preferredStyle: .alert)
            let action = UIAlertAction(title: NSLocalizedString("OK", comment: ""), style: .default) { _ in
                
            }
            alert.addAction(action)
            self.present(alert, animated: true){}

        }
        
        
        let refreshAlert = UIAlertController(title: "", message: NSLocalizedString("Do you want to start ride ? ", comment: ""), preferredStyle: UIAlertControllerStyle.alert)
        
        refreshAlert.addAction(UIAlertAction(title: NSLocalizedString("Yes", comment: ""), style: .default, handler: { (action: UIAlertAction!) in
            
             self.mapview.clear()
            
            self.locationManager.delegate = self
            self.locationManager.desiredAccuracy = kCLLocationAccuracyBest
            // self.locationManager.requestWhenInUseAuthorization()
            self.locationManager.requestAlwaysAuthorization()
            
            self.locationManager.startUpdatingLocation()
            
            UserDefaults.standard.set("blank", forKey: "locationArray")
            
            GlobalVariables.checkcurrentstatusvalue = 2
            
            if self.driverLat == ""{
                
                self.driverLat = GlobalVariables.pickupLat
                self.driverLong = GlobalVariables.pickupLong
                self.driverLocation = GlobalVariables.pickupLoc
                
            }
            
            APIManager.sharedInstance.delegate = self
            APIManager.sharedInstance.rideBegin(rideid: GlobalVariables.rideid, bLat: self.driverLat, bLong: self.driverLong, bLocation:  self.driverLocation, driverId: self.driverid)
            //       self.begin_trip.isHidden = true
            //       self.end_trip.isHidden = false
            
            //       self.createRoute()
            
        }))
        
        refreshAlert.addAction(UIAlertAction(title: NSLocalizedString("No", comment: ""), style: .default, handler: { (action: UIAlertAction!) in
            
            refreshAlert .dismiss(animated: true, completion: nil)
            
            
        }))
        
        present(refreshAlert, animated: true, completion: nil)
        
        
    }
    
    @IBAction func endtrip_btn_click(_ sender: Any) {
        
        let refreshAlert = UIAlertController(title: "", message: NSLocalizedString("Do you want to end ride ? ", comment: ""), preferredStyle: UIAlertControllerStyle.alert)
        
        refreshAlert.addAction(UIAlertAction(title: NSLocalizedString("Yes", comment: ""), style: .default, handler: { (action: UIAlertAction!) in
            
            
            
            self.locationManager.stopUpdatingLocation()
            
            if self.EndLat == ""{
                
                self.EndLat = GlobalVariables.dropLat
                self.EndLng = GlobalVariables.dropLong
                self.EndLocation = GlobalVariables.dropLocation
                
            }
            
            if self.value5 == ""{
                
                self.truncated = ""
            }else{
                
                self.truncated = self.value5.substring(to: self.value5.index(before: self.value5.endIndex))
            }

            self.timerForGetDriverLocation1.invalidate()
                   
            APIManager.sharedInstance.delegate = self
            APIManager.sharedInstance.rideEnd(rideId: GlobalVariables.rideid, bLat: GlobalVariables.pickupLat, bLong: GlobalVariables.pickupLong, bLocation: GlobalVariables.pickupLoc, eLat: self.EndLat, eLong: self.EndLng, eLocation: self.EndLocation, eTime: "", driverid: self.driverid, dist: String(self.kmvalueupdate * 1000),LatLongScript: self.truncated)
            
        }))
        
        refreshAlert.addAction(UIAlertAction(title: NSLocalizedString("No", comment: ""), style: .default, handler: { (action: UIAlertAction!) in
            
            refreshAlert .dismiss(animated: true, completion: nil)
            
            
        }))
        
        present(refreshAlert, animated: true, completion: nil)
        
        
        
    }
    
     func onSuccessState(_ data: AnyObject , resultCode: Int) {
        
        
      
            if (resultCode == 198){
                self.data = data as! Arrived
                
                if(self.data.result == 419){
                    
                    NsUserDefaultManager.SingeltonInstance.logOut()
                    let storyboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
                    let next: SplashViewController = storyboard.instantiateViewController(withIdentifier: "SplashViewController") as! SplashViewController
                    self.present(next, animated: true, completion: nil)
                    
                    
                    
                }else if self.data.result == 1 {
                    
                    droplocationtext.text = GlobalVariables.trackdroplocation
                    locatedview.isHidden = true
                    meterview.isHidden = true
                    begintripview.isHidden = false
                    endtripview.isHidden = true
                    editbtn.isHidden = false
                    editimg.isHidden = false
                    sosbtn.isHidden = true
                    
                    
                    
                    GlobalVariables.trackridestatus = "5"
                    
                    let Message: NSDictionary = ["changed_destination": "0","ride_id": (self.data.details?.rideId)!,"ride_status": "5","done_ride_id": ""]
                    
                    self.ref.child("RideTable").child(GlobalVariables.rideid).setValue(Message)
                    

                    
                    if GlobalVariables.dropLat == "0.0"{
                        
                 
                        
                    }else{

                    startlat = self.driverLat
                    startlng = self.driverLong
                        
                        
                    NsUserDefaultManager.SingeltonInstance.RideAccept(DriverId: (self.data.details?.driverId)!, RideId: (self.data.details?.rideId)!, PickUpLoc: (GlobalVariables.pickupLoc), CustId: "", PickUpLat: (GlobalVariables.pickupLat), PickUpLong: (GlobalVariables.pickupLong), TrackUserName: (GlobalVariables.trackusername), TrackUserMobile: (GlobalVariables.trackusermobile), TrackDropLocation: (GlobalVariables.trackdroplocation), TrackRideStatus: (GlobalVariables.trackridestatus), DropLat: (GlobalVariables.dropLat), DropLong: (GlobalVariables.dropLong), DropLocation: (GlobalVariables.dropLocation))
                    
                   
                    destinationlat = GlobalVariables.dropLat
                    destinationlng = GlobalVariables.dropLong
                    
                    
                    let origin = startlat + "," + startlng
                    let destination = destinationlat + "," + destinationlng
                    
                    self.getDirections(origin: origin, destination: destination, waypoints: nil, travelMode: nil)

                    }
                }
            }
        
        if (resultCode == 220){
            self.beginData = data as! RideBegin
            
            
            if(self.beginData.result == 419){
                
                NsUserDefaultManager.SingeltonInstance.logOut()
                let storyboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
                let next: SplashViewController = storyboard.instantiateViewController(withIdentifier: "SplashViewController") as! SplashViewController
                self.present(next, animated: true, completion: nil)
                
                
                
            }else if self.beginData.result == 1 {
                
                
                
                GlobalVariables.trackridestatus = "6"
                let Message: NSDictionary = ["changed_destination": "0","ride_id": (self.beginData.details?.rideId)!,"ride_status": "6","done_ride_id": ""]
                
                self.ref.child("RideTable").child(GlobalVariables.rideid).setValue(Message)
                

                
                
                let alert = UIAlertController(title: "", message:NSLocalizedString(" Ride Started", comment: ""), preferredStyle: .alert)
                let action = UIAlertAction(title: NSLocalizedString("OK", comment: ""), style: .default) { _ in
                    
                     self.droplocationtext.text = GlobalVariables.trackdroplocation
                    GlobalVariables.checkcurrentstatusvalue = 2
                    
                    
                                      
                    NsUserDefaultManager.SingeltonInstance.RideAccept(DriverId: (self.beginData.details?.driverId)!, RideId: (self.beginData.details?.rideId)!, PickUpLoc: (GlobalVariables.pickupLoc), CustId: "", PickUpLat: (GlobalVariables.pickupLat), PickUpLong: (GlobalVariables.pickupLong), TrackUserName: (GlobalVariables.trackusername), TrackUserMobile: (GlobalVariables.trackusermobile), TrackDropLocation: (GlobalVariables.trackdroplocation), TrackRideStatus: (GlobalVariables.trackridestatus), DropLat: (GlobalVariables.dropLat), DropLong: (GlobalVariables.dropLong), DropLocation: (GlobalVariables.dropLocation))
                    
                    self.locatedview.isHidden = true
                     self.begintripview.isHidden = true
                     self.meterview.isHidden = false
                     self.endtripview.isHidden = false
                    self.editbtn.isHidden = false
                    self.editimg.isHidden = false
                    self.sosbtn.isHidden = false

                    
                }
                alert.addAction(action)
                self.present(alert, animated: true){}
                
               
            }
        }
        
        if (resultCode == 209){
            self.enddata = data as! RideEnd
            
            
            if(self.enddata.result == 419){
                
                NsUserDefaultManager.SingeltonInstance.logOut()
                let storyboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
                let next: SplashViewController = storyboard.instantiateViewController(withIdentifier: "SplashViewController") as! SplashViewController
                self.present(next, animated: true, completion: nil)
                
                
                
            }else if (self.enddata.result == 1){
                
                self.kmvalueupdate = 0.0
                GlobalVariables.checkcurrentstatusvalue = 0
                 UserDefaults.standard.set("blank", forKey: "locationArray")
                
                let Message: NSDictionary = ["changed_destination": "0","ride_id": (self.enddata.details?.rideId)!,"ride_status": "7","done_ride_id": (self.enddata.details?.doneRideId)!]
                
                self.ref.child("RideTable").child(GlobalVariables.rideid).setValue(Message)
                

                
                NsUserDefaultManager.SingeltonInstance.RideAccept(DriverId: (self.enddata.details?.driverId)!, RideId: (self.enddata.details?.rideId)!, PickUpLoc: (GlobalVariables.pickupLoc), CustId: "", PickUpLat: (GlobalVariables.pickupLat), PickUpLong: (GlobalVariables.pickupLong), TrackUserName: (GlobalVariables.trackusername), TrackUserMobile: (GlobalVariables.trackusermobile), TrackDropLocation: (self.enddata.details?.endLocation)!, TrackRideStatus: (GlobalVariables.trackridestatus), DropLat: (self.enddata.details?.endLat)!, DropLong: (self.enddata.details?.endLong)!, DropLocation: (self.enddata.details?.endLocation)!)

                GlobalVariables.matchString = "my"
                GlobalVariables.totalamount = (self.enddata.details?.amount!)!
                GlobalVariables.totaldistance = (self.enddata.details?.distance!)!
                GlobalVariables.totaltime = (self.enddata.details?.totTime!)!
                GlobalVariables.rideid = (self.enddata.details?.rideId!)!
                GlobalVariables.donerideid = (self.enddata.details?.doneRideId)!
                
                let storyboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
                let next: RideFareViewController = storyboard.instantiateViewController(withIdentifier: "RideFareViewController") as! RideFareViewController
                
                self.present(next, animated: true, completion: nil)
            }else{
                
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
                
                GlobalVariables.trackridestatus = (self.ridedata.details?.rideStatus!)!
                GlobalVariables.trackdroplocation = (self.ridedata.details?.dropLocation)!
                
                
                 NsUserDefaultManager.SingeltonInstance.RideAccept(DriverId: (self.ridedata.details?.driverId)!, RideId: (self.ridedata.details?.rideId)!, PickUpLoc: (GlobalVariables.pickupLoc), CustId: "", PickUpLat: (GlobalVariables.pickupLat), PickUpLong: (GlobalVariables.pickupLong), TrackUserName: (GlobalVariables.trackusername), TrackUserMobile: (GlobalVariables.trackusermobile), TrackDropLocation: (GlobalVariables.trackdroplocation), TrackRideStatus: (GlobalVariables.trackridestatus), DropLat: (GlobalVariables.dropLat), DropLong: (GlobalVariables.dropLong), DropLocation: (GlobalVariables.dropLocation))
                
                
                if GlobalVariables.checkcurrentstatusvalue == 1{
                    
                    
                    
                    self.startlat = (self.ridedata.details?.pickupLat)!
                    self.startlng = (self.ridedata.details?.pickupLong)!
                    
                    self.destinationlat = (self.ridedata.details?.dropLat)!
                    self.destinationlng = (self.ridedata.details?.dropLong)!
                    
                    self.mapview.clear()
                    
                    let origin = self.startlat + "," + self.startlng
                    let destination = self.destinationlat + "," + self.destinationlng
                    
                    
                    self.getDirections(origin: origin, destination: destination, waypoints: nil, travelMode: nil)
                    
                }
                
                
                if (GlobalVariables.trackridestatus == "3"){
                    
                    
                  
                    // slidearriveview.delegate = self
                    droplocationtext.text = GlobalVariables.pickupLoc
                    locatedview.isHidden = false
                     meterview.isHidden = true
                    begintripview.isHidden = true
                    endtripview.isHidden = true
                    editbtn.isHidden = true
                    editimg.isHidden = true
                    sosbtn.isHidden = true
                   
                    GlobalVariables.checkcurrentstatusvalue = 0
                    
                }else if (GlobalVariables.trackridestatus == "5"){
                    // slidestartview.delegate = self
                     droplocationtext.text = GlobalVariables.trackdroplocation
                    
                    
                    
                  
                    locatedview.isHidden = true
                     meterview.isHidden = true
                    begintripview.isHidden = false
                    endtripview.isHidden = true
                    editbtn.isHidden = false
                    editimg.isHidden = false
                    sosbtn.isHidden = true
                  
                    GlobalVariables.checkcurrentstatusvalue = 1
                    
                    
                }else if (GlobalVariables.trackridestatus == "6"){
                                       //  slideendview.delegate = self
                    
                     droplocationtext.text = GlobalVariables.trackdroplocation
                    locatedview.isHidden = true
                     meterview.isHidden = false
                    begintripview.isHidden = true
                    endtripview.isHidden = false
                    editbtn.isHidden = false
                    editimg.isHidden = false
                    sosbtn.isHidden = false
                 GlobalVariables.checkcurrentstatusvalue = 2
                    
                    
                }
                    
                    
                else{
                    
                }
                //droplocationtext.text = self.ridedata.details?.dropLocation!
              /*  self.destinationlat = (self.ridedata.details?.dropLat!)!
                self.destinationlng = (self.ridedata.details?.dropLong!)!
                
                
                let origin = self.startlat + "," + self.startlng
                let destination = self.destinationlat + "," + self.destinationlng
                
                
                self.getDirections(origin: origin, destination: destination, waypoints: nil, travelMode: nil)*/
                
            }
        }

        
        if resultCode == 675{
            self.changeData = data as! DropChange
            
            if self.changeData.result == 1{
                
                
                self.dropchange = 0
                
                GlobalVariables.trackridestatus = (self.changeData.details?.rideStatus!)!
                
              
                
                let Message: NSDictionary = ["changed_destination": "1","ride_id": (self.changeData.details?.rideId)!,"ride_status":  GlobalVariables.trackridestatus,"done_ride_id": ""]
                
                self.ref.child("RideTable").child(GlobalVariables.rideid).setValue(Message)
                

                
                 NsUserDefaultManager.SingeltonInstance.RideAccept(DriverId: (self.changeData.details?.driverId)!, RideId: (self.changeData.details?.rideId)!, PickUpLoc: (GlobalVariables.pickupLoc), CustId: "", PickUpLat: (GlobalVariables.pickupLat), PickUpLong: (GlobalVariables.pickupLong), TrackUserName: (GlobalVariables.trackusername), TrackUserMobile: (GlobalVariables.trackusermobile), TrackDropLocation: (self.changeData.details?.dropLocation)!, TrackRideStatus: (GlobalVariables.trackridestatus), DropLat: (self.changeData.details?.dropLat)!, DropLong: (self.changeData.details?.dropLong)!, DropLocation: (self.changeData.details?.dropLocation)!)
                
                
                    
                    droplocationtext.text = self.changeData.details?.dropLocation!
                
                self.destinationlat = (self.changeData.details?.dropLat!)!
                self.destinationlng = (self.changeData.details?.dropLong!)!
                
                self.mapview.clear()
                
                let origin = self.startlat + "," + self.startlng
                let destination = self.destinationlat + "," + self.destinationlng
                
                
                self.getDirections(origin: origin, destination: destination, waypoints: nil, travelMode: nil)
            }
        }
        
        
        
    }


  
}


extension TrackRideViewController {
    
    // Handle the user's selection.
    func viewController(_ viewController: GMSAutocompleteViewController, didAutocompleteWith place: GMSPlace) {
        print(place)
        print("Place name: \(place.name)")
        print("Place address: \(place.formattedAddress)")
        print("Place attributions: \(place.attributions)")
        print("Place attributions: \(place.coordinate.latitude)")
        print("Place attributions: \(place.coordinate.longitude)")
        //  manualloactioncheck = "manual"
        
        // GlobalVarible.Pickuptext = place.formattedAddress!
        // GlobalVarible.UserDropLocationText = place.formattedAddress!
        GlobalVariables.trackdroplocation = place.name
        GlobalVariables.dropLat = String(place.coordinate.latitude)
        GlobalVariables.dropLong = String(place.coordinate.longitude)
        
        self.dropchange = 1
        
        
        dismiss(animated: true, completion: nil)
    }
    
    func viewController(_ viewController: GMSAutocompleteViewController, didFailAutocompleteWithError error: Error) {
        // TODO: handle the error.
        print("Error: ", error.localizedDescription)
    }
    
    // User canceled the operation.
    func wasCancelled(_ viewController: GMSAutocompleteViewController) {
        dismiss(animated: true, completion: nil)
    }
    
    // Turn the network activity indicator on and off again.
    func didRequestAutocompletePredictions(_ viewController: GMSAutocompleteViewController) {
        UIApplication.shared.isNetworkActivityIndicatorVisible = true
    }
    
    func didUpdateAutocompletePredictions(_ viewController: GMSAutocompleteViewController) {
        UIApplication.shared.isNetworkActivityIndicatorVisible = false
    }
    
}


