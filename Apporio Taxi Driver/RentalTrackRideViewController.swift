//
//  RentalTrackRideViewController.swift
//  Apporio Taxi Driver
//
//  Created by AppOrio on 04/07/17.
//  Copyright © 2017 apporio. All rights reserved.
//

import UIKit
import GoogleMaps
import Firebase

import KVNProgress

class RentalTrackRideViewController: UIViewController,CLLocationManagerDelegate , ParsingStates ,GMSMapViewDelegate {
    
    var rentalrideinfodata: RentalRideInfoModel!
    var enddata: RentalDriverEndModel!
    
    var beginData: RentalDriverStartModel!
    var arrivedata: RentalDriverArriveModel!
    
    var acceptdataresponse: RentalRideAcceptModel!
    var lat: Double = 0.0
    var long: Double = 0.0
    let locationManager = CLLocationManager()
    var currentLocation: String = ""
    var arrive_time: String = ""
    var arrive_sec: Int = 0
 //   var data: Arrived!
  //  var updateData: UpdateDriverLocation!
    var driverid = ""
    
    var ref = Database.database().reference()
    
    
    
    @IBOutlet weak var topview: UIView!
    
    var timerForGetDriverLocation = Timer()
    
    var k = 0
    
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
    
    var startenddriverlat = ""
    var startenddriverlng = ""
    var startenddriverLoc = ""

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
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        topview.layer.shadowColor = UIColor.gray.cgColor
        topview.layer.shadowOpacity = 1
        topview.layer.shadowOffset = CGSize(width: 0, height: 2)
        topview.layer.shadowRadius = 2
    
        GlobalVariables.trackusername =  UserDefaults.standard.object(forKey: "rentaltrackusername") as! String
        
        GlobalVariables.trackusermobile = UserDefaults.standard.object(forKey: "rentaltrackusermobile") as! String
        
        GlobalVariables.pickupLat = UserDefaults.standard.object(forKey: "rentalpickuplat") as! String
        
        GlobalVariables.pickupLong = UserDefaults.standard.object(forKey: "rentalpickuplong") as! String
        
        GlobalVariables.pickupLoc = UserDefaults.standard.object(forKey: "rentalpickuploc") as! String
        
       // GlobalVariables.rideid = UserDefaults.standard.object(forKey: "rentaltdriverid") as! String
        
        usernametext.text = GlobalVariables.trackusername
        usermobiletext.text = GlobalVariables.trackusermobile
        droplocationtext.text = GlobalVariables.pickupLoc
        
        if (GlobalVariables.trackridestatus == "11"){
            
            locatedview.isHidden = false
            begintripview.isHidden = true
            endtripview.isHidden = true
            GlobalVariables.checkcurrentstatusvalue = 0
            
        }else if (GlobalVariables.trackridestatus == "12"){
            
            locatedview.isHidden = true
            begintripview.isHidden = false
            endtripview.isHidden = true
            GlobalVariables.checkcurrentstatusvalue = 1
            
        }else if (GlobalVariables.trackridestatus == "13"){
            
            locatedview.isHidden = true
            begintripview.isHidden = true
            endtripview.isHidden = false
            GlobalVariables.checkcurrentstatusvalue = 2
            
        }
        
      //  APIManager.sharedInstance.delegate = self
      //  APIManager.sharedInstance.RentalRideInfo(RentalBookindId: GlobalVariables.rideid)

        driverid = NsUserDefaultManager.SingeltonInstance.getuserdetails(key: NsUserDefaultManager.KeyDriverid)!
        
        lat = Double(GlobalVariables.pickupLat)!
        long = Double(GlobalVariables.pickupLong)!
      
        
        k = 0
       
        mapview.delegate = self
        
        GlobalVariables.ridecurrentstatus = ""
        
        
        self.locationManager.delegate = self
        self.locationManager.desiredAccuracy = kCLLocationAccuracyBest
        
        self.locationManager.requestAlwaysAuthorization()
        
        self.locationManager.startUpdatingLocation()
        
        mapview.isUserInteractionEnabled =  true
        mapview.isMyLocationEnabled = true
        mapview.settings.myLocationButton = true
        
        mapview.animate(toZoom: 15)
        
