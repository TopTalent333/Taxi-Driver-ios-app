//
//  OnLineViewController.swift
//  Apporio Taxi Driver
//
//  Created by AppOrio on 06/06/17.
//  Copyright © 2017 apporio. All rights reserved.
//

import UIKit
import GoogleMaps
import CoreLocation
import Firebase
import MessageUI
import AlamofireImage


class POIItem: NSObject, GMUClusterItem {
    var position: CLLocationCoordinate2D
    var name: String!
    
    init(position: CLLocationCoordinate2D, name: String) {
        self.position = position
        self.name = name
    }
}


class OnLineViewController: UIViewController ,GMSMapViewDelegate , ParsingStates, CLLocationManagerDelegate ,UITableViewDelegate, UITableViewDataSource , MFMailComposeViewControllerDelegate,GMUClusterManagerDelegate  {
   
    @IBOutlet weak var onoffdutyimageview: UIImageView!
    
   private var clusterManager: GMUClusterManager!
    
   private var heatmap: GMUHeatmapTileLayer?
    
  
    
    @IBOutlet weak var onlinelabel: UILabel!
    
    @IBOutlet weak var offlinelabel: UILabel!
    
     var driversyncdata: DriverSyncModel!
    
    @IBOutlet weak var displayView: UIView!
    var TextArray = [String]()
    var ImageArray = [String]()
    let imageUrl = API_URLs.imagedomain
    //  var drivername = ""
    //  var driverid = ""
    // var driveremail = ""
    
    @IBOutlet weak var email_id: UILabel!
    @IBOutlet weak var profileName: UILabel!
    @IBOutlet weak var profile_image: UIImageView!
    
    @IBOutlet weak var menutable: UITableView!
    
    @IBOutlet weak var innerview: UIView!
    
    @IBOutlet weak var mainView: UIView!
    
    @IBOutlet var switchBtn: UISwitch!
    
    @IBOutlet weak var citynametext: UILabel!
    
    @IBOutlet weak var DriversCarImage: UIImageView!
    
    @IBOutlet var slidingview: UIView!
    
    let blackView = UIView()
    
    var radiansBearing : Double = 0.0
    
    var locationMarker: GMSMarker!
    var latitude : Double = 0.0
    var longitude : Double = 0.0
    var currentLocation: String = ""
    var data: OnLineOffline!
    var homeData: DriverHome!
    var heatmapdata: HeatMapModel!
    
    var driverid = ""
    let locationManager = CLLocationManager()
    let camera = GMSCameraPosition.camera(withLatitude: -33.86, longitude: 151.20, zoom: 6)
    
    var navigationlbl = UILabel()
    
    @IBOutlet weak var locationview: UIView!
    var kz = 0
    
    var onappstartvalue = 0
    
    var checkonofflinevalue = 0
  
    
    var valuematch = 0
    
    var ref = Database.database().reference()
    
    var ref1 = Database.database().reference()
    
    @IBOutlet weak var dNameLabel: UILabel!
    @IBOutlet weak var open_menu: UIBarButtonItem!
    @IBOutlet weak var carNoLabel: UILabel!
    @IBOutlet weak var carNameLabel: UILabel!
    @IBOutlet weak var mapView: GMSMapView!
    @IBOutlet weak var userFinalLocation: UILabel!
    
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
    
    var cityname = NsUserDefaultManager.SingeltonInstance.getuserdetails(key: NsUserDefaultManager.KeyCityName)!

    
    @IBOutlet weak var demandspotview: UIView!
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        self.demandspotview.layer.borderWidth = 1.0
        self.demandspotview.layer.cornerRadius = 4
        self.demandspotview.layer.backgroundColor = UIColor.white.cgColor
        
         GlobalVariables.firebasedriverride = 0
        

        
        profile_image.layer.cornerRadius =  profile_image.frame.width/2
        profile_image.clipsToBounds = true
        profile_image.layer.borderWidth = 1
        profile_image.layer.borderColor = UIColor.black.cgColor
        
        if  GlobalVariables.movefromdemodriver == "demodriver"{
        
//        self.showalert12(message: "You have Logged in as demo driver, by default your car category is MINI")
        }else{
        
        }

        
        self.checkonofflinevalue = 0
        
        let onlineofflinestatus =  UserDefaults.standard.string(forKey: "onoffline_status")
        
            
        
        if onlineofflinestatus == "1" {
        GlobalVariables.checkvaluedriverpressonoffbtn = 1
            onoffstatus = "1"
        }else{
         GlobalVariables.checkvaluedriverpressonoffbtn = 0
             onoffstatus = "2"
        }
        
        
        if  GlobalVariables.checkvaluedriverpressonoffbtn == 0 {
            
        //    GlobalVariables.checkvaluedriverpressonoffbtn = 0
            onoffdutyimageview.image = UIImage(named: "off_duty@70") as UIImage?
       
           onlinelabel.isHidden = true
            offlinelabel.isHidden = false
             onoffstatus = "2"
            
        }else if GlobalVariables.checkvaluedriverpressonoffbtn == 1{
           //  GlobalVariables.checkvaluedriverpressonoffbtn = 1
          onoffdutyimageview.image = UIImage(named: "on_duty@70") as UIImage?
            onlinelabel.isHidden = false
            offlinelabel.isHidden = true
                onoffstatus = "1"
        
        }
        
        
        TextArray = ["Profile","Your Trips","Earnings","Promotions","Report Issue","Customer Support","Terms Conditions","About Us"]
        
