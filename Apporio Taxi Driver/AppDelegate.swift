//
//  AppDelegate.swift
//  Apporio Taxi Driver
//
//  Created by AppOrio on 05/06/17.
//  Copyright © 2017 apporio. All rights reserved.
//

import UIKit
import GoogleMaps
import IQKeyboardManagerSwift
import AVFoundation
import Fabric
import Crashlytics
import Firebase
import UserNotifications
import GooglePlaces

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate, CLLocationManagerDelegate,ParsingStates {
    
    var window: UIWindow?
    var part1: String = ""
    var part2: String = ""
    var part3: String = ""
    
    var rentalridesyncdata: RentalRideSyncModel!
    
    var driversyncdata: DriverSyncModel!
    
    var storyboard: UIStoryboard = UIStoryboard()
    
    
    
    var locationManager = CLLocationManager()
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        switch status {
        case .notDetermined:
            // If status has not yet been determied, ask for authorization
            self.getCurrentAddress()
            manager.requestWhenInUseAuthorization()
            break
        case .authorizedWhenInUse:
            // If authorized when in use
            self.getCurrentAddress()
            manager.startUpdatingLocation()
            break
        case .authorizedAlways:
            // If always authorized
            self.getCurrentAddress()
            manager.startUpdatingLocation()
            break
        case .restricted:
            // If restricted by e.g. parental controls. User can't enable Location Services
            break
        case .denied:
            // If user denied your app access to Location Services, but can grant access from Settings.app
            break
            
        }
    }
    
    func getCurrentAddress()
    {
        
        
        let locManager = CLLocationManager()
        // var currentLocation = CLLocation()
        
        // locManager.requestWhenInUseAuthorization()
        
        
        if( CLLocationManager.authorizationStatus() == CLAuthorizationStatus.authorizedWhenInUse ||
            CLLocationManager.authorizationStatus() == CLAuthorizationStatus.authorizedAlways){
            
            if let   currentLocation = locManager.location
            {
                
                
                reverseGeocodeCoordinate(currentLocation.coordinate)
                
            }
            
        }
    }
    
    
    
    func reverseGeocodeCoordinate(_ coordinate: CLLocationCoordinate2D)  {
        
        // 1
        
        let geocoder = GMSGeocoder()
        
        // 2
        geocoder.reverseGeocodeCoordinate(coordinate) { response, error in
            if let address = response?.firstResult() {
                
                
                //  print(address.lines)
                // let lines = address.lines! as! [String]
                
                
                if let city = address.locality{
                    GlobalVariables.city  = String(city)
                    
                }
                else{
                    GlobalVariables.city = ""
                    
                }
                
                
            }
        }
    }
    
    
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        GMSServices.provideAPIKey("AIzaSyB8wJBEio6R-WEODEZ8CHyeN0icu1ihPHw")
        IQKeyboardManager.sharedManager().enable = true
        GMSPlacesClient.provideAPIKey("AIzaSyBHlEBeRKJvItmHK7HK6zCUa475I4UDyHQ")
        
        let device_id = UIDevice.current.identifierForVendor?.uuidString
        
        UserDefaults.standard.setValue(device_id, forKey:"unique_number")
        
        
        
        Fabric.with([Crashlytics.self])
        
        
        let langId = (Locale.current as NSLocale).object(forKey: NSLocale.Key.languageCode) as! String
        
        
        
        GlobalVariables.languagecode = langId
        
        
        print("Preferred language: \(langId)")
        
        UserDefaults.standard.set(langId, forKey: "PreferredLanguage")
        
        FirebaseApp.configure()
        
        
        if #available(iOS 10, *) {
            UNUserNotificationCenter.current().requestAuthorization(options:[.badge, .alert, .sound]){ (granted, error) in }
            application.registerForRemoteNotifications()
        }
            // iOS 9 support
        else if #available(iOS 9, *) {
            UIApplication.shared.registerUserNotificationSettings(UIUserNotificationSettings(types: [.badge, .sound, .alert], categories: nil))
            UIApplication.shared.registerForRemoteNotifications()
        }
            // iOS 8 support
        else if #available(iOS 8, *) {
            UIApplication.shared.registerUserNotificationSettings(UIUserNotificationSettings(types: [.badge, .sound, .alert], categories: nil))
            UIApplication.shared.registerForRemoteNotifications()
            
        }
            // iOS 7 support
        else {
            application.registerForRemoteNotifications(matching: [.badge, .sound, .alert])
        }
        
        return true
    }
    
    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }
    
    func applicationDidEnterBackground(_ application: UIApplication) {
        
        
        GlobalVariables.timerForGetDriverLocation5.invalidate()
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }
    
    func applicationWillEnterForeground(_ application: UIApplication) {
        
        
        GlobalVariables.timerForGetDriverLocation5.fire()
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }
    
    func applicationDidBecomeActive(_ application: UIApplication) {
        
        if  GlobalVariables.locationdidactive == 0{
            
            
        }else{
            
            if CLLocationManager.locationServicesEnabled() {
                switch(CLLocationManager.authorizationStatus()) {
                case .notDetermined, .restricted, .denied:
                    print("No access")
                    
                    self.showalert5(message: "To continue, let your device turn on location, which uses Google's location services.Please turn on your location from settings.")
                    
                    // This Application required location permissions to run this app. Please turn on your location from settings.
                    
                case .authorizedAlways, .authorizedWhenInUse:
                    print("Access")
                }
            } else {
                print("Location services are not enabled")
            }
            
        }
        
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }
    
    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }
    
    func application(_ application: UIApplication, didRegister notificationSettings: UIUserNotificationSettings) {
        print("Notifications status: \(notificationSettings)")
        
        if notificationSettings.types == UIUserNotificationType(rawValue: 0){
            print(notificationSettings.types)
            
            GlobalVariables.notificationvalue = 1
            
            let deviceTokenValue = "7eba6f12589ea1d618359dc10d5633e031aae26a50023e531f712659975a7013"
            
            UserDefaults.standard.setValue(deviceTokenValue, forKey:"device_key")
            //  self.showalert2("Please first turn on Notification from Settings.")
            
            
        }else{
            print(notificationSettings.types)
            
            GlobalVariables.notificationvalue = 0
        }
        
        
    }
    
    
    
    
    func application(_ application: UIApplication, didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data) {
        // Convert token to string
        let deviceTokenString = deviceToken.reduce("", {$0 + String(format: "%02X", $1)})
        
        GlobalVariables.notificationvalue = 0
        print(deviceTokenString)
        // let device_id = UIDevice.currentDevice().identifierForVendor?.UUIDString
        
        //  NSUserDefaults.standardUserDefaults().setObject(device_id, forKey: "DeviceId")
        UserDefaults.standard.setValue(deviceTokenString, forKey:"device_key")
        
        UserDefaults.standard.synchronize()
        
        
    }
    
    // Called when APNs failed to register the device for push notifications
    func application(_ application: UIApplication, didFailToRegisterForRemoteNotificationsWithError error: Error) {
        
        print("APNs registration failed: \(error)")
    }
    
    
    
    func application(_ application: UIApplication, didReceiveRemoteNotification data: [AnyHashable : Any]) {
        // Print notification payload data
        
        print("Push notification received: \(data)")
        
        
        if let aps = data["aps"] as? NSDictionary {
            
            print(aps["ride_status"] as! String)
            
            if let alert = aps["alert"] as? NSString {
                //Do stuff
                part1 = alert as String
                print("Part 1: \(part1)")
                
                
                part2 = aps["ride_id"] as! String
                print("Part 2: \(part2)")
                
                part3 = aps["ride_status"] as! String
                print("Part 3: \(part3)")
                
            }
        }
        
        
        
        
        if ( application.applicationState == UIApplicationState.inactive || application.applicationState == UIApplicationState.background  || application.applicationState == UIApplicationState.active )
        {
            AudioServicesPlaySystemSound(1016);
            
            
            if(part3 == "1"){
                
                let driverid = NsUserDefaultManager.SingeltonInstance.getuserdetails(key: NsUserDefaultManager.KeyDriverid)!
                
                GlobalVariables.rideid = part2
                
                UserDefaults.standard.setValue("1", forKey:"firebaseride_status")
                
                //  GlobalVariables.firebasedriverride = 1
                
                if (GlobalVariables.firebasedriverride == 1){
                    
                    
                }else{
                    
                    
                    
                    APIManager.sharedInstance.delegate = self
                    APIManager.sharedInstance.DriverSync(part2, DriverId: driverid)
                }
                
                
            }
            
            if(part3 == "2"){
                /* GlobalVariables.rideid = part2
                 
                 let driverid = NsUserDefaultManager.SingeltonInstance.getuserdetails(key: NsUserDefaultManager.KeyDriverid)!
                 
                 APIManager.sharedInstance.delegate = self
                 APIManager.sharedInstance.DriverSync(part2, DriverId: driverid)*/
                
                self.showalert("Ride has been cancelled by user")
                
                
                //  self.showalert("Ride has been cancelled by user")
            }
            if(part3 == "51"){
                
                
                let storyboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
                let nextController: NotificationViewController = storyboard.instantiateViewController(withIdentifier: "NotificationViewController") as! NotificationViewController
                
                
                var presentedVC = self.window?.rootViewController
                
                while (presentedVC!.presentedViewController != nil)  {
                    presentedVC = presentedVC!.presentedViewController
                }
                presentedVC!.present(nextController, animated: true, completion: nil)
                
                
                
                
            }
            
            
            
            
            if(part3 == "20"){
                GlobalVariables.rideid = part2
                
                let driverid = NsUserDefaultManager.SingeltonInstance.getuserdetails(key: NsUserDefaultManager.KeyDriverid)!
                
                APIManager.sharedInstance.delegate = self
                APIManager.sharedInstance.DriverSyncHomeScreeen(DriverId: driverid)
                
                // APIManager.sharedInstance.delegate = self
                // APIManager.sharedInstance.DriverSync(part2, DriverId: driverid)
                
                
                
            }
            
            
            if(part3 == "8"){
                
                let driverid = NsUserDefaultManager.SingeltonInstance.getuserdetails(key: NsUserDefaultManager.KeyDriverid)!
                
                GlobalVariables.rideid = part2
                
                APIManager.sharedInstance.delegate = self
                APIManager.sharedInstance.DriverSync(part2, DriverId: driverid)
                
                
            }
            
            
            if(part3 == "10"){
                
                
                //  GlobalVariables.rideid = part2
                
                //  GlobalVariables.firebasedriverride = 1
                
                UserDefaults.standard.setValue("10", forKey:"firebaseride_status")
                
                if (GlobalVariables.firebasedriverride == 1){
                    
                    
                }else{
                    
                    GlobalVariables.rideid = part2
                    
                    APIManager.sharedInstance.delegate = self
                    APIManager.sharedInstance.RentalDriverSync(RentalBookindId: part2)
                }
                
            }
            
            if(part3 == "15"){
                
                
                GlobalVariables.rideid = part2
                
                self.showalert("Ride has been cancelled by user")
                
                //   APIManager.sharedInstance.delegate = self
                // APIManager.sharedInstance.RentalDriverSync(RentalBookindId: part2)
                
                
            }
            
            if(part3 == "17"){
                
                
                let driverid = NsUserDefaultManager.SingeltonInstance.getuserdetails(key: NsUserDefaultManager.KeyDriverid)!
                
                GlobalVariables.rideid = part2
                
                APIManager.sharedInstance.delegate = self
                APIManager.sharedInstance.DriverSync(part2, DriverId: driverid)
                
            }
            
            
            if(part3 == "19"){
                
                
                GlobalVariables.rideid = part2
                
                APIManager.sharedInstance.delegate = self
                APIManager.sharedInstance.RentalDriverSync(RentalBookindId: part2)
                
                
            }
            
            
        }
        
        
    }
    
    
    func showalert(_ message:String)  {
        
        DispatchQueue.main.async(execute: {
            
            let alertController = UIAlertController(title: "Cancelled", message:message, preferredStyle: .alert)
            
            
            let OKAction = UIAlertAction(title: "ok", style: .default) { (action) in
                let storyboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
                let nextController: OnLineViewController = storyboard.instantiateViewController(withIdentifier: "OnLineViewController") as! OnLineViewController
                var presentedVC = self.window?.rootViewController
                while (presentedVC!.presentedViewController != nil)  {
                    presentedVC = presentedVC!.presentedViewController
                }
                presentedVC!.present(nextController, animated: true, completion: nil)
                
            }
            alertController.addAction(OKAction)
            var presentedVC = self.window?.rootViewController
            while (presentedVC!.presentedViewController != nil)  {
                presentedVC = presentedVC!.presentedViewController
            }
            presentedVC!.present(alertController, animated: true){
                
                
                //self.presentViewController(alertController, animated: true) {
                
            }
            
            
        })
        
        
        
    }
    
    func showalert5(message:String)  {
        
        DispatchQueue.main.async(execute: {
            
            let alertController = UIAlertController(title:   NSLocalizedString("Alert", comment: ""), message:message, preferredStyle: .alert)
            
            
            let OKAction = UIAlertAction(title: NSLocalizedString("ok", comment: ""), style: .default) { (action) in
                
                
                UIApplication.shared.openURL(NSURL(string: UIApplicationOpenSettingsURLString)! as URL)
                
            }
            alertController.addAction(OKAction)
            
            var presentedVC = self.window?.rootViewController
            
            while (presentedVC!.presentedViewController != nil)  {
                presentedVC = presentedVC!.presentedViewController
            }
            
            presentedVC!.present(alertController, animated: true) {
                
            }
            
            
            
            
        })
        
    }
    
    
    
    
    func showalert1(_ message:String)  {
        
        DispatchQueue.main.async(execute: {
            
            let alertController = UIAlertController(title: "Alert", message:message, preferredStyle: .alert)
            
            
            let OKAction = UIAlertAction(title: "ok", style: .default) { (action) in
                
                let storyboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
                let nextController: OnLineViewController = storyboard.instantiateViewController(withIdentifier: "OnLineViewController") as! OnLineViewController
                var presentedVC = self.window?.rootViewController
                while (presentedVC!.presentedViewController != nil)  {
                    presentedVC = presentedVC!.presentedViewController
                }
                presentedVC!.present(nextController, animated: true, completion: nil)
                
                
                
            }
            alertController.addAction(OKAction)
            
            var presentedVC = self.window?.rootViewController
            
            while (presentedVC!.presentedViewController != nil)  {
                presentedVC = presentedVC!.presentedViewController
            }
            
            presentedVC!.present(alertController, animated: true) {
                
            }
            
            
        })
        
    }
    
    func shownewalert1(message:String)  {
        
        DispatchQueue.main.async(execute: {
            
            let alertController = UIAlertController(title: "Alert", message:message, preferredStyle: .alert)
            
            
            let OKAction = UIAlertAction(title: "ok", style: .default) { (action) in
                
                let storyboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
                let nextController: TrackRideViewController = storyboard.instantiateViewController(withIdentifier: "TrackRideViewController") as! TrackRideViewController
                var presentedVC = self.window?.rootViewController
                while (presentedVC!.presentedViewController != nil)  {
                    presentedVC = presentedVC!.presentedViewController
                }
                presentedVC!.present(nextController, animated: true, completion: nil)
                
                
                
                
            }
            alertController.addAction(OKAction)
            
            var presentedVC = self.window?.rootViewController
            
            while (presentedVC!.presentedViewController != nil)  {
                presentedVC = presentedVC!.presentedViewController
            }
            
            presentedVC!.present(alertController, animated: true) {
                
            }
            
            
        })
        
    }
    
    
    func onSuccessState(_ data: AnyObject , resultCode: Int) {
        
        if resultCode == 2006 {
            
            driversyncdata = data as! DriverSyncModel
            
            if(driversyncdata.result == 0){
                
                self.showalert1("Your Notification has been expired!!")
                
                
            }else
            {
                if(driversyncdata.details?.rideStatus == "1"){
                    
                    print("Ride Id \(GlobalVariables.rideid)")
                    let storyboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
                    let nextController: AcceptRejectViewController = storyboard.instantiateViewController(withIdentifier: "AcceptRejectViewController") as! AcceptRejectViewController
                    var presentedVC = self.window?.rootViewController
                    while (presentedVC!.presentedViewController != nil)  {
                        presentedVC = presentedVC!.presentedViewController
                    }
                    presentedVC!.present(nextController, animated: true, completion: nil)
                    
                    
                }
                
                if(driversyncdata.details?.rideStatus == "8"){
                    
                    print("Ride Id \(GlobalVariables.rideid)")
                    let storyboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
                    let nextController: AcceptRejectViewController = storyboard.instantiateViewController(withIdentifier: "AcceptRejectViewController") as! AcceptRejectViewController
                    var presentedVC = self.window?.rootViewController
                    while (presentedVC!.presentedViewController != nil)  {
                        presentedVC = presentedVC!.presentedViewController
                    }
                    presentedVC!.present(nextController, animated: true, completion: nil)
                    
                    
                }
                
                
                if(driversyncdata.details?.rideStatus == "2"){
                    
                    self.showalert("Ride has been cancelled by user")
                }
                
                if(driversyncdata.details?.rideStatus == "17"){
                    
                    self.showalert("Ride has been cancelled by Admin")
                }
                
                
                
                
                
                
            }
            
            
        }
        
        
        if resultCode == 8006 {
            
            rentalridesyncdata = data as! RentalRideSyncModel
            
            
            
            if(rentalridesyncdata.status == 0){
                
                self.showalert1("Your Notification has been expired!!")
                
                
            }else
            {
                
                if(rentalridesyncdata.details?.bookingStatus == "10"){
                    
                    
                    print("Ride Id \(GlobalVariables.rideid)")
                    let storyboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
                    let nextController: RentalAcceptRejectViewController = storyboard.instantiateViewController(withIdentifier: "RentalAcceptRejectViewController") as! RentalAcceptRejectViewController
                    var presentedVC = self.window?.rootViewController
                    while (presentedVC!.presentedViewController != nil)  {
                        presentedVC = presentedVC!.presentedViewController
                    }
                    presentedVC!.present(nextController, animated: true, completion: nil)
                    
                    
                }
                
                
                if(rentalridesyncdata.details?.bookingStatus == "15"){
                    
                    self.showalert("Ride has been cancelled by user")
                }
                
                if(rentalridesyncdata.details?.bookingStatus == "19"){
                    
                    self.showalert("Ride has been cancelled by Admin")
                }
                
                
                
                
            }
            
            
        }
        
        if (resultCode == 8019){
            
            driversyncdata = data as! DriverSyncModel
            
            if(driversyncdata.result == 0){
                
                self.showalert1("Your Notification has been expired!!")
                
            }else
            {
                
                
                if(driversyncdata.details?.rideStatus == "3"){
                    
                    
                    self.shownewalert1(message: "Drop location has been changed by customer")
                }
                
                if(driversyncdata.details?.rideStatus == "5"){
                    
                    
                    self.shownewalert1(message: "Drop location has been changed by customer")
                }
                
                if(driversyncdata.details?.rideStatus == "6"){
                    
                    self.shownewalert1(message: "Drop location has been changed by customer")
                    
                }
                
                
            }
            
            
        }
        
        
    }
    
}