       /* do {
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

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        if GlobalVariables.checkbeginendbtnclick == "BeginClick"{
        
            self.mapview.clear()
            
            self.locationManager.delegate = self
            self.locationManager.desiredAccuracy = kCLLocationAccuracyBest
            // self.locationManager.requestWhenInUseAuthorization()
            self.locationManager.requestAlwaysAuthorization()
            
            self.locationManager.startUpdatingLocation()
            
            
                      
            GlobalVariables.checkcurrentstatusvalue = 2
            
            APIManager.sharedInstance.delegate = self
            APIManager.sharedInstance.RentalRideStart(RentalBookindId: GlobalVariables.rideid, DriverId: self.driverid, DriverToken: self.defaultdrivertoken, bLat: GlobalVariables.pickupLat, bLong: GlobalVariables.pickupLong, bLocation: GlobalVariables.pickupLoc, ReadingImage: GlobalVariables.meterimage, ReadingValue: GlobalVariables.meterreadingvalue)
        
        
        }else if GlobalVariables.checkbeginendbtnclick == "EndClick"{
            
             self.locationManager.stopUpdatingLocation()
            
            APIManager.sharedInstance.delegate = self
            APIManager.sharedInstance.RentalRideEnd(RentalBookindId: GlobalVariables.rideid, DriverId: self.driverid, DriverToken: self.defaultdrivertoken, ELat: self.startenddriverlat, ELong: self.startenddriverlng, ELocation: self.startenddriverLoc, ReadingImage: GlobalVariables.meterimage, ReadingValue: GlobalVariables.meterreadingvalue)
        
        
        
        
        }else{
        
        
        
        }
        
        
       
    
    
    }
    
    
    @IBAction func backbtn(_ sender: Any) {
        
        
        GlobalVariables.trackbackbtnvaluematch = 1
        let storyboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let nextController: OnLineViewController = storyboard.instantiateViewController(withIdentifier: "OnLineViewController") as! OnLineViewController
        
        if let window = self.view.window{
            window.rootViewController = nextController
        }
        
       /* if GlobalVariables.checkbackstatusfromfullride == 1{
            GlobalVariables.checkbackstatusfromfullride = 0
            self.dismissViewcontroller()
            
            
        }else{
            
            self.presentingViewController!.presentingViewController!.dismiss(animated: true, completion: nil)
            
        }*/
        
        
        
        
    }
    
    
    override func viewWillDisappear(_ animated: Bool)
    {
        super.viewWillDisappear(animated)
        
        //  timer1.invalidate()
        k = 1
        
    }
    
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.first {
            
            // reverseGeocodeCoordinate(location.coordinate)
            if GlobalVariables.checkcurrentstatusvalue == 0{
                
            }else if GlobalVariables.checkcurrentstatusvalue == 1{
                
                self.locationManager.stopUpdatingLocation()
            }
            else if GlobalVariables.checkcurrentstatusvalue == 2{
                
            }
            
            mapview.animate(toLocation: CLLocationCoordinate2D(latitude: location.coordinate.latitude, longitude: location.coordinate.longitude))
             mapview.animate(toZoom: 10)
            reverseGeocodeCoordinate(location.coordinate)
            
            
            // self.locationManager.stopUpdatingLocation()
            
        }
        
    }
    
    /* func mapView(_ mapView: GMSMapView, idleAt position: GMSCameraPosition) {
     
     if GlobalVariables.checkcurrentstatusvalue == 0{
     
     reverseGeocodeCoordinate(position.target)
     
     } else if GlobalVariables.checkcurrentstatusvalue == 1{
     
     }
     }*/
    
    
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
                    
                    self.startenddriverLoc = lines!.joined(separator: "\n")
                    
                    self.pickuplocationtext.text = lines!.joined(separator: "\n")
                    self.startenddriverlat = String(coordinate.latitude)
                    self.startenddriverlng = String(coordinate.longitude)
                    
                   //  let driverLat = String(coordinate.latitude)
                    //  let driverLong = String(coordinate.longitude)
                    
                    // self.setuplocationMarker(CLLocationCoordinate2D(latitude: coordinate.latitude, longitude: coordinate.longitude))
                    
                    
                    self.k = 0
                    
                    
                    if self.driverLat == ""{
                        
                        self.driverLat = String(coordinate.latitude)
                        self.driverLong = String(coordinate.longitude)
                        
                        
                    }
                    
                    
                    
                    let coordinateTo = CLLocation(latitude: coordinate.latitude, longitude: coordinate.longitude)
                    
                    // let coordinateFrom = CLLocation(latitude: 28.4198, longitude: 77.0382)
                    
                    let pickuplat = Double(self.driverLat)
                    let pickuplng = Double(self.driverLong)
                    
                    let coordinateFrom = CLLocation(latitude: pickuplat! , longitude: pickuplng!)
                    
                    let distanceInMeter =  coordinateFrom.distance(from: coordinateTo)
                    
                    print(distanceInMeter)
                    
                    
                    if distanceInMeter < 15 {
                        print("hello")
                        print(Lat)
                        self.starttimer2()
                        
                    }else{
                        
                        self.driverLat = String(coordinate.latitude)
                        self.driverLong = String(coordinate.longitude)
                        
                        
                        self.getBearing(toPoint: coordinate)
                        
                        
                        print(Lat)
                        print(coordinate.latitude)
                        
                        
                        
                        let Message: NSDictionary = ["driver_id": self.driverid , "driver_name": self.drivername , "driver_phone": self.driverphone , "driver_email": self.driveremail , "driver_image": self.driverimage , "driver_password": self.driverpassword , "driver_token": self.defaultdrivertoken , "driver_device_id": self.driverdeviceid , "driver_flag": self.driverflag,"driver_rating": "" ,"driver_car_type_id": self.cartypeid ,"driver_model_id": self.drivermodelid ,"driver_number": self.drivercarno , "driver_city_id": self.drivercityid ,"driver_registration_date": "" ,"driver_lisence": "" ,"driver_rc": "" ,"driver_insurence": "" ,"driver_other_doc": "" ,"driver_last_update": "" ,"driver_last_update_date": "" ,"driver_completed_rides": "" ,"driver_rejected_rides": "" ,"driver_cancelled_rides": "" ,"driver_login_logout": "1" ,"driver_busy_status": "" ,"driver_online_offline_status": "1" ,"driver_detail_status": "" ,"driver_admin_status": "" ,"driver_car_type_name": self.drivercartypename ,"driver_car_model_name": self.drivercarmodelname ,"driver_current_latitude":  self.driverLat ,"driver_current_longitude": self.driverLong ,"driver_location_text": driverLoc ,"timestamp": "","bearingfactor": String(self.radiansBearing)]
                        
                        self.ref.child("Drivers_A").child(self.driverid).setValue(Message)
                        
                        self.starttimer2()
                    }
                    
                }else if GlobalVariables.checkcurrentstatusvalue == 2{
                    
                    

                    
                    self.EndLat = String(coordinate.latitude)
                    self.EndLng = String(coordinate.longitude)
                    
                    let lines = address.lines
                    
                    
                    self.startenddriverLoc = lines!.joined(separator: "\n")
                    
                    
                    self.startenddriverlat = String(coordinate.latitude)
                    self.startenddriverlng = String(coordinate.longitude)

                    
                    //let driverLoc = lines!.joined(separator: "\n")
                    
                    self.pickuplocationtext.text = lines!.joined(separator: "\n")
                    
                    self.getBearing(toPoint: coordinate)
                    
                  //  self.starttimer1()
                    
                    
                    
                    
                }
                
                
                
                
            }
            
        }
        
    }
    
    
    func starttimer2(){
        
        let latitude = self.driverLat
        
        let longitude = self.driverLong
        
        let bearningdegree = String(radiansBearing)
        
        self.startlat = Lat
        self.startlng = Lng
        
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
        
        if distanceInMeter < 200{
            
        }else{
            
            self.mapview.clear()
            self.temparorylat = latitude
            self.temparorylong = longitude
            self.temparoryvalue1 = 1
            self.markervalue = 1
            //self.createRoute()
            
            self.getDirections(origin: origin, destination: destination, waypoints: nil, travelMode: nil)
        }
        
       //self.cresterootviatrack(lat: latitude, long: longitude,BearningFactor: bearningdegree)
        
        
        
    }
    
    
    func getDirections(origin: String!, destination: String!, waypoints: Array<String>!, travelMode: AnyObject!){
        if let originLocation = origin {
            if let destinationLocation = destination {
                let directionsURLString = baseURLDirections + "origin=" + originLocation + "&destination=" + destinationLocation  + "&key=" + GlobalVariables.googlemapkeys
                
                //  directionsURLString = directionsURLString.stringByAddingPercentEscapesUsingEncoding(NSUTF8StringEncoding)!
                
                let directionsURL = NSURL(string: directionsURLString)
                
                DispatchQueue.main.async(execute: { () -> Void in
                    
                    let directionsData = NSData(contentsOf: directionsURL! as URL)
                    
                    
                    
                    do {
                        
                        let dictonary:Dictionary<String, Any> = try JSONSerialization.jsonObject(with: directionsData! as Data, options: JSONSerialization.ReadingOptions.mutableContainers) as! Dictionary<String, Any>
                        
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
            
            
              originMarker.icon = UIImage(named: "driver_icon")
           // originMarker.icon = GMSMarker.markerImage(with: UIColor.red)
            
            
            
            originMarker.map = self.mapview
            
            
            self.destinationCoordinate = CLLocationCoordinate2DMake(Double(self.destinationlat)! , Double(self.destinationlng)!)
            
            destinationMarker = GMSMarker(position: self.destinationCoordinate)
            
            
            self.markerList.append(destinationMarker)
            
            
             destinationMarker.icon = UIImage(named: "pick_point")
          //  destinationMarker.icon = GMSMarker.markerImage(with: UIColor.green)
            
            
            destinationMarker.map = self.mapview
            
            
            for marker in markerList {
                bounds = bounds.includingCoordinate(marker.position)
            }
            
            self.path = GMSPath.init(fromEncodedPath: points as! String)!
            
            self.polyline.path = path
            self.polyline.strokeColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.5)
            self.polyline.strokeWidth = 3.0
            self.polyline.map = self.mapview
            let update = GMSCameraUpdate.fit(bounds, with: UIEdgeInsetsMake(50, 60, 50, 60))
            mapview.animate(with: update)
            
            if GlobalVariables.checkcurrentstatusvalue == 0{
                
                self.timer1 = Timer.scheduledTimer(timeInterval: 0.080, target: self, selector: #selector(animatePolylinePath), userInfo: nil, repeats: true)
                
            } else if GlobalVariables.checkcurrentstatusvalue == 1{
                mapview.clear()
                timer1.invalidate()
                
            } else  if GlobalVariables.checkcurrentstatusvalue == 2{
                 mapview.clear()
                 timer1.invalidate()
               // self.timer1 = Timer.scheduledTimer(timeInterval: 0.050, target: self, selector: #selector(animatePolylinePath), userInfo: nil, repeats: true)
                
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
    
    

    

    
    
  /*  func starttimer1(){
        
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
          //  self.getDirections(origin: origin, destination: destination, waypoints: nil, travelMode: nil)
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
        
        if distanceInMeter < 100{
            
        }else{
            
            kmvalue.text = String(kmvalueupdate + distanceInKiloMeter) + " KM"
            kmvalueupdate = kmvalueupdate + distanceInKiloMeter
            
            self.mapview.clear()
            self.temparorylat = latitude
            self.temparorylong = longitude
            self.temparoryvalue = 1
            self.markervalue = 1
            //self.createRoute()
            
           // self.getDirections(origin: origin, destination: destination, waypoints: nil, travelMode: nil)
        }
        
        self.cresterootviatrack(lat: latitude, long: longitude,BearningFactor: bearningdegree)
        
        
        
    }*/
    
    
    
    
    func cresterootviatrack(lat: String , long: String ,BearningFactor : String){
        
        // func cresterootviatrack(lat: String , long: String){
        
        
        let coordinates = CLLocationCoordinate2D(latitude: Double(lat)!, longitude: Double(long)!)
        
        if markervalue == 1 {
            marker = GMSMarker(position: coordinates)
           // marker.icon = UIImage(named: "ic_minicar_30")
            
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
    

    
   /* @IBAction func navigation_btn(_ sender: Any) {
        
        if (GlobalVariables.trackridestatus == "3"){
            
            
            if (UIApplication.shared.canOpenURL(URL(string:"comgooglemaps://")!))
            {
                UIApplication.shared.openURL(NSURL(string:
                    "comgooglemaps://?saddr=&daddr=\(Float(GlobalVariables.pickupLat)!),\(Float(GlobalVariables.pickupLong)!)&directionsmode=driving")! as URL)
            } else
            {
                NSLog("Can't use com.google.maps://");
            }
            
            
        } else   if (GlobalVariables.trackridestatus == "5"){
            
            
            if (UIApplication.shared.canOpenURL(URL(string:"comgooglemaps://")!))
            {
                UIApplication.shared.openURL(NSURL(string:
                    "comgooglemaps://?saddr=&daddr=\(Float(GlobalVariables.dropLat)!),\(Float(GlobalVariables.dropLong)!)&directionsmode=driving")! as URL)
            } else
            {
                NSLog("Can't use com.google.maps://");
            }
            
        }
        else   if (GlobalVariables.trackridestatus == "6"){
            
            
            if (UIApplication.shared.canOpenURL(URL(string:"comgooglemaps://")!))
            {
                UIApplication.shared.openURL(NSURL(string:
                    "comgooglemaps://?saddr=&daddr=\(Float(GlobalVariables.dropLat)!),\(Float(GlobalVariables.dropLong)!)&directionsmode=driving")! as URL)
            } else
            {
                NSLog("Can't use com.google.maps://");
            }
            
        }
        
        
        //  UIApplication.sharedApplication().openURL(NSURL(string:"http://maps.apple.com/?saddr=\(pickUpLatLngAddress.pickupLat),\(pickUpLatLngAddress.pickupLng)&daddr=\(dropLatLngAddress.dropLat),\(dropLatLngAddress.dropLng)")!)
        
        
    }*/
    
    
    
    @IBAction func locatedcancelbtn(_ sender: Any) {
        
        let storyboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let next: ReasonDialogViewController = storyboard.instantiateViewController(withIdentifier: "ReasonDialogViewController") as! ReasonDialogViewController
        next.modalPresentationStyle = UIModalPresentationStyle.overCurrentContext
        next.modalTransitionStyle = UIModalTransitionStyle.crossDissolve
        next.movefrom = "Rentaltype"
        self.present(next, animated: true, completion: nil)
        
        
    }
    
    @IBAction func Located_btn_click(_ sender: Any) {
        
       /* let refreshAlert = UIAlertController(title: "", message: NSLocalizedString("Do you want to change the status of ride ? ", comment: ""), preferredStyle: UIAlertControllerStyle.alert)
        
        refreshAlert.addAction(UIAlertAction(title: NSLocalizedString("Yes", comment: ""), style: .default, handler: { (action: UIAlertAction!) in*/
            
            self.mapview.clear()
            
            //  self.locationManager.stopUpdatingLocation()
            GlobalVariables.checkcurrentstatusvalue = 1
            self.mapview.clear()
            self.timer1.invalidate()
            
            APIManager.sharedInstance.delegate = self
            APIManager.sharedInstance.RentalRideArrive(RentalBookindId: GlobalVariables.rideid, DriverId: self.driverid, DriverToken: self.defaultdrivertoken)
         
            
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
        next.movefrom = "Rentaltype"
        self.present(next, animated: true, completion: nil)
        
        
        
        
    }
    
    @IBAction func begintrip_btn_click(_ sender: Any) {
        
        GlobalVariables.checkcurrentstatusvalue = 2
        mapview.clear()
        timer1.invalidate()

        GlobalVariables.checkbeginendbtnclick = "BeginClick"
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
        let cameraviewcontroller = storyBoard.instantiateViewController(withIdentifier: "CameraViewController") as! CameraViewController
       cameraviewcontroller.viewcontrollerself = self
        cameraviewcontroller.modalPresentationStyle = .overCurrentContext
        //  paymentviewcontroller.modalPresentationStyle = .Popover
        self.present(cameraviewcontroller, animated:true, completion:nil)

        
        
        
        
        
        
    }
    
    @IBAction func endtrip_btn_click(_ sender: Any) {
        
         GlobalVariables.checkbeginendbtnclick = "EndClick"
        
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
        let cameraviewcontroller = storyBoard.instantiateViewController(withIdentifier: "CameraViewController") as! CameraViewController
        cameraviewcontroller.viewcontrollerself = self
        cameraviewcontroller.modalPresentationStyle = .overCurrentContext
        //  paymentviewcontroller.modalPresentationStyle = .Popover
        self.present(cameraviewcontroller, animated:true, completion:nil)
        

        
    
        
        
        
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
                GlobalVariables.trackusername = (self.rentalrideinfodata.details?.userName)!
                GlobalVariables.trackusermobile = (self.rentalrideinfodata.details?.userPhone)!
                
                GlobalVariables.trackridestatus = (self.rentalrideinfodata.details?.bookingStatus)!
                
                usernametext.text = GlobalVariables.trackusername
                usermobiletext.text = GlobalVariables.trackusermobile
                droplocationtext.text = GlobalVariables.pickupLoc
                
                lat = Double(GlobalVariables.pickupLat)!
                long = Double(GlobalVariables.pickupLong)!

            }
            
        }
        
        if (resultCode == 8010){
            self.arrivedata = data as! RentalDriverArriveModel
            
            if(self.arrivedata.status == 419){
                
                 NsUserDefaultManager.SingeltonInstance.logOut()
                
              //  NsUserDefaultManager.SingeltonInstance.logOut()
                let storyboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
                let next: SplashViewController = storyboard.instantiateViewController(withIdentifier: "SplashViewController") as! SplashViewController
                self.present(next, animated: true, completion: nil)
                
                
                
            }else if self.arrivedata.status == 1 {
                
                let Message: NSDictionary = ["changed_destination": "0","ride_id": (self.arrivedata.details?.rentalBookingId)!,"ride_status": "12","done_ride_id": ""]
                
                self.ref.child("RideTable").child(GlobalVariables.rideid).setValue(Message)

                
                locatedview.isHidden = true
                begintripview.isHidden = false
                endtripview.isHidden = true
                
             
                
                
            }
        }
        
        
        if (resultCode == 8011){
            self.beginData = data as! RentalDriverStartModel
            
            
            if(self.beginData.status == 419){
                
                NsUserDefaultManager.SingeltonInstance.logOut()
                
               // NsUserDefaultManager.SingeltonInstance.logOut()
                let storyboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
                let next: SplashViewController = storyboard.instantiateViewController(withIdentifier: "SplashViewController") as! SplashViewController
                self.present(next, animated: true, completion: nil)
                
                
                
            }else if self.beginData.status == 1 {
                
                
                
                
                
                let alert = UIAlertController(title: "", message:NSLocalizedString(" Ride Started", comment: ""), preferredStyle: .alert)
                let action = UIAlertAction(title: NSLocalizedString("OK", comment: ""), style: .default) { _ in
                    
                    
                    let Message: NSDictionary = ["changed_destination": "0","ride_id": (self.beginData.details?.rentalBookingId)!,"ride_status": "13","done_ride_id": ""]
                    
                    self.ref.child("RideTable").child(GlobalVariables.rideid).setValue(Message)

                    
                    
                    self.locationManager.delegate = self
                    self.locationManager.desiredAccuracy = kCLLocationAccuracyBest
                    // self.locationManager.requestWhenInUseAuthorization()
                    self.locationManager.requestAlwaysAuthorization()
                    
                    self.locationManager.startUpdatingLocation()
                    
                    self.locatedview.isHidden = true
                    self.begintripview.isHidden = true
                    self.endtripview.isHidden = false
                     GlobalVariables.checkbeginendbtnclick  = ""
                    
                }
                alert.addAction(action)
                self.present(alert, animated: true){}
                
                
            }
        }
        
        if (resultCode == 8012){
            self.enddata = data as! RentalDriverEndModel
            
            
            if(self.enddata.status == 419){
                  NsUserDefaultManager.SingeltonInstance.logOut()
               // NsUserDefaultManager.SingeltonInstance.logOut()
                let storyboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
                let next: SplashViewController = storyboard.instantiateViewController(withIdentifier: "SplashViewController") as! SplashViewController
                self.present(next, animated: true, completion: nil)
                
                
                
            }else if (self.enddata.status == 1){
                
                
                let Message: NSDictionary = ["changed_destination": "0","ride_id": (self.enddata.details?.rentalBookingId)!,"ride_status": "16","done_ride_id": (self.enddata.details?.rentalBookingId)!]
                
                self.ref.child("RideTable").child(GlobalVariables.rideid).setValue(Message)

                
                self.kmvalueupdate = 0.0
                GlobalVariables.checkcurrentstatusvalue = 0
                 GlobalVariables.checkbeginendbtnclick  = ""
                
              //  GlobalVariables.matchString = "my"
            //    GlobalVariables.totalamount = (self.enddata.details?.!)!
             //   GlobalVariables.totaldistance = (self.enddata.details?.distance!)!
             //   GlobalVariables.totaltime = (self.enddata.details?.totTime!)!
                GlobalVariables.rideid = (self.enddata.details?.rentalBookingId!)!
             //   GlobalVariables.donerideid = (self.enddata.details?.doneRideId)!
                
                let storyboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
                let next: RentalRideFareViewController = storyboard.instantiateViewController(withIdentifier: "RentalRideFareViewController") as! RentalRideFareViewController
                
                self.present(next, animated: true, completion: nil)
                
                
            }else{
                
            }
        }
        


   
        



    }

    

   

}