        ImageArray = ["ic_profile_circular","ic_trips","ic_earning-1","icons8-Notification Filled-50","system_report","icons8-Gmail-50","ic_terms_condition","ic_about_us"]
        
       
        
        email_id.text = drivername
        profileName.text = driveremail
       citynametext.text = "City " + cityname
        
        let carimage = NsUserDefaultManager.SingeltonInstance.getuserdetails(key: NsUserDefaultManager.KeyDriverCarImage)!
        
        let newUrl1 = imageUrl + carimage
        
        let url1 = URL(string: newUrl1)
        
        
        
        DriversCarImage.af_setImage(withURL:
            url1! as URL,
                                  placeholderImage: UIImage(named: "dress"),
                                  filter: nil,
                                  imageTransition: .crossDissolve(1.0))

        
        let image = NsUserDefaultManager.SingeltonInstance.getuserdetails(key: NsUserDefaultManager.KeyDriverImage)!
        let newUrl = imageUrl + image
        
        let url = URL(string: newUrl)
        
        
        
        profile_image.af_setImage(withURL:
            url! as URL,
                                  placeholderImage: UIImage(named: "dress"),
                                  filter: nil,
                                  imageTransition: .crossDissolve(1.0))
        
        
        
        self.locationview.layer.borderWidth = 1.0
        self.locationview.layer.cornerRadius = 4
        // Do any additional setup after loading the view, typically from a nib.
        self.navigationController?.isNavigationBarHidden = false
        
        self.locationManager.delegate = self
        self.locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
        //  self.locationManager.requestWhenInUseAuthorization()
        self.locationManager.requestAlwaysAuthorization()
        
        self.locationManager.startUpdatingLocation()
        valuematch = 0
        
        self.userFinalLocation.text = GlobalVariables.driverLocation
        driverid = NsUserDefaultManager.SingeltonInstance.getuserdetails(key: NsUserDefaultManager.KeyDriverid)!
        // mapView.animateToLocation(CLLocationCoordinate2D(latitude: Double(Lat)!, longitude: Double(Lng)!))
        mapView.delegate = self
       // mapView.isMyLocationEnabled = true
       // mapView.settings.myLocationButton = true
        mapView.animate(toZoom: 15)
        
        
        
        
        mapView.isUserInteractionEnabled =  false
        
        if GlobalVariables.trackbackbtnvaluematch == 0{
             UserDefaults.standard.setValue("0", forKey:"firebaseride_status")
            APIManager.sharedInstance.delegate = self
            APIManager.sharedInstance.DriverSyncHomeScreeen(DriverId: driverid)
        }else{
            GlobalVariables.trackbackbtnvaluematch = 0
            
        }

        

     //   onoffstatus = "1"
      //  APIManager.sharedInstance.delegate = self
     //   APIManager.sharedInstance.goOnline(driverid: driverid, onlineOffline: "1",driverToken: defaultdrivertoken)
        
        
        
        GlobalVariables.tempValue = "0"
        UIApplication.shared.isIdleTimerDisabled = true
        
        
       /* NotificationCenter.default.addObserver(self, selector: #selector(self.appplicationIsActive), name: NSNotification.Name.UIApplicationDidBecomeActive, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(self.applicationEnteredForeground), name: NSNotification.Name.UIApplicationWillEnterForeground, object: nil)*/
        
        
        carNameLabel.text = NsUserDefaultManager.SingeltonInstance.getuserdetails(key: NsUserDefaultManager.KeyCarModelName)! + "/" + NsUserDefaultManager.SingeltonInstance.getuserdetails(key: NsUserDefaultManager.KeyCarName)!
        
        
        
        dNameLabel.text =  NsUserDefaultManager.SingeltonInstance.getuserdetails(key: NsUserDefaultManager.KeyDrivername)!
        carNoLabel.text =  NsUserDefaultManager.SingeltonInstance.getuserdetails(key: NsUserDefaultManager.KeyCarNo)!
        
        do {
            // Set the map style by passing the URL of the local file.
            if let styleURL = Bundle.main.url(forResource: "uber_theme", withExtension: "json") {
                mapView.mapStyle = try GMSMapStyle(contentsOfFileURL: styleURL)
            } else {
                NSLog("Unable to find style.json")
            }
        } catch {
            NSLog("One or more of the map styles failed to load. \(error)")
        }
        

        GlobalVariables.timerForGetDriverLocation5 = Timer.scheduledTimer(timeInterval: 5.0, target: self, selector: #selector(OnLineViewController.checkridestatus), userInfo: nil, repeats: true)


        // Do any additional setup after loading the view.
    }
    
    
    
    func checkridestatus(){
        
        
        
        
        ref1.child("Activeride").child(self.driverid).observe(.value, with: { (snapshot) in
            
            let value = snapshot.value as? NSDictionary
            
             if let rideid = value?["ride_id"]{
                
                
            // }else{
            
            let rideid = value?["ride_id"] as! String
            
            let ridestatus = value?["ride_status"] as! String
                
                
                print(rideid)
                
                print(ridestatus)
                
                let firebaseridestatus =  UserDefaults.standard.string(forKey: "firebaseride_status")
                
                print(firebaseridestatus)
                
                if ridestatus == firebaseridestatus{
                
                
                }else{
                    
                    
                    if rideid == "No Ride"{
                    
                    
                    }else{
            
              GlobalVariables.rideid = rideid
            
            if ridestatus == "1"{
                
                
             // self.locationManager.stopUpdatingLocation()
                
                
              //  DispatchQueue.main.async(execute: {
                    
                if (GlobalVariables.firebasedriverride == 1){
                    
                    
                }else{
                    
               
                    
                    
                    let storyboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
                    let nextController: AcceptRejectViewController = storyboard.instantiateViewController(withIdentifier: "AcceptRejectViewController") as! AcceptRejectViewController
                    
                    if let window = self.view.window{
                        window.rootViewController = nextController
                    }

                 

                    
                }
                
             // })
            
            }
                
            if ridestatus == "10"{
                
               // self.locationManager.stopUpdatingLocation()
                
                
                
                // DispatchQueue.main.async(execute: {
                    
                    if (GlobalVariables.firebasedriverride == 1){
                        
                        
                    }else{
                    
                    let storyboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
                    let nextController: RentalAcceptRejectViewController = storyboard.instantiateViewController(withIdentifier: "RentalAcceptRejectViewController") as! RentalAcceptRejectViewController
                    
                    if let window = self.view.window{
                        window.rootViewController = nextController
                    }
                    }
                   
                    
               // })

            }
                        
                    }
                    
                }
           
            
            }
            
        
       
        
    }) { (error) in
    print(error.localizedDescription)
    }
    
        
    }
    
    
    func showalert12(message:String)  {
        
        DispatchQueue.main.async(execute: {
            
            let alertController = UIAlertController(title: "", message: message, preferredStyle: .alert)
            
            
            let OKAction = UIAlertAction(title: NSLocalizedString("ok", comment: ""), style: .default) { (action) in
                
                GlobalVariables.movefromdemodriver = ""
                
            }
            alertController.addAction(OKAction)
            
            self.present(alertController, animated: true) {
                
            }
            
            
        })
        
    }

    
    
    @IBAction func toponlineofflinebutton(_ sender: Any) {
        
        let storyboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let nextController: GoONOFFLineViewController = storyboard.instantiateViewController(withIdentifier: "GoONOFFLineViewController") as! GoONOFFLineViewController
        nextController.viewcontrollerself = self
        nextController.modalPresentationStyle = .overCurrentContext
        self.present(nextController, animated: true, completion: nil)
        

        
    }
    
    
    @IBAction func demandspot_btn(_ sender: Any) {
        
        APIManager.sharedInstance.delegate = self
        APIManager.sharedInstance.HeatMapMethod(DriverId: self.driverid)

       mapView.isUserInteractionEnabled =  true
    }
    
    @IBAction func currentlocation_btn(_ sender: Any) {
        
        mapView.clear()
        
        self.locationManager.startUpdatingLocation()
        
        mapView.animate(toZoom: 15)
        
          mapView.isUserInteractionEnabled =  false

    }
    
    
    func callbtnmethod(){
        
         if(NsUserDefaultManager.SingeltonInstance.isloggedin()){
        let storyboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let nextController: GoONOFFLineViewController = storyboard.instantiateViewController(withIdentifier: "GoONOFFLineViewController") as! GoONOFFLineViewController
        nextController.viewcontrollerself = self
        nextController.modalPresentationStyle = .overCurrentContext
        self.present(nextController, animated: true, completion: nil)
         }else{
        
        }
    
    }
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
   func mapView(_ mapView: GMSMapView, didTapAt coordinate: CLLocationCoordinate2D) {
        print("Tapped at location: (\(coordinate.latitude), \(coordinate.longitude))")
    }
    
    // MARK: Private
    func generateHeatmapItems() {
        let extent: Double = 0.2
        
        
     
      //  var items: [GMUWeightedLatLng] = [NSArray: Int((heatmapdata.details?.count)! ]
        
       var items: [GMUWeightedLatLng] = [Any]() as! [GMUWeightedLatLng]
        
        items.removeAll()
        
         var bounds = GMSCoordinateBounds()
        
        for index in 0..<Int((heatmapdata.details?.count)!) {
            let lat: Double = Double(heatmapdata.details![index].pickupLat!)! + extent * randomScale()
            

            
            let lng: Double = Double(heatmapdata.details![index].pickupLong!)! + extent * randomScale()
            
            let item = GMUWeightedLatLng(coordinate: CLLocationCoordinate2DMake(lat, lng), intensity: 1.0)
             bounds = bounds.includingCoordinate(CLLocationCoordinate2DMake(lat, lng))
           // items[index] = item
          items.append(item)
            
        
        }
        
        print(items.count)
        
        
         heatmap?.weightedData = items
        let update = GMSCameraUpdate.fit(bounds, with: UIEdgeInsetsMake(50, 60, 50, 60))
        mapView.animate(with: update)
        heatmap?.map = mapView

        
    }
    
    // Returns a random value between -1.0 and 1.0.
   /* func randomScale() -> Double {
      
        
        return Double(arc4random()) / Double(UINT32_MAX) * 2.0 - 1.0
    }*/
    
    
  func clusterManager(_ clusterManager: GMUClusterManager, didTap cluster: GMUCluster) -> Bool {
        let newCamera = GMSCameraPosition.camera(withTarget: cluster.position,
                                                 zoom: mapView.camera.zoom + 1)
        let update = GMSCameraUpdate.setCamera(newCamera)
        mapView.moveCamera(update)
        return false
    }
    
    // MARK: - GMUMapViewDelegate
    
    func mapView(_ mapView: GMSMapView, didTap marker: GMSMarker) -> Bool {
        if let poiItem = marker.userData as? POIItem {
            NSLog("Did tap marker for cluster item \(poiItem.name)")
        } else {
            NSLog("Did tap a normal marker")
        }
        return false
    }
    
    // MARK: - Private
    
    /// Randomly generates cluster items within some extent of the camera and adds them to the
    /// cluster manager.
    private func generateClusterItems() {
        let extent = 0.2
        
         var bounds = GMSCoordinateBounds()
        
      //  var item = POIItem(position: <#CLLocationCoordinate2D#>, name: <#String#>)
        
        for index in 1..<Int((heatmapdata.details?.count)!) {
            let lat = Double(heatmapdata.details![index].pickupLat!)! + extent * randomScale()
            let lng = Double(heatmapdata.details![index].pickupLong!)! + extent * randomScale()
            let name = "Item \(index)"
            let item = POIItem(position: CLLocationCoordinate2DMake(lat, lng), name: name)
             bounds = bounds.includingCoordinate(CLLocationCoordinate2DMake(lat, lng))
           clusterManager.add(item)
           
        }
        
             
        let update = GMSCameraUpdate.fit(bounds, with: UIEdgeInsetsMake(50, 60, 50, 60))
        mapView.animate(with: update)
        
        
        clusterManager.cluster()
        
        
        clusterManager.setDelegate(self, mapDelegate: self)
    }
    
    /// Returns a random value between -1.0 and 1.0.
    private func randomScale() -> Double {
        return Double(arc4random()) / Double(UINT32_MAX) * 2.0 - 1.0
    }

    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        //locationManager.requestWhenInUseAuthorization()
        
        
        
        if  GlobalVariables.checkvaluedriverpressonoffbtn == 0 {
            
            //    GlobalVariables.checkvaluedriverpressonoffbtn = 0
            onoffdutyimageview.image = UIImage(named: "off_duty@70") as UIImage?
            
            onlinelabel.isHidden = true
            offlinelabel.isHidden = false
            onoffstatus = "2"
           
            
            
        }else if GlobalVariables.checkvaluedriverpressonoffbtn == 1{
            //  GlobalVariables.checkvaluedriverpressonoffbtn = 1
            onoffdutyimageview.image = UIImage(named: "on_duty@70") as UIImage?
            onlinelabel.isHidden = false
            offlinelabel.isHidden = true
             onoffstatus = "1"
            
        }
        

        
        self.slidingview.alpha = 0
        self.blackView.alpha = 0
        
        
        drivername = NsUserDefaultManager.SingeltonInstance.getuserdetails(key: NsUserDefaultManager.KeyDrivername)!
        driveremail = NsUserDefaultManager.SingeltonInstance.getuserdetails(key: NsUserDefaultManager.KeyDriverEmail)!
        email_id.text = drivername
        profileName.text = driveremail
        
        let image = NsUserDefaultManager.SingeltonInstance.getuserdetails(key: NsUserDefaultManager.KeyDriverImage)!
        let newUrl = imageUrl + image
        
        let url = URL(string: newUrl)
        profile_image.af_setImage(withURL:
            url! as URL,
                                  placeholderImage: UIImage(named: "dress"),
                                  filter: nil,
                                  imageTransition: .crossDissolve(1.0))
        
        
        
        
        self.locationManager.requestAlwaysAuthorization()
        
        valuematch = 0
        
    }
    
    @IBAction func menubtn(_ sender: Any) {
        
        
        self.eventAnimationPopUp()
    }
    
    
    func eventAnimationPopUp(){
        
        slidingview.layer.cornerRadius = 5
        slidingview.clipsToBounds = true
        
        if let window = UIApplication.shared.keyWindow{
            print(window.frame)
            blackView.backgroundColor = UIColor(white: 0, alpha: 0.5)
            let lefswipe = (UISwipeGestureRecognizer(target: self, action:#selector(slideToRightWithGestureRecognizer)))
            lefswipe.direction = .left
            self.blackView.addGestureRecognizer(lefswipe)
            blackView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleDismiss)))
            window.addSubview(blackView)
            window.addSubview(slidingview)
            slidingview.frame = CGRect(x: 15, y: 15, width: window.frame.width-100, height: window.frame.height-30)
            blackView.frame = window.frame
            blackView.alpha = 0
            //self.sligingview.alpha = 1
            
            slidingview.slideLeft()
            self.slidingview.alpha = 1
            blackView.alpha = 1
            //sligingview.slideLeft()
            
        }
    }
    func handleDismiss() {
        //sligingview.slideLeft()
        slidingview.slideRight()
        self.slidingview.alpha = 0
        self.blackView.alpha = 0
        //self.blackView.removeFromSuperview()
        //self.sligingview.removeFromSuperview()
    }
    func slideToRightWithGestureRecognizer(_ gesture: UIGestureRecognizer) {
        
        if let swipeGesture = gesture as? UISwipeGestureRecognizer {
            
            
            switch swipeGesture.direction {
            case UISwipeGestureRecognizerDirection.left:
                print("Swiped right")
                slidingview.slideRight()
                self.slidingview.alpha = 0
                self.blackView.alpha = 0
            default:
                break
            }
        }
    }
    
    
    
    
    func configuredMailComposeViewController() -> MFMailComposeViewController {
        let mailComposerVC = MFMailComposeViewController()
        mailComposerVC.mailComposeDelegate = self // Extremely important to set the --mailComposeDelegate-- property, NOT the --delegate-- property
        
        mailComposerVC.setToRecipients([ContactEmail])
        mailComposerVC.setSubject(NSLocalizedString("Report Issue Regarding Tag Your Ride Driver", comment: ""))
        mailComposerVC.setMessageBody(NSLocalizedString("Sending e-mail in-app is not so bad!", comment: ""), isHTML: false)
        
        return mailComposerVC
    }
    
    func showSendMailErrorAlert() {
        
        let alert = UIAlertController(title: NSLocalizedString("Could Not Send Email", comment: ""), message: NSLocalizedString("Your device could not send e-mail.  Please check e-mail configuration and try again.", comment: ""), preferredStyle: .alert)
        let action = UIAlertAction(title: NSLocalizedString("OK", comment: ""), style: .default) { _ in
            
        }
        alert.addAction(action)
        self.present(alert, animated: true){}    }
    
    // MARK: MFMailComposeViewControllerDelegate Method
    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        controller.dismiss(animated: true, completion: nil)
    }
    
    
    // ********************* TableView datasource methods ***************************
    
    
    func numberOfSections(in tableView: UITableView) -> Int
    {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return TextArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MenuTable1", for: indexPath)
        
        cell.selectionStyle = .none
        
        let imageview :UIImageView = (cell.contentView.viewWithTag(1) as? UIImageView)!
        let label : UILabel = (cell.contentView.viewWithTag(2) as? UILabel)!
        let labelshow : UILabel = (cell.contentView.viewWithTag(3) as? UILabel)!
        
        if indexPath.row == 3{
            labelshow.isHidden = false
            
        }else{
            labelshow.isHidden = true
        }
        
        
        label.text = TextArray[indexPath.row]
        imageview.image = UIImage(named: ImageArray[indexPath.row])
      
        imageview.image = imageview.image!.withRenderingMode(.alwaysTemplate)
        imageview.tintColor = UIColor(red:75/256, green: 25/256, blue: 76/256, alpha: 0.8)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let row = indexPath.row
        print("Row:\(row)")
        
        
        
        if (indexPath.row == 0)
        {
            
            
            self.slidingview.alpha = 0
            self.blackView.alpha = 0
            

            let storyboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
            let nextController: EditProfileViewController = storyboard.instantiateViewController(withIdentifier: "EditProfileViewController") as! EditProfileViewController
            self.present(nextController, animated: true, completion: nil)
            //  self.revealViewController().revealToggleAnimated(true)
            
            
            
        }
        
        if (indexPath.row == 1)
        {
            
            
            self.slidingview.alpha = 0
            self.blackView.alpha = 0
            

            let storyboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
            let nextController: YourRideViewController = storyboard.instantiateViewController(withIdentifier: "YourRideViewController") as! YourRideViewController
            self.present(nextController, animated: true, completion: nil)
            
            
            // self.revealViewController().revealToggleAnimated(true)
            
            
            
            
        }
        
        if (indexPath.row == 2)
        {
            
            
            self.slidingview.alpha = 0
            self.blackView.alpha = 0
            

            
            let storyboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
            let nextController: NewEarningController = storyboard.instantiateViewController(withIdentifier: "NewEarningController") as! NewEarningController
            self.present(nextController, animated: true, completion: nil)
            //  self.revealViewController().revealToggleAnimated(true)
            
            
            
            
            
        }
        
        
        if (indexPath.row == 3)
        {
            
            
            self.slidingview.alpha = 0
            self.blackView.alpha = 0
            
            
            
            let storyboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
            let nextController: NotificationViewController = storyboard.instantiateViewController(withIdentifier: "NotificationViewController") as! NotificationViewController
            self.present(nextController, animated: true, completion: nil)
            //  self.revealViewController().revealToggleAnimated(true)
            
            
        }
        
        if (indexPath.row == 4)
        {
            
            self.slidingview.alpha = 0
            self.blackView.alpha = 0
            

            let mailComposeViewController = configuredMailComposeViewController()
            if MFMailComposeViewController.canSendMail() {
                self.present(mailComposeViewController, animated: true, completion: nil)
            } else {
                self.showSendMailErrorAlert()
            }
            //  self.revealViewController().revealToggleAnimated(true)
            
            
        }
        
        if (indexPath.row == 5){
            
            self.slidingview.alpha = 0
            self.blackView.alpha = 0
            

            let storyboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
            let nextController: CustomerSupportViewController = storyboard.instantiateViewController(withIdentifier: "CustomerSupportViewController") as! CustomerSupportViewController
            self.present(nextController, animated: true, completion: nil)
            
            
            
            
            
        }
        
        if (indexPath.row == 6){
            
            self.slidingview.alpha = 0
            self.blackView.alpha = 0
            

            let storyboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
            let nextController: Terms_ConditionViewController = storyboard.instantiateViewController(withIdentifier: "Terms_ConditionViewController") as! Terms_ConditionViewController
            self.present(nextController, animated: true, completion: nil)
            
            // self.revealViewController().revealToggleAnimated(true)
            
            
        }
        
        if(indexPath.row == 7){
            
            
            self.slidingview.alpha = 0
            self.blackView.alpha = 0
            

            
            let storyboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
            let nextController: AboutUsViewController = storyboard.instantiateViewController(withIdentifier: "AboutUsViewController") as! AboutUsViewController
            self.present(nextController, animated: true, completion: nil)
            //  self.revealViewController().revealToggleAnimated(true)
            
            
            
        }
    }
    
    
    
    
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.first {
            
            reverseGeocodeCoordinate(location.coordinate)
            
           
            Lat = String(location.coordinate.latitude)
            Lng = String(location.coordinate.longitude)
            
            finddistancelat = String(location.coordinate.latitude)
            
            finddistancelng = String(location.coordinate.longitude)
            
            
            mapView.animate(toLocation: CLLocationCoordinate2D(latitude: Double(Lat)!, longitude: Double(Lng)!))
           
        }
        
    }
    
    
    
    
   /* func mapView(_ mapView: GMSMapView, idleAt position: GMSCameraPosition) {
        
        
        reverseGeocodeCoordinate(position.target)
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
         GlobalVariables.radiansBearing = (radiansToDegrees(radiansBearing1))
        
        // return radiansToDegrees(radiansBearing)
    }
    
    
    
    func reverseGeocodeCoordinate(_ coordinate: CLLocationCoordinate2D)  {
        
        // 1
        
        let geocoder = GMSGeocoder()
        
        // 2
        geocoder.reverseGeocodeCoordinate(coordinate) { response, error in
            if let address = response?.firstResult() {
                
                //   self.getBearing(toPoint: coordinate)
                //print(address.lines)
                
                GlobalVariables.driverLocation = address.addressLine1()! + " , " + address.addressLine2()!
               let onlineofflinestatus =  UserDefaults.standard.string(forKey: "onoffline_status")
                
                if self.checkonofflinevalue == 0{
                
                if onlineofflinestatus != "1" {
                    self.callbtnmethod()
                    self.checkonofflinevalue = 1

                }
                    
                }
                
                self.userFinalLocation.text = GlobalVariables.driverLocation
                
                if Lat == ""{
                    
                    Lat = String(coordinate.latitude)
                    Lng = String(coordinate.longitude)
                    
                    finddistancelat = String(coordinate.latitude)
                    finddistancelng = String(coordinate.longitude)
                    
                    
                    
                }
                
                       
                let coordinateTo = CLLocation(latitude: coordinate.latitude, longitude: coordinate.longitude)
                
                // let coordinateFrom = CLLocation(latitude: 28.4198, longitude: 77.0382)
                
                let pickuplat = Double(finddistancelat)
                let pickuplng = Double(finddistancelng)
                
                let coordinateFrom = CLLocation(latitude: pickuplat! , longitude: pickuplng!)
                
                let distanceInMeter =  coordinateFrom.distance(from: coordinateTo)
                
                print(distanceInMeter)
                
                if self.onappstartvalue == 0 {
                    
                    
                    
                    let Message: NSDictionary = ["driver_id": self.driverid , "driver_name": self.drivername , "driver_phone": self.driverphone , "driver_email": self.driveremail , "driver_image": self.driverimage , "driver_password": self.driverpassword , "driver_token": self.defaultdrivertoken , "driver_device_id": self.driverdeviceid , "driver_flag": self.driverflag,"driver_rating": "" ,"driver_car_type_id": self.cartypeid ,"driver_model_id": self.drivermodelid ,"driver_number": self.drivercarno , "driver_city_id": self.drivercityid ,"driver_registration_date": "" ,"driver_lisence": "" ,"driver_rc": "" ,"driver_insurence": "" ,"driver_other_doc": "" ,"driver_last_update": "" ,"driver_last_update_date": "" ,"driver_completed_rides": "" ,"driver_rejected_rides": "" ,"driver_cancelled_rides": "" ,"driver_login_logout": "1" ,"driver_busy_status": "" ,"driver_online_offline_status": self.onoffstatus ,"driver_detail_status": "" ,"driver_admin_status": "" ,"driver_car_type_name": self.drivercartypename ,"driver_car_model_name": self.drivercarmodelname ,"driver_current_latitude": Lat ,"driver_current_longitude": Lng ,"driver_location_text": GlobalVariables.driverLocation ,"timestamp": "","bearingfactor": String(self.radiansBearing)]
                    
                    
                    let LocationAturl: CLLocation = CLLocation(latitude: Double(Lat)!, longitude: Double(Lng)!)
                    
                    let geofireRef = self.ref.child("geofire")
                    
                    let geoFire = GeoFire(firebaseRef: geofireRef)
                    
                    geoFire?.setLocation(LocationAturl, forKey: self.driverid)
                    
                    self.ref.child("Drivers_A").child(self.driverid).setValue(Message)
                    
                    
                    APIManager.sharedInstance.delegate = self
                    APIManager.sharedInstance.goDriverHome(driverid: self.driverid, currentLat: Lat, currentLong: Lng , currentLoc: GlobalVariables.driverLocation, driverToken: self.defaultdrivertoken)
                    
                    self.onappstartvalue = 1
                    
                    
                }
                
                
                
                if distanceInMeter < 15 {
                    print("hello")
                    
                    
                    
                }else{
                    
                    
                    self.getBearing(toPoint: coordinate)
                    
                    Lat = String(coordinate.latitude)
                    Lng = String(coordinate.longitude)
                    finddistancelat = String(coordinate.latitude)
                    finddistancelng = String(coordinate.longitude)
                    
                     let onlineofflinestatus =  UserDefaults.standard.string(forKey: "onoffline_status")
                    
                    if onlineofflinestatus == "1"{
                        
                        
                        let Message: NSDictionary = ["driver_id": self.driverid , "driver_name": self.drivername , "driver_phone": self.driverphone , "driver_email": self.driveremail , "driver_image": self.driverimage , "driver_password": self.driverpassword , "driver_token": self.defaultdrivertoken , "driver_device_id": self.driverdeviceid , "driver_flag": self.driverflag,"driver_rating": "" ,"driver_car_type_id": self.cartypeid ,"driver_model_id": self.drivermodelid ,"driver_number": self.drivercarno , "driver_city_id": self.drivercityid ,"driver_registration_date": "" ,"driver_lisence": "" ,"driver_rc": "" ,"driver_insurence": "" ,"driver_other_doc": "" ,"driver_last_update": "" ,"driver_last_update_date": "" ,"driver_completed_rides": "" ,"driver_rejected_rides": "" ,"driver_cancelled_rides": "" ,"driver_login_logout": "1" ,"driver_busy_status": "" ,"driver_online_offline_status": "1" ,"driver_detail_status": "" ,"driver_admin_status": "" ,"driver_car_type_name": self.drivercartypename ,"driver_car_model_name": self.drivercarmodelname ,"driver_current_latitude": Lat ,"driver_current_longitude": Lng ,"driver_location_text": GlobalVariables.driverLocation ,"timestamp": "","bearingfactor": String(self.radiansBearing)]
                        
                        
                        let LocationAturl: CLLocation = CLLocation(latitude: Double(Lat)!, longitude: Double(Lng)!)
                        
                        let geofireRef = self.ref.child("geofire")
                        
                        let geoFire = GeoFire(firebaseRef: geofireRef)
                        
                        geoFire?.setLocation(LocationAturl, forKey: self.driverid)
                        
                        self.ref.child("Drivers_A").child(self.driverid).setValue(Message)
                        
                        
                        APIManager.sharedInstance.delegate = self
                        APIManager.sharedInstance.goDriverHome(driverid: self.driverid, currentLat: Lat, currentLong: Lng , currentLoc: GlobalVariables.driverLocation, driverToken: self.defaultdrivertoken)
                        
                    }else{
                        
                    }
                    
                }
                // print(GlobalVariables.driverLocation)
                //  self.city = address.locality!
                //  GlobalVariables.city = self.city
                //  print(self.city)
                
            }
        }
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
                    
                    self.showAlertMessage("", Message: (self.data.msg!))
                    
                    /*let storyboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
                     let nextController: SWRevealViewController = storyboard.instantiateViewControllerWithIdentifier("SWRevealViewController") as! SWRevealViewController
                     self.presentViewController(nextController, animated: true, completion: nil)*/
                }
            }
            if (resultCode == 121){
                
                self.homeData = data as! DriverHome
                
                
                //  APIManager.sharedInstance.delegate = self
                //  APIManager.sharedInstance.goOnline(driverid, onlineOffline: "1",driverToken: defaultdrivertoken)
                
                if(self.homeData.result == 419){
                    
                    NsUserDefaultManager.SingeltonInstance.logOut()
                    let storyboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
                    let next: SplashViewController = storyboard.instantiateViewController(withIdentifier: "SplashViewController") as! SplashViewController
                    self.present(next, animated: true, completion: nil)
                    
                    
                }else if(self.homeData.result == 1){
                    
                    if homeData.currencyUnicode == "0"{
                        
                       GlobalVariables.currencysymbol = homeData.currencyIsoCode!
                        
                    }else{
                        
                        let charAsString = homeData.currencyUnicode
                        
                        let charAsInt = Int(charAsString!, radix: 16)!
                        let uScalar = UnicodeScalar(charAsInt)!
                        
                        print("\(uScalar)")
                        
                       GlobalVariables.currencysymbol = "\(uScalar)"
                        
                        
                    }
                    
                }
                
            }
            
            if (resultCode == 8023){
                
                self.heatmapdata = data as! HeatMapModel
                
                
                if(self.heatmapdata.result == 1){
                    
                    
                   let iconGenerator = GMUDefaultClusterIconGenerator()
                    let algorithm = GMUNonHierarchicalDistanceBasedAlgorithm()
                    let renderer = GMUDefaultClusterRenderer(mapView: mapView, clusterIconGenerator: iconGenerator)
                    clusterManager = GMUClusterManager(map: mapView, algorithm: algorithm, renderer: renderer)
                    
                    // Generate and add random items to the cluster manager.
                    generateClusterItems()
                    
                    // Call cluster() after items have been added to perform the clustering and rendering on map.
                    

                    
                   /* heatmap = GMUHeatmapTileLayer()
                    
                    // Generate and add random items to the heatmap.
                    generateHeatmapItems()*/
                    
                    
                }else{
                
                }
                
            }
            
            
            
             if (resultCode == 8019){
                
                driversyncdata = data as! DriverSyncModel
                
                if(driversyncdata.result == 0){
                    
                    
                    
                }else
                {
                    
                    if(driversyncdata.details?.rideStatus == "1"){
                        
                         UserDefaults.standard.setValue("1", forKey:"firebaseride_status")
                        
                       GlobalVariables.rideid = (driversyncdata.details?.rideId)!
                        GlobalVariables.trackridestatus = (driversyncdata.details?.rideStatus)!
                       
                        let storyboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
                        let nextController: AcceptRejectViewController = storyboard.instantiateViewController(withIdentifier: "AcceptRejectViewController") as! AcceptRejectViewController
                        self.present(nextController, animated: true, completion: nil)
                        
                        
                    }
                    
                    if(driversyncdata.details?.rideStatus == "3"){
                        
                        
                        GlobalVariables.rideid = (driversyncdata.details?.rideId)!
                        GlobalVariables.trackridestatus = (driversyncdata.details?.rideStatus)!

                    let storyboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
                    let next: TrackRideViewController = storyboard.instantiateViewController(withIdentifier: "TrackRideViewController") as! TrackRideViewController
                    
                    self.present(next, animated: true, completion: nil)

                    }
                    
                    if(driversyncdata.details?.rideStatus == "5"){
                        
                        
                        GlobalVariables.rideid = (driversyncdata.details?.rideId)!
                        GlobalVariables.trackridestatus = (driversyncdata.details?.rideStatus)!
                        
                        let storyboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
                        let next: TrackRideViewController = storyboard.instantiateViewController(withIdentifier: "TrackRideViewController") as! TrackRideViewController
                        
                        self.present(next, animated: true, completion: nil)
                        
                    }
                    
                    if(driversyncdata.details?.rideStatus == "6"){
                        
                        
                        GlobalVariables.rideid = (driversyncdata.details?.rideId)!
                        GlobalVariables.trackridestatus = (driversyncdata.details?.rideStatus)!
                        
                        let storyboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
                        let next: TrackRideViewController = storyboard.instantiateViewController(withIdentifier: "TrackRideViewController") as! TrackRideViewController
                        
                        self.present(next, animated: true, completion: nil)
                        
                    }
                    if(driversyncdata.details?.rideStatus == "8"){
                        
                        GlobalVariables.rideid = (driversyncdata.details?.rideId)!
                        GlobalVariables.trackridestatus = (driversyncdata.details?.rideStatus)!
                        
                        let storyboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
                        let nextController: AcceptRejectViewController = storyboard.instantiateViewController(withIdentifier: "AcceptRejectViewController") as! AcceptRejectViewController
                        self.present(nextController, animated: true, completion: nil)
                        
                        
                    }
                    
                    
                    
                    if(driversyncdata.details?.rideStatus == "10"){
                        
                         UserDefaults.standard.setValue("1", forKey:"firebaseride_status")
                        
                        GlobalVariables.rideid = (driversyncdata.details?.rideId)!
                        GlobalVariables.trackridestatus = (driversyncdata.details?.rideStatus)!
                        
                        let storyboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
                        let nextController: RentalAcceptRejectViewController = storyboard.instantiateViewController(withIdentifier: "RentalAcceptRejectViewController") as! RentalAcceptRejectViewController
                        self.present(nextController, animated: true, completion: nil)
                        
                        
                    }
                    if(driversyncdata.details?.rideStatus == "11"){
                        
                        GlobalVariables.rideid = (driversyncdata.details?.rideId)!
                        GlobalVariables.trackridestatus = (driversyncdata.details?.rideStatus)!
                    
                    let storyboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
                    let next: RentalTrackRideViewController = storyboard.instantiateViewController(withIdentifier: "RentalTrackRideViewController") as! RentalTrackRideViewController
                    
                    self.present(next, animated: true, completion: nil)

                    }
                    
                    if(driversyncdata.details?.rideStatus == "12"){
                        
                        GlobalVariables.rideid = (driversyncdata.details?.rideId)!
                        GlobalVariables.trackridestatus = (driversyncdata.details?.rideStatus)!
                        
                        let storyboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
                        let next: RentalTrackRideViewController = storyboard.instantiateViewController(withIdentifier: "RentalTrackRideViewController") as! RentalTrackRideViewController
                        
                        self.present(next, animated: true, completion: nil)
                        
                    }

                    
                    if(driversyncdata.details?.rideStatus == "13"){
                        
                        GlobalVariables.rideid = (driversyncdata.details?.rideId)!
                        GlobalVariables.trackridestatus = (driversyncdata.details?.rideStatus)!
                        
                        let storyboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
                        let next: RentalTrackRideViewController = storyboard.instantiateViewController(withIdentifier: "RentalTrackRideViewController") as! RentalTrackRideViewController
                        
                        self.present(next, animated: true, completion: nil)
                        
                    }

                    
                    
                }

            }
            
            
        }
        
        
        func showAlertMessage(_ title:String,Message:String){
            
            let alert = UIAlertController(title: title, message: Message, preferredStyle: .alert)
            let action = UIAlertAction(title: NSLocalizedString("OK", comment: ""), style: .default) { _ in
                
            }
            alert.addAction(action)
            self.present(alert, animated: true){}
        }
        
        
    
    }
    


    extension UIView
        
    {
        func slideLeft()
        {
            
            
            let transition = CATransition()
            transition.duration = 0.2
            transition.type = kCATransitionPush
            transition.subtype = kCATransitionFromLeft
            self.layer.add(transition, forKey: kCATransition)
        }
        
        
        
        func slideRight()
        {
            
            let transition = CATransition()
            transition.duration = 0.2
            transition.type = kCATransitionPush
            transition.subtype = kCATransitionFromRight
            self.layer.add(transition, forKey: kCATransition)
            
            
        }
    }

    
